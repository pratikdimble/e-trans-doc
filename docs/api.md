# API Reference

This document describes the **RESTful API endpoints** for the **E-Trans Dashboard** backend, built with **Spring Boot 3** and **Java 17**. All endpoints use **JWT authentication** (except login/signup).

---

## 🔑 Authentication

### 1. Login

**POST** `/auth/login`

**Request Body:**

```json id="x3b9fs"
{
  "username": "admin",
  "password": "password123"
}
````

**Response:**

```json id="q0l2cv"
{
  "token": "jwt_access_token",
  "refreshToken": "jwt_refresh_token",
  "role": "ROLE_ADMIN"
}
```

---

### 2. Signup / Register

**POST** `/auth/register`

**Request Body:**

```json id="t8f0qp"
{
  "username": "newuser",
  "password": "password123"
}
```

**Response:**

* `201 Created` on success
* Toast message: *"Account created successfully! Please login."*

---

### 3. Logout

* Handled on frontend by clearing auth store (`authStore.clearAuth()`).
* JWT is invalidated on client side.

---

## 👥 Customers

### a. Get All Customers

**GET** `/customers`

**Headers:** `Authorization: Bearer <token>`

**Response:**

```json id="v9h2kb"
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "1234567890"
  }
]
```

### b. Create Customer

**POST** `/customers`

**Request Body:**

```json id="d1k3rm"
{
  "name": "Jane Smith",
  "email": "jane@example.com",
  "phone": "9876543210"
}
```

### c. Update Customer

**PUT** `/customers/{id}`

**Request Body:** Same as create.

### d. Delete Customer

**DELETE** `/customers/{id}`

---

## 📦 Materials

* **GET** `/materials` – List all materials
* **POST** `/materials` – Add a new material
* **PUT** `/materials/{id}` – Update material
* **DELETE** `/materials/{id}` – Delete material

**Request Example:**

```json id="p7q4nc"
{
  "name": "Steel Rod",
  "quantity": 100,
  "unit": "kg"
}
```

---

## 🚚 Vehicles

* **GET** `/vehicles` – List all vehicles
* **POST** `/vehicles` – Add new vehicle
* **PUT** `/vehicles/{id}` – Update vehicle details
* **DELETE** `/vehicles/{id}` – Remove vehicle

**Request Example:**

```json id="m8r2ka"
{
  "registrationNumber": "MH12AB1234",
  "type": "Truck",
  "capacity": 5000
}
```

---

## 🗺️ Routes

* **GET** `/routes` – List all routes
* **POST** `/routes` – Add new route
* **PUT** `/routes/{id}` – Update route
* **DELETE** `/routes/{id}` – Remove route

**Request Example:**

```json id="f4j9xe"
{
  "name": "Route 1",
  "source": "Warehouse A",
  "destination": "Client X"
}
```

---

## 🏢 Outward Shipments

* **GET** `/outward` – List shipments
* **POST** `/outward` – Create shipment
* **PUT** `/outward/{id}` – Update shipment
* **DELETE** `/outward/{id}` – Delete shipment

---

## 🧾 Invoices

* **GET** `/bills` – List invoices
* **POST** `/bills` – Create invoice
* **PUT** `/bills/{id}` – Update invoice
* **DELETE** `/bills/{id}` – Delete invoice

**Request Example:**

```json id="s9d1kh"
{
  "customerId": 1,
  "materialId": 2,
  "quantity": 50,
  "totalAmount": 5000
}
```

---

## 📊 Reports (Admin Only)

* **GET** `/reports/summary` – Dashboard metrics
* **GET** `/reports/financial` – Financial reports
* **GET** `/reports/gstr1` – GSTR1 tax reports

---

## 🏢 Companies (Admin Only)

* **GET** `/company` – List companies
* **POST** `/company` – Add new company
* **PUT** `/company/{id}` – Update company
* **DELETE** `/company/{id}` – Delete company

---

## 👤 Users (Admin Only)

* **GET** `/users` – List all users
* **POST** `/users` – Create a new user
* **PUT** `/users/{id}` – Update user role
* **DELETE** `/users/{id}` – Delete user

---

## 📄 Credit Notes (Admin Only)

* **GET** `/credit-notes` – List credit notes
* **POST** `/credit-notes` – Create credit note
* **PUT** `/credit-notes/{id}` – Update credit note
* **DELETE** `/credit-notes/{id}` – Delete credit note

---

> ⚠️ All endpoints (except `/auth/login` and `/auth/register`) require **JWT Bearer Token** in the `Authorization` header.

```

