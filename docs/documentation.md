# **E-Trans Admin System Documentation**

---

## **Table of Contents**

1. [Overview](#overview)
2. [Module Hierarchy](#module-hierarchy)
3. [Module Details](#module-details)

   * Company
   * Customer
   * Vehicle
   * Route
   * Material
   * Trip
   * Bill
   * Credit Note
   * Dashboard Summary
   * GSTR-1 Report
4. [API Mapping](#api-mapping)
5. [Filters and Computed Summaries](#filters-and-computed-summaries)
6. [Authentication and Token Refresh Flow](#authentication-and-token-refresh-flow)
7. [Notes on Aggregation and Computation Logic](#notes-on-aggregation-and-computation-logic)

---

## **Overview**

E-Trans Admin is a comprehensive logistics and financial reporting platform. It allows users to manage operational entities (Company, Customer, Vehicle, Route, Material, Trip, Bill, Credit Note) and generate both **real-time summaries** and **GST-compliant reports** (GSTR-1).

The system uses:

* **Vue 3 + Composition API** for the frontend
* **Axios** with JWT authentication for API requests
* **Reactive filtering and computed summaries** for dynamic dashboards
* **Module-based structure** for modular maintenance

---

## **Module Hierarchy**

```
E-Trans Admin
│
├── Company
├── Customer
├── Vehicle
├── Route
├── Material
├── Trip
├── Bill
├── Credit Note
├── Dashboard Summary
│   ├── Filters
│   ├── Summary Cards
│   ├── Charts
│   └── Paginated Invoices Table
└── GSTR-1 Report
    ├── Filters
    ├── Summary Cards
    ├── Customer-wise Aggregation
    ├── B2B / B2C Reports
    └── HSN Summary
```

---

## **Module Details**

### **Company Module**

* **Purpose:** Manage company master data
* **Key Entities:** Name, Address, GSTIN, PAN, Contact
* **APIs:**

  * `GET /company` → List companies
  * `POST /company` → Create company
  * `PUT /company/{id}` → Update company
  * `DELETE /company/{id}` → Delete company

### **Customer Module**

* **Purpose:** Manage customer information
* **Key Fields:** Name, GSTIN, Contact, Billing Address
* **APIs:**

  * `GET /customer` → List customers
  * `POST /customer` → Create customer
  * `PUT /customer/{id}` → Update customer
  * `DELETE /customer/{id}` → Delete customer

### **Vehicle Module**

* **Purpose:** Manage vehicles used for trips
* **Key Fields:** Vehicle Number, Type, Owner, Capacity
* **APIs:**

  * `GET /vehicle` → List vehicles
  * `POST /vehicle` → Create vehicle
  * `PUT /vehicle/{id}` → Update vehicle
  * `DELETE /vehicle/{id}` → Delete vehicle

### **Route Module**

* **Purpose:** Define and manage transportation routes
* **Key Fields:** Route Name, Source, Destination, Distance
* **APIs:**

  * `GET /route` → List routes
  * `POST /route` → Create route
  * `PUT /route/{id}` → Update route
  * `DELETE /route/{id}` → Delete route

### **Material Module**

* **Purpose:** Manage material inventory and descriptions
* **Key Fields:** Material Name, Code, Unit, HSN Code
* **APIs:**

  * `GET /material` → List materials
  * `POST /material` → Create material
  * `PUT /material/{id}` → Update material
  * `DELETE /material/{id}` → Delete material

### **Trip Module**

* **Purpose:** Track logistics trips
* **Key Fields:** Trip No, Vehicle, Material, Quantity, Route, Dates
* **APIs:**

  * `GET /trip` → List trips
  * `POST /trip` → Create trip
  * `PUT /trip/{id}` → Update trip
  * `DELETE /trip/{id}` → Delete trip

### **Bill Module**

* **Purpose:** Generate invoices for completed trips
* **Key Fields:** Bill No, Customer, Trip(s), Taxable Amount, GST
* **B2B vs B2C:**

  * B2B → GSTIN present
  * B2C → GSTIN absent
* **APIs:**

  * `GET /bill` → List invoices
  * `POST /bill` → Create invoice
  * `PUT /bill/{id}` → Update invoice
  * `DELETE /bill/{id}` → Delete invoice

### **Credit Note Module**

* **Purpose:** Adjust invoices for returns or corrections
* **Key Fields:** Credit Note No, Original Bill No, Amount, Reason
* **APIs:**

  * `GET /credit-note` → List credit notes
  * `POST /credit-note` → Create credit note
  * `PUT /credit-note/{id}` → Update credit note
  * `DELETE /credit-note/{id}` → Delete credit note

### **Dashboard Summary Module**

* **Filters:** Year/Month/Quarter, Start/End Date, Search (Customer/Vehicle/Bill No)
* **Summary Cards:** Total Revenue, Total Received, Total Pending
* **Charts:** Top 5 Customers, Monthly Revenue, Pending vs Received, Vehicle Revenue
* **Invoices Table:** Paginated with totals

### **GSTR-1 Report Module**

* **Filters:** Customer, From Date, To Date
* **Summary Cards:** Total Taxable, CGST, SGST, IGST
* **Customer-wise Aggregation:** GSTIN-based totals
* **B2B / B2C Reports:** Separate tables
* **HSN Summary:** Material-wise quantity aggregation

---

## **API Mapping**

| Module            | Endpoint                 | Method | Parameters                                            | Description                            |
| ----------------- | ------------------------ | ------ | ----------------------------------------------------- | -------------------------------------- |
| Company           | `/company`               | GET    | `page, size`                                          | Fetch company list                     |
| Customer          | `/customer`              | GET    | `page, size`                                          | Fetch customer list                    |
| Vehicle           | `/vehicle`               | GET    | `page, size`                                          | Fetch vehicle list                     |
| Route             | `/route`                 | GET    | `page, size`                                          | Fetch route list                       |
| Material          | `/material`              | GET    | `page, size`                                          | Fetch material list                    |
| Trip              | `/trip`                  | GET    | `page, size`                                          | Fetch trip list                        |
| Bill              | `/bill`                  | GET    | `page, size`                                          | Fetch invoice list                     |
| Credit Note       | `/credit-note`           | GET    | `page, size`                                          | Fetch credit notes                     |
| Dashboard Summary | `/dashboard/summary`     | GET    | `year, month, startDate, endDate, search, page, size` | Summary cards, charts, paginated bills |
| Dashboard Summary | `/dashboard/suggestions` | GET    | `query`                                               | Autocomplete for filters               |
| GSTR-1 Report     | `/dashboard/filter`      | GET    | `customerId, fromDate, toDate, page, size`            | Filtered report data                   |
| Authentication    | `/auth/login`            | POST   | `username, password`                                  | Login                                  |
| Authentication    | `/auth/refresh`          | POST   | `refreshToken`                                        | Refresh token                          |

---

## **Filters and Computed Summaries**

* All modules support `page` and `size` pagination
* Dashboard and GSTR-1 modules have advanced filters with default date ranges
* Computed metrics include totals, taxes, and aggregated quantities

---

## **Authentication and Token Refresh Flow**

* JWT Bearer token attached automatically via Axios interceptor
* `401` triggers refresh token request (`/auth/refresh`)
* Multiple concurrent requests are queued while refreshing
* Logs out user if refresh token fails

---

## **Notes on Aggregation and Computation Logic**

* **Customer-wise totals**: sums by GSTIN
* **B2B / B2C**: segregated by presence/absence of GSTIN
* **HSN summary**: aggregates material quantities across trips
* **Dashboard metrics**: sum invoice totals for revenue/received/pending

