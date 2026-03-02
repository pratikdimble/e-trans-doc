## 🔹 Axios API Client Setup

```js
import axios from 'axios'
import { API_BASE_URL } from '@/urlconfig.js'
import { useAuthStore } from '@/stores/auth'
```

* Creates a reusable `axios` instance with:

  * `baseURL` from config
  * JSON `Content-Type`
  * 30-second timeout

```js
const apiClient = axios.create({
  baseURL: API_BASE_URL,
  headers: { 'Content-Type': 'application/json' },
  timeout: 30000,
})
```

---

## 🔹 Request Interceptor

```js
apiClient.interceptors.request.use(config => {
  const authStore = useAuthStore()
  if (authStore.token) config.headers.Authorization = `Bearer ${authStore.token}`
  return config
})
```

* Attaches **Authorization header** with Bearer token from Pinia `authStore`.
* Ensures every request is authenticated automatically.

---

## 🔹 Response Interceptor (Token Refresh)

Handles expired tokens and retries failed requests safely.

```js
let isRefreshing = false
let failedQueue = []
```

* `isRefreshing` prevents multiple simultaneous refresh attempts.
* `failedQueue` stores requests that arrived while refresh is in progress.

---

### **Key Logic**

1. **Skip refresh for auth endpoints**:

```js
if (originalRequest.url?.includes('/auth/login') ||
    originalRequest.url?.includes('/auth/register') ||
    originalRequest.url?.includes('/auth/refresh')) {
  return Promise.reject(error)
}
```

* Avoid infinite loops for login/registration/refresh requests.

2. **Handle 401 (Unauthorized)**:

```js
if (error.response?.status === 401 && !originalRequest._retry) {
  if (!authStore.refreshToken) {
    authStore.clearAuth()
    return Promise.reject(error)
  }
```

* Checks if refresh token exists.
* Marks the request as `_retry` to avoid multiple retries.

3. **Queue requests during refresh**:

```js
if (isRefreshing) {
  return new Promise((resolve, reject) => {
    failedQueue.push({ resolve, reject })
  }).then(token => {
    originalRequest.headers.Authorization = `Bearer ${token}`
    return apiClient(originalRequest)
  })
}
```

* Ensures that multiple simultaneous API calls don’t all trigger separate refresh requests.
* Queued requests retry automatically once refresh succeeds.

4. **Perform token refresh**:

```js
const res = await apiClient.post('/auth/refresh', {
  refreshToken: authStore.refreshToken
})
const newAccessToken = res.data.accessToken
authStore.setToken(newAccessToken)
processQueue(null, newAccessToken)
```

* Calls `/auth/refresh` endpoint.
* Updates the auth store with the new access token.
* Resolves queued requests with the new token.

5. **Retry the original request**:

```js
originalRequest.headers.Authorization = `Bearer ${newAccessToken}`
return apiClient(originalRequest)
```

* Automatically retries the failed request using the new token.

6. **Handle refresh failure**:

```js
processQueue(err, null)
authStore.clearAuth()
return Promise.reject(err)
```

* Logs the user out if refresh fails.
* Clears queued requests with an error.

---

### ✅ Advantages of This Approach

* Automatic token injection.
* Handles **concurrent requests safely** with a refresh queue.
* Prevents infinite refresh loops.
* Seamless user experience: requests retry automatically after token refresh.

---

### ⚡ Optional Improvements / Tips

1. **Optional Refresh Endpoint Timeout**:
   Sometimes a short timeout for refresh requests can help avoid long delays.

2. **Custom Error Handling**:
   Could dispatch a global notification if token refresh fails.

3. **Cancel Pending Requests on Logout**:
   When `authStore.clearAuth()` is called, consider cancelling pending requests to prevent unwanted retries.

