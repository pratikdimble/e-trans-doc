# Vehicle Module

The **Vehicle Module** in **E-Trans Dashboard** allows users to **add, update, and manage vehicles** associated with transporters. This module ensures accurate tracking of all vehicles used for logistics operations.

---

## 🔹 Features

- Add new vehicles
- Edit existing vehicle details
- Real-time toast notifications for success, warning, or error
- Automatic redirection after save/update

---

## 🖥️ Form Fields

| Field             | Type   | Description |
|------------------|--------|-------------|
| Transporter Name | Text   | Name of the transporter (Required) |
| Vehicle Number   | Text   | Unique vehicle registration number (Required) |
| Vehicle Type     | Text   | Type of vehicle (Truck, Van, etc.) (Required) |

---

## 📝 Example Usage (Vue 3 + Pinia)

```javascript
import { ref } from 'vue'
import apiClient from '@/axios'

const vehicle = ref({
  transporterName: 'ABC Transport',
  number: 'MH12AB1234',
  type: 'Truck'
})

const saveVehicle = async () => {
  try {
    await apiClient.post('/vehicle', vehicle.value)
    console.log('Vehicle added successfully')
  } catch (error) {
    console.error('Error saving vehicle', error)
  }
}
````

---

## 🔗 API Endpoints

| Action         | Method | Endpoint        | Description                      |
| -------------- | ------ | --------------- | -------------------------------- |
| Add Vehicle    | POST   | `/vehicle`      | Add a new vehicle                |
| Update Vehicle | PUT    | `/vehicle/{id}` | Update an existing vehicle       |
| Get Vehicle    | GET    | `/vehicle/{id}` | Fetch a single vehicle’s details |
| List Vehicles  | GET    | `/vehicle`      | Fetch all vehicles               |

---

## ✅ Workflow

1. Navigate to **Vehicles** from the sidebar.
2. Click **Add Vehicle** or **Edit** an existing vehicle.
3. Fill in all required fields.
4. Click **Save** or **Update**.
5. Toast notifications will appear:

   * ✅ Success
   * ⚠ Warning (e.g., duplicate vehicle number)
   * ❌ Error (validation failure or server error)
6. On success, the page redirects to **Vehicle List**.

---

## 📷 Screenshot (Example)

![Vehicle Module](../assets/vehicles.png)
