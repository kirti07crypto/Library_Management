# 📚  Library Management System


## ✨ Features

* **Book Grid:** Dynamic 2x2 display of library books.
* **Details Modal:** View book descriptions and stock without page refreshes.
* **Management Portal:** Add, Edit, and Delete books and categories.

## 🛠️ How to Setup
To run this project on your laptop, follow these steps exactly:

### 1. Database Setup
1. Open **SQL Server Management Studio (SSMS)**.
2. Open the file `Library_script.sql` included in this repository.
3. Press **Execute** (F5). This will create the database and fill it with our book data.

### 2. Connection String
1. Open the project in **Visual Studio**.
2. Go to `Functions.cs`.
3. Update the connection string:
   * Change the `Data Source` to your local SQL instance (e.g., `.\SQLEXPRESS`).

### 3. Run the Project
1. Open the `.slnx` file.
2. Press the **Green Play Button** (IIS Express) to launch the site.
