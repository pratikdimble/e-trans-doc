# E-Trans Dashboard

![E-Trans Logo](assets/logo.png)

**E-Trans** is a full-stack logistics management system designed to streamline transportation, inventory, and billing operations for companies. It provides role-based dashboards for administrators and company users, built with **Vue 3**, **Java 17 Spring Boot**, and **PostgreSQL**.

---

## 🚀 Features

- **Role-Based Access Control**
  - Admins: manage companies, users, credit notes, reports, and GSTR1.
  - Company users: handle customers, vehicles, routes, materials, invoices, and outward shipments.

- **Dynamic Dashboard**
  - Sidebar navigation with active link highlighting.
  - Responsive main content area for dashboards, tables, and forms.
  - Global toast notifications for system alerts.

- **Comprehensive Modules**
  - Summary Dashboard (Admin only)
  - Customer & Material Management
  - Routes & Vehicles
  - Outward Shipments & Invoices
  - Reports & GSTR1 Export (Admin only)
  - Credit Notes & Company Management
  - User Management (Admin only)

- **UI/UX Highlights**
  - Modern, clean, and responsive layout.
  - Gradient sidebar with hover effects and icon animations.
  - Compact design for fast navigation.

---

## 🏗️ Tech Stack

| Layer        | Technology |
|-------------|------------|
| Frontend    | Vue 3, Vue Router, Composition API, Bootstrap Icons |
| Backend     | Java 17, Spring Boot 3, Spring Security, Spring Data JPA |
| Database    | PostgreSQL |
| Build Tools | Maven/Gradle, Node.js, Vite |

---

## 📐 Architecture

```mermaid
graph TD
    A[Vue 3 Frontend] -->|REST API| B[Spring Boot Backend]
    B -->|JPA/Hibernate| C[PostgreSQL Database]
````

---

## 💻 Installation & Setup

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/e-trans-dashboard.git
cd e-trans-dashboard
```

2. **Backend Setup (Spring Boot + PostgreSQL)**

* Configure `application.properties` with your PostgreSQL credentials.
* Build and run the backend:

```bash
./mvnw spring-boot:run
```

3. **Frontend Setup (Vue 3)**

```bash
cd frontend
npm install
npm run dev
```

4. Open your browser at `http://localhost:5173` (or port shown in terminal).

---

## 📸 Screenshots

### Dashboard

![Dashboard Screenshot](assets/dashboard.png)

### Customer Management

![Customer Screenshot](assets/customers.png)

### Vehicle Management

![Vehicle Screenshot](assets/vehicles.png)

---

## 🔑 Authentication & Roles

* **Admin**

  * Full access to all modules.
  * Can manage users, companies, financial data, and reports.
* **Company User**

  * Access to operational modules like customers, routes, vehicles, and invoices.

---

## 📄 Usage

* Navigate through the sidebar to access modules.
* Admin-only pages are visible based on role.
* Use **Global Toast** notifications for success/error feedback.
* Logout via the button on the top right.

---

## 📁 Repository Structure

```
e-trans-dashboard/
├── backend/        # Spring Boot application
├── frontend/       # Vue 3 dashboard
├── docs/           # Documentation for GitHub Pages
├── README.md
└── LICENSE
```

---

## 📌 License

This project is licensed under the MIT License.

<a href="{{ '/' | relative_url }}">Home</a>  <a href="{{ '/installation' | relative_url }}">Installation</a>
