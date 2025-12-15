<%@ page language="java" import="com.myproject.crudapp.model.Book"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book-Form</title>
</head>
<body>
    <h1>MVC CRUD APPLICATION </h1>
    <h3>SERVLET + JSP + JDBC</h3>

    <%
        Book book = (Book)request.getAttribute("book");
        boolean isEdit = (book != null);
    %>
    <h4><%= (isEdit ? "Edit " : "Add" )%> Book</h4>

    <form action="book?action=<%=(isEdit ? "update" :"insert") %>" method="post">
    <%
        if(isEdit){
    %>
             <input type="hidden" name="id" value="<%= book.getId()%>">
    <%
        }
    %>

        <label>Enter Title</label>
        <input type="text" name="title" value="<%= (isEdit ? book.getTitle() : "" )%>"><br><br>

        <label>Enter Author</label>
        <input type="text" name="author" value="<%= (isEdit ? book.getAuthor() : "" )%>"><br><br>

        <label>Enter Category</label>
        <input type="text" name="category" value="<%= (isEdit ? book.getCategory() : "" )%>"><br><br>

        <label>Enter Price</label>
        <input type="text" name="price" value="<%= (isEdit ? book.getPrice() : "" )%>"><br><br>

        <button type="submit">Save<button>
        <a href="book">Cancel</a>
    </form>

</body>
</html>





