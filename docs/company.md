# Company Module

The **Company Module** in **E-Trans Dashboard** allows administrators to **add, update, and manage company details**. This is an **admin-only module** used to maintain the companies using the dashboard.

---

## 🔹 Features

- Add new companies
- Edit existing company details
- Mobile number validation (Indian 10-digit format)
- GSTIN validation
- Prefix and Suffix for company codes
- Real-time toast notifications for success, warning, or error
- Automatic redirection after save/update

---

## 🖥️ Form Fields

| Field       | Type   | Description |
|------------|--------|-------------|
| Name       | Text   | Name of the company (Required) |
| Address    | Text   | Full address of the company (Required) |
| Mobile No  | Text   | Indian mobile number, 10 digits starting with 6-9 (Required) |
| GSTIN      | Text   | Company GST Identification Number (Required) |
| Prefix     | Text   | Code prefix for company documents (Required) |
| Suffix     | Text   | Code suffix for company documents (Required) |

---

## ⚡ Validations

### Mobile Number

- Must be **10 digits**
- Must start with **6,7,8, or 9**
- Regex: `^[6-9]\d{9}$`

### GSTIN

- Must follow the Indian GSTIN format  
- Regex: `^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$`

---

## 📝 Example Usage (Vue 3 + Pinia)

```javascript
import { ref } from 'vue'
import apiClient from '@/axios'

const company = ref({
  name: 'ABC Pvt Ltd',
  address: '123, Industrial Area, Mumbai',
  mobileNo: '9876543210',
  gstin: '27ABCDE1234F2Z5',
  prefix: 'ABC',
  suffix: '001'
})

const saveCompany = async () => {
  try {
    await apiClient.post('/dashboard/company', company.value)
    console.log('Company added successfully')
  } catch (error) {
    console.error('Error saving company', error)
  }
}
````

---

## 🔗 API Endpoints

| Action         | Method | Endpoint                  | Description                      |
| -------------- | ------ | ------------------------- | -------------------------------- |
| Add Company    | POST   | `/dashboard/company`      | Add a new company                |
| Update Company | PUT    | `/dashboard/company/{id}` | Update existing company          |
| Get Company    | GET    | `/dashboard/company/{id}` | Fetch a single company's details |
| List Companies | GET    | `/dashboard/company`      | Fetch all companies              |

---

## ✅ Workflow

1. Navigate to **Company Module** from the sidebar (Admin only).
2. Click **Add Company** or **Edit** an existing company.
3. Fill in all required fields.
4. Validation will prevent invalid Mobile Numbers or GSTIN.
5. Click **Save** or **Update**.
6. Toast notifications will appear:

   * ✅ Success
   * ⚠ Warning (e.g., duplicate company)
   * ❌ Error (validation failure or server error)
7. On success, the page redirects to **Dashboard** or **Company List**.

---

## 📷 Screenshot (Example)

![Add Company Screenshot](assets/company-form.png)

````

---

This `company.md` can now go into your `docs/` folder, linked via `_sidebar.md` like:

```markdown
* [Home](README.md)
* [Installation](installation.md)
* [Usage](usage.md)
* [API Reference](api.md)
* [Company Module](company.md)
````
