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

    <style>
        /* ===== GLOBAL GREEN GRADIENT ===== */
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #198754, #157347);
            overflow-x: hidden;
            position: relative;
        }

        /* ===== GLOBAL FLOATING SHAPES ===== */
        .global-shapes {
            position: fixed;
            inset: 0;
            z-index: 0;
            pointer-events: none;
        }

        .shape {
            position: absolute;
            border-radius: 50%;
            opacity: 0.18;
            animation: floatShape 12s infinite ease-in-out alternate;
        }

        .shape1 { width: 220px; height: 220px; background: #fff; top: -60px; left: -60px; }
        .shape2 { width: 160px; height: 160px; background: #fff; bottom: 60px; right: -50px; animation-duration: 15s; }
        .shape3 { width: 120px; height: 120px; background: #fff; top: 50%; left: 65%; animation-duration: 18s; }

        @keyframes floatShape {
            from { transform: translateY(0px) rotate(0deg); }
            to { transform: translateY(45px) rotate(20deg); }
        }

        /* ===== FLOATING BOOK ICON ===== */
        .floating-book {
            font-size: 70px;
            margin-bottom: 20px;
            color: white;
            animation: floatBook 4s ease-in-out infinite;
        }

        @keyframes floatBook {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-12px); }
            100% { transform: translateY(0px); }
        }

        /* ===== FORM ANIMATION ===== */
        .form-container {
            animation: slideIn 0.8s ease forwards;
            opacity: 0;
            transform: translateX(40px);
        }

        @keyframes slideIn {
            to { opacity: 1; transform: translateX(0); }
        }

        /* ===== ENSURE CONTENT ABOVE SHAPES ===== */
        .container-fluid,
        .left-panel,
        .form-card,
        header,
        footer {
            position: relative;
            z-index: 2;
        }

        .form-card {
            border-radius: 20px;
            transition: 0.3s ease;
        }

        .form-card:hover {
            transform: translateY(-3px);
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #198754;
        }

        .error-text {
            font-size: 0.85rem;
            margin-top: 4px;
        }

        @media (max-width: 991px) {
            .left-panel { display: none; }
        }
    </style>
</head>

<body>

<!-- ===== GLOBAL BACKGROUND SHAPES ===== -->
<div class="global-shapes">
    <div class="shape shape1"></div>
    <div class="shape shape2"></div>
    <div class="shape shape3"></div>
</div>

<%@ include file="header.jsp" %>

<%
    Book book = (Book) request.getAttribute("book");
    boolean isEdit = (book != null);
%>

<div class="container-fluid">
    <div class="row min-vh-100">

        <!-- LEFT PANEL -->
        <div class="col-lg-5 d-none d-lg-flex left-panel align-items-center justify-content-center p-5">

            <div class="text-white text-center">
                <div class="floating-book">
                    <i class="bi bi-book-half"></i>
                </div>

                <h2 class="fw-bold">Book Management</h2>
                <p class="mt-3">
                    Manage your books efficiently using our modern MVC CRUD system.
                    Add, update and organize your collection seamlessly.
                </p>

                <div class="mt-4">
                    <div class="d-flex align-items-center mb-3">
                        <i class="bi bi-check-circle-fill me-2"></i> Easy Add & Edit
                    </div>
                    <div class="d-flex align-items-center mb-3">
                        <i class="bi bi-lightning-fill me-2"></i> Fast & Responsive
                    </div>
                    <div class="d-flex align-items-center">
                        <i class="bi bi-shield-check me-2"></i> Secure System
                    </div>
                </div>
            </div>

        </div>

        <!-- RIGHT PANEL -->
        <div class="col-12 col-lg-7 d-flex align-items-center justify-content-center p-4">

            <div class="w-100 form-container" style="max-width: 500px;">
                <div class="card form-card border-0 shadow-lg">
                    <div class="card-body p-4 p-md-5">

                        <!-- Form Title -->
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

                        <form action="book?action=<%= isEdit ? "update" : "insert" %>" method="post">

                            <% if (isEdit) { %>
                                <input type="hidden" name="id" value="<%= book.getId() %>">
                            <% } %>

                            <!-- Title -->
                            <div class="form-floating mb-3">
                                <input type="text" name="title" class="form-control"
                                       placeholder="Title" required
                                       value="<%= (request.getParameter("title")!=null) ? request.getParameter("title") : isEdit ? book.getTitle() : "" %>">
                                <label><i class="bi bi-book me-1"></i>Title</label>
                                <% String titleError = (String) request.getAttribute("titleError"); %>
                                <div class="text-danger error-text"><%= (titleError != null) ? titleError : "" %></div>
                            </div>

                            <!-- Author -->
                            <div class="form-floating mb-3">
                                <input type="text" name="author" class="form-control"
                                       placeholder="Author" required
                                       value="<%= (request.getParameter("author")!=null) ? request.getParameter("author") : isEdit ? book.getAuthor() : "" %>">
                                <label><i class="bi bi-person me-1"></i>Author</label>
                                <% String authorError = (String) request.getAttribute("authorError"); %>
                                <div class="text-danger error-text"><%= (authorError != null) ? authorError : "" %></div>
                            </div>

                            <!-- Category -->
                            <div class="form-floating mb-3">
                                <input type="text" name="category" class="form-control"
                                       placeholder="Category" required
                                       value="<%= (request.getParameter("category")!=null) ? request.getParameter("category") : isEdit ? book.getCategory() : "" %>">
                                <label><i class="bi bi-tags me-1"></i>Category</label>
                                <% String categoryError = (String) request.getAttribute("categoryError"); %>
                                <div class="text-danger error-text"><%= (categoryError != null) ? categoryError : "" %></div>
                            </div>

                            <!-- Price -->
                            <div class="form-floating mb-4">
                                <input type="number" step="0.01" name="price" class="form-control"
                                       placeholder="Price" required
                                       value="<%= (request.getParameter("price")!=null) ? request.getParameter("price") : isEdit ? book.getPrice() : "" %>">
                                <label><i class="bi bi-currency-rupee me-1"></i>Price</label>
                                <% String priceError = (String) request.getAttribute("priceError"); %>
                                <div class="text-danger error-text"><%= (priceError != null) ? priceError : "" %></div>
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex flex-column flex-sm-row gap-3">
                                <button type="submit" class="btn btn-success rounded-pill px-4 w-100">
                                    <i class="bi bi-check-circle me-1"></i>
                                    <%= isEdit ? "Update" : "Save" %>
                                </button>

                                <a href="book" class="btn btn-outline-secondary rounded-pill px-4 w-100">
                                    <i class="bi bi-arrow-left me-1"></i> Cancel
                                </a>
                            </div>

                        </form>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="footer.jsp" %>
</body>
</html>