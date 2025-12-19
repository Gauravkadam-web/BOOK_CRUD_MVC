<%@ page language="java" import="java.util.*, com.myproject.crudapp.model.Book"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Home</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome 7 -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<body class="bg-light">

<div class="container py-5">

    <!-- Header -->
    <div class="text-center mb-4">
        <h2 class="fw-bold text-primary-emphasis">
            <i class="fa-solid fa-book-open me-2"></i>MVC CRUD APPLICATION
        </h2>
        <!-- <p class="text-secondary mb-0">Servlet + JSP + JDBC</p> -->
    </div>

    <!-- Success Message -->
    <%
        String msg = request.getParameter("success");
        if (msg != null) {
    %>
        <div class="alert alert-success alert-dismissible fade show text-center shadow-sm">
            <i class="fa-solid fa-circle-check me-1"></i> <%= msg %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <%
        }
    %>

    <!-- Action Bar -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h5 class="fw-semibold mb-0">
            <i class="fa-solid fa-book-open me-1"></i> Book List
        </h5>

        <a href="book?action=add"
           class="btn btn-success rounded-pill px-4 shadow-sm">
            <i class="fa-solid fa-plus me-1"></i> Add Book
        </a>
    </div>

    <!-- Table Card -->
    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-0">

            <table class="table table-hover align-middle mb-0">
                <thead class="table-primary text-center">
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody class="text-center">
                <%
                    int cnt = 1;
                    List<Book> books = (List<Book>) request.getAttribute("books");
                    if (books != null && !books.isEmpty()) {
                        for (Book b : books) {
                %>
                    <tr>
                        <td><%= cnt++ %></td>
                        <td class="fw-semibold"><%= b.getTitle() %></td>
                        <td><%= b.getAuthor() %></td>
                        <td>
                            <span class="badge bg-info-subtle text-info-emphasis rounded-pill">
                                <%= b.getCategory() %>
                            </span>
                        </td>
                        <td>
                            <i class="fa-solid fa-coins me-1 text-success"></i>
                            <%= b.getPrice() %>
                        </td>
                        <td>
                            <a href="book?action=edit&id=<%= b.getId() %>"
                               class="btn btn-sm btn-outline-warning rounded-circle me-1"
                               title="Edit">
                                <i class="fa-solid fa-pen"></i>
                            </a>

                            <a href="book?action=delete&id=<%= b.getId() %>"
                               onclick="return confirm('Are you sure you want to delete this book?')"
                               class="btn btn-sm btn-outline-danger rounded-circle"
                               title="Delete">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">
                            <i class="fa-solid fa-circle-info me-1"></i>
                            No Records Found
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>

            </table>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
