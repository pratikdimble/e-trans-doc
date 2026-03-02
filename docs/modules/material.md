# Materials Module

The **Materials Module** in **E-Trans Dashboard** allows users to **add, update, and manage materials** handled or transported by vehicles. This module ensures proper tracking of materials associated with customer orders and routes.

---

## 🔹 Features

- Add new materials
- Edit existing material descriptions
- Real-time toast notifications for success, warning, or error
- Automatic redirection after save/update

---

## 🖥️ Form Fields

| Field               | Type   | Description |
|--------------------|--------|-------------|
| Material Description | Text   | Name or description of the material (Required) |

---

## 📝 Example Usage (Vue 3 + Pinia)

```javascript
import { ref } from 'vue'
import apiClient from '@/axios'

const material = ref({
  materialDesc: 'Cement Bags'
})

const saveMaterial = async () => {
  try {
    await apiClient.post('/material', material.value)
    console.log('Material added successfully')
  } catch (error) {
    console.error('Error saving material', error)
  }
}
````

---

## 🔗 API Endpoints

| Action          | Method | Endpoint         | Description                       |
| --------------- | ------ | ---------------- | --------------------------------- |
| Add Material    | POST   | `/material`      | Add a new material                |
| Update Material | PUT    | `/material/{id}` | Update an existing material       |
| Get Material    | GET    | `/material/{id}` | Fetch a single material’s details |
| List Materials  | GET    | `/material`      | Fetch all materials               |

---

## ✅ Workflow

1. Navigate to **Materials** from the sidebar.
2. Click **Add Material** or **Edit** an existing material.
3. Fill in the **Material Description** field.
4. Click **Save** or **Update**.
5. Toast notifications will appear:

   * ✅ Success
   * ⚠ Warning (duplicate material)
   * ❌ Error (validation or server error)
6. On success, the page redirects to **Materials List**.

---

## 📷 Screenshot (Example)

![Materials Form Screenshot](assets/materials-form.png)

````id="xz1mno"

---

To link this in your `_sidebar.md`:

```markdown
* [Company Module](company.md)
* [Customer Module](customer.md)
* [Vehicle Module](vehicle.md)
* [Routes Module](routes.md)
* [Materials Module](materials.md)
````
