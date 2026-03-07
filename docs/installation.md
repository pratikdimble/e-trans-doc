# Installation & Setup (Local Environment)

This guide explains how to set up the **E-Trans Dashboard** on your local machine, including backend, frontend, and database configuration.

---

## 1️⃣ Clone the Repository
**Required request for Repository access**
```bash
git clone https://github.com/yourusername/e-trans-dashboard.git
cd e-trans-dashboard
````

---

## 2️⃣ Backend Setup (Spring Boot + PostgreSQL)

### a. Configure PostgreSQL

1. Install PostgreSQL if you haven’t already.
2. Create a database, e.g., `etrans_db`.
3. Update `backend/src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/etrans_db
spring.datasource.username=your_db_user
spring.datasource.password=your_db_password
spring.jpa.hibernate.ddl-auto=update
```

### b. Run the Backend

```bash
cd backend
./mvnw spring-boot:run
```

The backend will start on `http://localhost:8080` by default.

---

## 3️⃣ Frontend Setup (Vue 3 + Pinia)

### a. Install Dependencies

```bash
cd frontend
npm install
```

### b. Run the Frontend

```bash
npm run dev
```

Open your browser at `http://localhost:5173` (or the port shown in the terminal).

---

## 4️⃣ Authentication Module

The dashboard uses **Pinia** for state management. The `auth` store handles login, signup, and session management:

```javascript
import { useAuthStore } from '@/stores/auth'

const authStore = useAuthStore()

// Login
await authStore.login('username', 'password')

// Signup
await authStore.signup('username', 'password')

// Logout
authStore.clearAuth()
```

**Key features:**

* **Token & Role Storage:** Saved in `localStorage`.
* **Role-Based Access:** Admin vs Company User dashboards.
* **Toast Notifications:** Login/signup feedback via `GlobalToast`.

---

## 5️⃣ Environment Variables (Optional)

If using a `.env` file for frontend:

```env
VITE_API_BASE_URL=http://localhost:8080
```

Make sure the frontend points to the backend API correctly.

---

## 6️⃣ Ready to Use

Once both backend and frontend are running:

* Navigate to `http://localhost:5173` to see the dashboard.
* Admin login credentials can be configured via backend seed data or created via `/auth/register`.
* Company users can be added by the Admin after login.

---

## ⚡ Notes

* Ensure your PostgreSQL service is running before starting the backend.
* The backend supports JWT authentication, so tokens must be stored and passed with requests.
* Vue 3 components and Pinia stores are reactive; any changes in the auth store will automatically update UI elements like sidebar links.

