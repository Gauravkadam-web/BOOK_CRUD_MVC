<%@ page language="java" import="java.util.*, com.myproject.crudapp.model.Book"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book-Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="container mt-4">
    <h2 class="text-center mb-3">MVC CRUD APPLICATION </h2>
    <h5 class="text-center mb-3">SERVLET + JSP + JDBC</h5>
<%
    String msg = (String)request.getParameter("success");
    if(msg != null){
%>
    <div class="alert alert-success text-center"><%= msg %></div>
<%
    }
%>


    <a href="book?action=add" class="btn btn-primary mb-3">
        <i class="fa-solid fa-user-plus me-1"></i>Add Books
     </a>
    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark">
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
                          <a href="book?action=edit&id=<%= b.getId()%>"
                            class="btn btn-warning btn-sm me-1">
                            <i class="fa-solid fa-pen-to-square "></i>
                          </a>
                          <a href="book?action=delete&id=<%= b.getId()%>"
                            onclick="return confirm('Are you sure to delete?')"
                            class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-trash"></i>
                          </a>
                    </td>
                </tr>
        <%
                }
            }else{
        %>
            <tr>
                <td colspan="6" class="text-center">No Records Found !<td>
            </tr>
        <%
          }
        %>
        </tbody>
    </table>
</body>
</html>





