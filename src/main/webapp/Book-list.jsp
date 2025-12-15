<%@ page language="java" import="java.util.*, com.myproject.crudapp.model.Book"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book-Home</title>
</head>
<body>
    <h1>MVC CRUD APPLICATION </h1>
    <h3>SERVLET + JSP + JDBC</h3>
<%
    String msg = (String)request.getParameter("success");
    if(msg != null){
%>
    <p style="color:green"><%= msg %></p>
<%
    }
%>


    <a href="book?action=add"> ADD Book</a>
    <table border="1" cellpadding="10">
        <thead>
            <th>#</th>
            <th>TITLE</th>
            <th>AUTHOR</th>
            <th>CATEGORY</th>
            <th>PRICE</th>
            <th>STATUS</th>
        </thead>
        <tbody>
        <%
            int cnt = 1;
            List<Book> books = (List<Book>)request.getAttribute("books");
            if(books != null && !books.isEmpty()){
                for(Book b : books){
        %>
                <tr>
                    <td><%= cnt++ %></td>
                    <td><%= b.getTitle() %></td>
                    <td><%= b.getAuthor() %></td>
                    <td><%= b.getCategory() %></td>
                    <td><%= b.getPrice() %></td>
                    <td>
                          <a href="book?action=edit&id=<%= b.getId()%>">Edit</a>
                          <a href="book?action=delete&id=<%= b.getId()%>"
                          onclick="return confirm('Are you sure to delete?')">Delete</a>
                    </td>
                </tr>
        <%
                }
            }else{
        %>
            <tr>
                <td colspan="6" style="color:red">No Records Found !<td>
            </tr>
        <%
          }
        %>
        </tbody>
    </table>
</body>
</html>





