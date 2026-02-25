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

    <style>
/* ===============================
   SEAMLESS LIGHT ANIMATED THEME
=============================== */

body {
    min-height: 100vh;
    margin: 0;
    background: linear-gradient(
        120deg,
        #f8fffc,
        #eef9f3,
        #f6fffb,
        #ffffff
    );
    background-size: 400% 400%;
    animation: gradientMove 18s ease infinite;
}

/* Floating glow */
body::before {
    content: "";
    position: fixed;
    top: -200px;
    left: -200px;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(0, 200, 120, 0.08), transparent 70%);
    animation: floatGlow 12s ease-in-out infinite alternate;
    z-index: -1;
}

body::after {
    content: "";
    position: fixed;
    bottom: -200px;
    right: -200px;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(0, 150, 255, 0.06), transparent 70%);
    animation: floatGlow 15s ease-in-out infinite alternate-reverse;
    z-index: -1;
}

@keyframes gradientMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

@keyframes floatGlow {
    0% { transform: translate(0,0); }
    100% { transform: translate(40px,40px); }
}

/* ===============================
   SOFT UI
=============================== */

.card {
    background: rgba(255,255,255,0.8);
    backdrop-filter: blur(8px);
    border-radius: 20px;
    transition: 0.3s ease;
}

.card:hover {
    transform: translateY(-3px);
}

.table thead {
    background: rgba(13,110,253,0.08);
}

.table-hover tbody tr:hover {
    background-color: rgba(0,0,0,0.03);
}

/* Buttons */
.btn {
    transition: 0.25s ease;
}

.btn-success:hover,
.btn-primary:hover {
    transform: translateY(-2px);
}

/* Pagination */
.pagination .page-link {
    border-radius: 12px;
    margin: 0 3px;
}

/* ===============================
   MOBILE RESPONSIVE
=============================== */

@media (max-width: 992px) {

    .container {
        padding-left: 10px;
        padding-right: 10px;
    }

    h2 {
        font-size: 1.4rem;
    }

    .action-bar {
        flex-direction: column;
        align-items: stretch !important;
        gap: 12px;
    }

    .action-bar h5 {
        text-align: center;
    }

    .action-bar .btn {
        width: 100%;
    }

    .control-section {
        flex-direction: column;
        gap: 12px;
        align-items: stretch !important;
    }

    .control-section form {
        width: 100%;
        justify-content: space-between;
    }

    .table {
        font-size: 0.9rem;
    }

    .table th,
    .table td {
        white-space: nowrap;
        padding: 10px 8px;
    }

    .pagination {
        flex-wrap: wrap;
        gap: 5px;
    }

}

/* Extra small phones */
@media (max-width: 576px) {

    .table {
        font-size: 0.85rem;
    }

    .badge {
        font-size: 0.75rem;
    }

    .btn-sm {
        padding: 4px 7px;
    }

}

    </style>
</head>

<body class="bg-light">

<%@ include file="header.jsp" %>

<div class="container py-4">

    <!-- Header -->
    <div class="text-center mb-4">
        <h2 class="fw-bold text-primary-emphasis">
            <i class="fa-solid fa-book-open me-2"></i>MVC CRUD APPLICATION
        </h2>
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
    <div class="d-flex justify-content-between align-items-center mb-3 action-bar">
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

            <!-- Responsive Table Wrapper -->
            <div class="table-responsive">
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

<%
    int totalPages = (int)request.getAttribute("totalPages");
    int currentPage = (int)request.getAttribute("currentPage");
    int pageSize = (int)request.getAttribute("pageSize");
%>

    <!-- Controls -->
    <div class="d-flex justify-content-between align-items-center mt-3 control-section">

        <form action="book" method="POST" class="d-flex align-items-center">
            <span class="text-muted me-2">Show</span>
            <select name="pageSize"
                    class="form-select form-select-sm me-2"
                    style="width:70px;"
                    onchange="this.form.submit()">
                <option value="5" <%= (pageSize == 5 ? "selected" : "") %>>5</option>
                <option value="10" <%= (pageSize == 10 ? "selected" : "") %>>10</option>
                <option value="15" <%= (pageSize == 15 ? "selected" : "") %>>15</option>
                <option value="20" <%= (pageSize == 20 ? "selected" : "") %>>20</option>
                <option value="25" <%= (pageSize == 25 ? "selected" : "") %>>25</option>
                <option value="50" <%= (pageSize == 50 ? "selected" : "") %>>50</option>
                <option value="75" <%= (pageSize == 75 ? "selected" : "") %>>75</option>
                <option value="100" <%= (pageSize == 100 ? "selected" : "") %>>100</option>
            </select>
            <span class="text-muted">Entries</span>
        </form>

        <form action="book" method="POST" class="d-flex align-items-center">
            <span class="text-muted me-2">Go to</span>
            <input type="hidden" name="pageSize" value="<%=pageSize%>"/>
            <input type="number" name="page"
                class="form-control form-control-sm me-2"
                min="1"
                max="<%=totalPages%>"
                style="width:70px;">
            <button class="btn btn-primary btn-sm">GO</button>
        </form>

    </div>

    <!-- Pagination (UNCHANGED DESIGN) -->
    <% if( totalPages > 1) { %>
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">

            <li class="page-item <%= (currentPage==1)? "disabled" : "" %>">
                <a class="page-link" href="book?page=1&pageSize=<%=pageSize%>">
                    <i class="fa-solid fa-backward-fast"></i>
                </a>
            </li>

            <li class="page-item <%= (currentPage==1)? "disabled" : "" %>">
                <a class="page-link" href="book?page=<%= currentPage-1 %>&pageSize=<%=pageSize%>">
                    <i class="fa-solid fa-chevron-left"></i>
                </a>
            </li>

            <% for(int i=1 ; i<=totalPages ; i++) { %>
                <li class="page-item <%= (i==currentPage)? "active" : "" %>">
                    <a class="page-link" href="book?page=<%=i%>&pageSize=<%=pageSize%>">
                        <%=i%>
                    </a>
                </li>
            <% } %>

            <li class="page-item  <%= (currentPage==totalPages)? "disabled" : "" %>">
                <a class="page-link" href="book?page=<%= currentPage+1 %>&pageSize=<%=pageSize%>">
                    <i class="fa-solid fa-chevron-right"></i>
                </a>
            </li>

            <li class="page-item  <%= (currentPage==totalPages)? "disabled" : "" %>">
                <a class="page-link" href="book?page=<%= totalPages %>&pageSize=<%=pageSize%>">
                    <i class="fa-solid fa-forward-fast"></i>
                </a>
            </li>

          </ul>
        </nav>
    <% } %>

</div>

<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>