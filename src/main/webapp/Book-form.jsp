<%@ page language="java" import="com.myproject.crudapp.model.Book"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <title>Book Form</title>
</head>

<body class="bg-light">

<%
    Book book = (Book) request.getAttribute("book");
    boolean isEdit = (book != null);
%>

<div class="container py-5">

    <!-- Header -->
    <div class="text-center mb-4">
        <h2 class="fw-bold text-primary-emphasis">
            <i class="bi bi-book-half me-2"></i>MVC CRUD APPLICATION
        </h2>
   <%-- <p class="text-secondary mb-0">Servlet + JSP + JDBC</p> --%>
    </div>

    <!-- Form Card -->
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card border-0 shadow-lg rounded-4">
                <div class="card-body p-4">

                    <!-- Form Title -->
                    <%--
                    <h4 class="text-center mb-4">
                        <span class="badge rounded-pill px-4 py-2 fs-6
                            <%= isEdit
                                ? "bg-warning-subtle text-warning-emphasis"
                                : "bg-success-subtle text-success-emphasis" %>
                            shadow-sm">
                            <i class="bi <%= isEdit ? "bi-pencil-square" : "bi-plus-circle" %> me-2"></i>
                            <%= isEdit ? "Edit" : "Add" %> Book
                        </span>
                    </h4>
                    --%>
                    <div class="text-center mb-4">
                        <span class="d-inline-flex align-items-center gap-2
                            fw-semibold fs-5 px-4 py-2 rounded-pill shadow-sm
                            <%= isEdit
                                ? "bg-warning-subtle text-warning-emphasis"
                                : "bg-success-subtle text-success-emphasis" %>">
                            <i class="bi <%= isEdit ? "bi-pencil-square" : "bi-plus-circle" %>"></i>
                            <%= isEdit ? "Edit" : "Add" %> Book
                        </span>
                    </div>

                    <!-- Form -->
                    <form action="book?action=<%= isEdit ? "update" : "insert" %>" method="post">

                        <% if (isEdit) { %>
                            <input type="hidden" name="id" value="<%= book.getId() %>">
                        <% } %>

                        <!-- Title -->
                        <div class="form-floating mb-3">
                            <input type="text" name="title" class="form-control"
                                   placeholder="Title"
                                   value="<%= (request.getParameter("title")!=null) ? request.getParameter("title") : isEdit ? book.getTitle() : "" %>" >
                            <label><i class="bi bi-book me-1"></i>Title</label>
                            <% String titleError = (String) request.getAttribute("titleError");%>
                            <p class="text text-danger small mt-1"><%= (titleError != null )? titleError : ""%></p>
                        </div>

                        <!-- Author -->
                        <div class="form-floating mb-3">
                            <input type="text" name="author" class="form-control"
                                   placeholder="Author"
                                   value="<%= (request.getParameter("author")!=null) ? request.getParameter("author") :  isEdit ? book.getAuthor() : "" %>" >
                            <label><i class="bi bi-person me-1"></i>Author</label>
                             <% String authorError = (String) request.getAttribute("authorError");%>
                             <p class="text text-danger small mt-1"><%= (authorError != null )? authorError : ""%></p>
                        </div>

                        <!-- Category -->
                        <div class="form-floating mb-3">
                            <input type="text" name="category" class="form-control"
                                   placeholder="Category"
                                   value="<%= (request.getParameter("category")!=null) ? request.getParameter("category") : isEdit ? book.getCategory() : "" %>" >
                            <label><i class="bi bi-tags me-1"></i>Category</label>
                            <% String categoryError = (String) request.getAttribute("categoryError");%>
                            <p class="text text-danger small mt-1"><%= (categoryError != null )? categoryError : ""%></p>
                        </div>

                        <!-- Price -->
                        <div class="form-floating mb-4">
                            <input type="text"  name="price" class="form-control"
                                   placeholder="Price"
                                   value="<%= (request.getParameter("price")!=null) ? request.getParameter("price") : isEdit ? book.getPrice() : "" %>" >
                            <label><i class="bi bi-currency-rupee me-1"></i>Price</label>
                             <% String priceError = (String) request.getAttribute("priceError");%>
                             <p class="text text-danger small mt-1"><%= (priceError != null )? priceError : ""%></p>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-success rounded-pill px-4">
                                <i class="bi bi-check-circle me-1"></i>
                                <%= isEdit ? "Update" : "Save" %>
                            </button>

                            <a href="book" class="btn b tn-outline-secondary rounded-pill px-4">
                                <i class="bi bi-arrow-left me-1"></i>Cancel
                            </a>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
