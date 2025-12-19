# 📘 MVC CRUD Application for Books using JSP, Servlet, and JDBC (PostgreSQL)

A clean and modular **MVC web application** built using **JSP, Servlets, JDBC, and PostgreSQL**.  
This project demonstrates a professional backend structure with proper MVC layering, DAO pattern, centralized error handling, and complete CRUD operations for **Books**.

**GitHub Repository:**  
https://github.com/Gauravkadam-web/BOOK_CRUD_MVC

---

## 🚀 Features

### ✔ Core CRUD Operations
- Add a new book
- List all books
- Edit/update book details
- Delete book
- Success notifications after each operation
- Input validation (client-side + server-side)

### ✔ MVC Architecture
- **Model:** `Book.java`
- **DAO Layer:**
    - `BookDAO.java`
    - `BookDAOImpl.java`
    - `DAOException.java` *(inside exception package)*
- **Controller:** `BookServlet.java`
- **View:** JSP pages
    - `book-list.jsp`
    - `book-form.jsp`
    - `error.jsp`

### ✔ UI / UX Enhancements
- Clean and user-friendly JSP pages
- Responsive table layout
- Validation error messages
- Delete confirmation
- Form data retention on validation failure

### ✔ Error Handling
- Centralized `error.jsp`
- Custom `DAOException` inside exception package
- Root cause details shown during development

---

## 🛠️ Technology Stack

| Layer | Technology |
|------|-----------|
| Frontend | JSP, HTML5, CSS |
| Controller | Servlets |
| Backend | Java |
| Database | PostgreSQL |
| DB Access | JDBC (Prepared Statements) |
| Server | Apache Tomcat |
| Build Tool | Maven / Dynamic Web Project |

---

## 📂 Project Structure

```
BOOK_CRUD_MVC/
│
├── src/main/java/com/stackninjas/bookmvc/
│   ├── model/
│   │   └── Book.java
│   │
│   ├── dao/
│   │   ├── BookDAO.java
│   │   ├── BookDAOImpl.java
│   │
│   ├── exception/
│   │   └── DAOException.java
│   │
│   ├── util/
│   │   └── DBUtil.java
│   │
│   └── controller/
│       └── BookServlet.java
│
└── src/main/webapp/
    ├── book-list.jsp
    ├── book-form.jsp
    ├── error.jsp
    └── WEB-INF/
        └── web.xml
```

---

## 🗄️ Database Setup (PostgreSQL)

### Create Database
```sql
CREATE DATABASE bookdb;
```

### Create Table
```sql
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL
);
```

### Update Database Configuration

Update your database connection details in **DBUtil.java** or DAO class:

```java
private static final String URL = "jdbc:postgresql://localhost:5432/bookdb";
private static final String USER = "postgres";
private static final String PASSWORD = "your_password";
```

---

## ⚙️ How to Run the Project

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/Gauravkadam-web/BOOK_CRUD_MVC.git
```

### 2️⃣ Import into IDE
- Eclipse / IntelliJ IDEA
- Import as **Dynamic Web Project** or **Maven Project**

### 3️⃣ Configure PostgreSQL
- Ensure database `bookdb` exists
- Execute the table creation SQL

### 4️⃣ Configure Apache Tomcat
- Add Tomcat server (9 or above recommended)
- Deploy the project

### 5️⃣ Access the Application
```
http://localhost:8080/BOOK_CRUD_MVC/
```

---

## 🧪 Validation Features

### Client-Side
- Required field validation
- Numeric validation for price
- Length restrictions on text fields

### Server-Side
- All inputs validated again on backend
- Error messages displayed on JSP
- User input retained after validation failure

---

## 🐞 Error Handling

- All database errors wrapped inside `DAOException`
- Servlet catches exceptions and forwards to `error.jsp`
- Error page displays:
    - Error message
    - Root cause (for debugging)

---

## 🔮 Future Enhancements (Planned)

- Search books by title or author
- Pagination for large datasets
- Sorting (price, title, category)
- Category management
- Image upload for book cover
- Hibernate / JPA integration
- Authentication & authorization

---

## 📸 Screenshots

### ▶ Book List Page
*(Add screenshot here)*

### ▶ Add / Edit Book Form
*(Add screenshot here)*

### ▶ Delete Confirmation
*(Add screenshot here)*

### ▶ Error Page
*(Add screenshot here)*

---

## 🧠 What I Learned

- Implementing MVC architecture in Java web applications
- Using DAO pattern for clean database access
- Performing CRUD operations with JDBC & PostgreSQL
- Handling exceptions using a centralized error page
- Designing dynamic JSP pages with form handling
- Deploying Java web applications on Apache Tomcat

---

## 🤝 Contributing

Pull requests and feature suggestions are welcome.

---

## 📄 License

This project is open-source and licensed under the **MIT License**.

---

## 🙏 Acknowledgement

Developed as a solid MVC CRUD foundation before extending the application with advanced features such as pagination, authentication, and ORM frameworks.
