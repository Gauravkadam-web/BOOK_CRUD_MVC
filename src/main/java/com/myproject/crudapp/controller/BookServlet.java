package com.myproject.crudapp.controller;

import com.myproject.crudapp.dao.BookDAO;
import com.myproject.crudapp.dao.BookDAOImpl;
import com.myproject.crudapp.exception.BookDAOException;
import com.myproject.crudapp.model.Book;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ClientInfoStatus;
import java.util.List;

@WebServlet(urlPatterns = {"/books","/"})
public class BookServlet extends HttpServlet {
    BookDAO bookDao = null;
    @Override
    public void init(ServletConfig config) throws ServletException {
        bookDao =new BookDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null ) action="list";
        try{
            switch (action){
            case "add" -> showNewForm(request,response);
            case "edit" -> showEditForm(request,response);
            case "update" -> UpdateBook(request,response);
            case "delete" -> deleteBook(request,response);
            case "insert" -> insertBook(request,response);
            default -> listBooks(request,response);
            }
        } catch (BookDAOException e) {
            request.setAttribute("errorMessage",e.getMessage());
            request.setAttribute("errorCause",e.getCause());
            request.setAttribute("errorException",e);

            e.printStackTrace(); //developers logs

            request.getRequestDispatcher("error.jsp").forward(request,response);
        }

    }
    private void listBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookDao.getAllBooks();
        request.setAttribute("books",bookList);
        request.getRequestDispatcher("Book-list.jsp").forward(request,response);
    }
    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookDao.delete(id);
        request.getRequestDispatcher("books?action=list&success=Deleted Successfully").forward(request,response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));

        bookDao.insert(new Book(title,author,category,price));
        request.getRequestDispatcher("books?action=list&success=Inserted Successfully").forward(request,response);
    }


    private void UpdateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        bookDao.update(new Book(id,title,author,category,price));
        request.getRequestDispatcher("books?action=list&success=Updated Successfully").forward(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));
       Book book = bookDao.getBookById(id);
       request.setAttribute("book",book);
        request.getRequestDispatcher("Book-form.jsp").forward(request,response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Book-form.jsp").forward(request,response);
    }

}
