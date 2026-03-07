# Usage Guide

This guide explains how to use the **E-Trans Dashboard** after installation, including login/signup, navigation, and performing common operations.

---

## 1️⃣ Login / Signup

### a. Login

- Navigate to the login page: `http://localhost:5173/login`
- Enter your credentials (username & password).
- Upon successful login:
  - **Admin users**: Access all modules including Companies, Users, Credit Notes, Reports, and GSTR1.
  - **Company users**: Access Customers, Vehicles, Materials, Routes, Outward Shipments, and Invoices.

**Example using Pinia auth store:**

```javascript id="2aupxq"
const authStore = useAuthStore()
await authStore.login('username', 'password')
````

---

### b. Signup

* Navigate to the signup page: `http://localhost:5173/signup`
* Provide a unique username and password.
* After successful signup, login with the new account.

```javascript id="1gp0q8"
await authStore.signup('newuser', 'password123')
```

* Toast notifications will display success or errors.

---

## 2️⃣ Dashboard Overview

Once logged in, the main layout consists of:

* **Sidebar (Left)**

  * Displays modules based on your role.
  * Highlights the active page dynamically.
  * **Admin-only modules:** Companies, Users, Reports, Credit Notes, GSTR1.
  * **Common modules:** Customers, Materials, Vehicles, Routes, Outward, Invoices.

* **Main Content (Right)**

  * Displays the selected module.
  * All tables, forms, and dashboards are reactive.

* **Global Toast Notifications**

  * Appears at the top-right for success, warning, or error messages.

---

## 3️⃣ Key Modules & Actions

### a. Customers

* Add, edit, and delete customer records.
* Assign customers to routes or invoices.

### b. Materials

* Manage inventory items.
* Update stock quantities and track material usage.

### c. Routes

* Define routes for logistics operations.
* Assign vehicles and customers to specific routes.

### d. Vehicles

* Add, edit, and remove vehicles.
* Assign vehicles to routes and track availability.

### e. Outward Shipments

* Manage deliveries and outward shipments.
* Link shipments to customers, materials, and vehicles.

### f. Invoices

* Generate invoices for deliveries.
* View invoice history and print/export options.

### g. Reports (Admin Only)

* Generate operational and financial reports.
* Filter reports by date, company, route, or vehicle.

### h. GSTR1 (Admin Only)

* Export GST-related reports.
* View tax summaries for filing purposes.

### i. Credit Notes (Admin Only)

* Issue credit notes for returned or canceled orders.
* Maintain financial accuracy.

---

## 4️⃣ Role-Based Access

| Module            | Admin | Company User |
| ----------------- | :---: | :----------: |
| Summary Dashboard |   ✅   |       ❌      |
| Customers         |   ✅   |       ✅      |
| Materials         |   ✅   |       ✅      |
| Routes            |   ✅   |       ✅      |
| Vehicles          |   ✅   |       ✅      |
| Outward Shipments |   ✅   |       ✅      |
| Invoices          |   ✅   |       ✅      |
| Reports           |   ✅   |       ❌      |
| GSTR1             |   ✅   |       ❌      |
| Companies         |   ✅   |       ❌      |
| Users             |   ✅   |       ❌      |
| Credit Notes      |   ✅   |       ❌      |

---

## 5️⃣ Tips & Best Practices

* Always logout after finishing a session using the **Logout button** at the top-right.
* Use toast notifications to verify successful operations.
* Admins should set up companies and users before allowing company users to perform operations.
* Make regular backups of PostgreSQL data to prevent data loss.

---

## 6️⃣ Troubleshooting

* **Unable to login:** Ensure backend is running and API URL is correct.
* **Data not showing:** Verify that companies and users exist in the backend.
* **UI glitches:** Clear browser cache and reload the page.

---
