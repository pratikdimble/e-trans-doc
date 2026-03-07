# Taxation Module

The **Taxation Module** in **E-Trans Dashboard** allows administrators to **configure GST tax structures** used in transactions.  
This module supports **Intra-State and Inter-State taxation**, automatically calculating **CGST, SGST, or IGST** based on the selected tax type.

---

## 🔹 Features

- Add new tax configurations
- Select predefined tax percentages
- Support for **Intra-State (CGST + SGST)** and **Inter-State (IGST)** taxation
- Automatic CGST, SGST, and IGST calculation
- Real-time toast notifications for success, warning, or error
- Duplicate tax configuration prevention
- Automatic redirection after save

---

## 🖥️ Form Fields

| Field | Type | Description |
|------|------|-------------|
| Tax Percentage | Dropdown | Select a predefined GST percentage |
| Tax Type | Dropdown | Select tax type (IntraState / InterState) |
| CGST | Number | Central GST (Auto calculated for IntraState) |
| SGST | Number | State GST (Auto calculated for IntraState) |
| IGST | Number | Integrated GST (Auto calculated for InterState) |

---

## ⚡ Tax Calculation Logic

### Intra-State Tax

If the tax type is **IntraState**:

- CGST = Tax Percentage ÷ 2
- SGST = Tax Percentage ÷ 2
- IGST = `null`

Example:

| Tax % | CGST | SGST |
|------|------|------|
| 18% | 9% | 9% |

---

### Inter-State Tax

If the tax type is **InterState**:

- IGST = Tax Percentage
- CGST = `null`
- SGST = `null`

Example:

| Tax % | IGST |
|------|------|
| 18% | 18% |

---

## 📝 Example Usage (Vue 3 + Pinia)

```javascript
import { ref } from 'vue'
import apiClient from '@/axios'

const tax = ref({
  taxPercentageId: '',
  percentage: '',
  taxType: 'IntraState',
  cgst: 9,
  sgst: 9,
  igst: null
})

const saveTax = async () => {
  try {
    await apiClient.post('/taxes', tax.value)
    console.log('Tax saved successfully')
  } catch (error) {
    console.error('Error saving tax', error)
  }
}
```

---

## 🔗 API Endpoints

| Action | Method | Endpoint | Description |
|------|------|------|-------------|
| Add Tax | POST | `/taxes` | Add a new tax configuration |
| Get Tax Percentages | GET | `/taxes/tax-percentage` | Fetch available GST percentages |
| List Taxes | GET | `/taxes` | Fetch all tax configurations |

---

## ✅ Workflow

1. Navigate to **Taxation Module** from the sidebar.
2. Click **Add Tax**.
3. Select a **Tax Percentage**.
4. Select **Tax Type**:
   - **IntraState** → CGST & SGST will be auto-calculated.
   - **InterState** → IGST will be auto-calculated.
5. The system automatically fills the calculated fields.
6. Click **Save**.
7. Toast notifications will appear:

   * ✅ Success
   * ⚠ Warning (duplicate tax configuration)
   * ❌ Error (validation failure or server error)

8. On success, the page redirects to the **Tax List page**.

---

## 📷 Screenshot (Example)

![Taxation Module](../assets/taxation.png)
