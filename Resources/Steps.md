# 📘 Developer-Friendly Application Setup Guide

## 🔧 Prerequisites

Make sure you have the following installed:

* **Java 17+**
* **PostgreSQL**
* **Maven** *(optional, if building from source)*

---

## 🗄️ Database Setup

### 1. Create Database

```sql
CREATE DATABASE outward-db;
```
 or 
 Create a database with the following name:
 
 ```
outward-db
```

### 2. Create Schema

```sql
CREATE SCHEMA finance;
```
or Inside the database, create the following schema:

```
finance
```

> Ensure your DB user has full privileges on this schema.

---

## 📦 Download & Run Application

### Download Application

Download the **latest version (eg. v3.4.2)** of the application JAR file.

### Option 1: Run JAR

Open Command Prompt (CMD) and execute:

```
java -jar <jar-path>
```

Replace `<jar-path>` with the actual path of the downloaded JAR file.

```bash
Eg. java -jar app-3.4.2.jar
```

### Option 2: Run via IDE

* Import project
* Run main class

---

## 🚀 Access Application

```
http://localhost:8080/
```

---

## 👤 Initial Setup Flow

### 1. Create User

* Sign up via UI

### 2. Login as Super Admin

```
username: superadmin
password: Pd@#$2026
```

### 3. Promote User

* Go to Admin Panel
* Select user
* Assign **Admin Role**

---

## 🏢 Company Setup

* Login with updated user
* Create a company

---

## 🔄 Refresh Access

* Logout
* Login again

---

## ✅ You're Ready!

Start using the application 🎉
