<%@ page language="java" import="com.myproject.crudapp.model.Book"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <title>Book-Form</title>
</head>
<body class="container mt-4">
   <h2 class="text-center mb-3">MVC CRUD APPLICATION </h2>
   <h5 class="text-center mb-3">SERVLET + JSP + JDBC</h5>

    <%
        Book book = (Book)request.getAttribute("book");
        boolean isEdit = (book != null);
    %>

<!--
    <h4 class="mb-4 fw-bold">
        <span class="<%= isEdit
            ? "bg-warning-subtle text-warning-emphasis"
            : "bg-success-subtle text-success-emphasis" %> px-3 py-1 rounded">
            <%= (isEdit ? "Edit" : "Add") %> Book
        </span>
    </h4>
-->

<h4 class="mb-4 fw-bold">
    <span class="badge rounded-pill px-4 py-2 fs-6
        <%= isEdit
            ? "bg-warning-subtle text-warning-emphasis"
            : "bg-success-subtle text-success-emphasis" %>
        shadow-sm">

        <i class="bi <%= isEdit ? "bi-pencil-square" : "bi-plus-circle" %> me-2"></i>
        <%= (isEdit ? "Edit" : "Add") %> Book
    </span>
</h4>




    <form action="book?action=<%=(isEdit ? "update" :"insert") %>" method="post">
    <%
        if(isEdit){
    %>
             <input type="hidden" name="id" value="<%= book.getId()%>">
    <%
        }
    %>
        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-control" placeholder="Enter Title" value="<%= (isEdit ? book.getTitle() : "" )%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Author</label>
            <input type="text" name="author" class="form-control" placeholder="Enter Label" value="<%= (isEdit ? book.getAuthor() : "" )%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Category</label>
            <input type="text" name="category" class="form-control" placeholder="Enter Category" value="<%= (isEdit ? book.getCategory() : "" )%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Price</label>
            <input type="text" name="price" class="form-control" placeholder="Enter Price" value="<%= (isEdit ? book.getPrice() : "" )%>">
        </div>

        <button type="submit" class="btn btn-success">Save</button>
        <a href="book" class="btn btn-danger">Cancel</a>
    </form>

</body>
</html>





