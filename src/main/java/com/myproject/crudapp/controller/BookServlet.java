package com.myproject.crudapp.controller;

import com.myproject.crudapp.dao.BookDAO;
import com.myproject.crudapp.dao.BookDAOHibernate;
import com.myproject.crudapp.dao.BookDAOHibernateImpl;
import com.myproject.crudapp.dao.BookDAOImpl;
import com.myproject.crudapp.exception.BookDAOException;
import com.myproject.crudapp.model.Book;
import com.myproject.crudapp.model.Pagination;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ClientInfoStatus;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet("/book")
public class BookServlet extends HttpServlet {
    BookDAO bookDao = null;
//    BookDAOHibernate bookDao = null;
    @Override
    public void init(ServletConfig config) throws ServletException {
      bookDao =new BookDAOImpl();
//        bookDao = new BookDAOHibernateImpl();
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
        int page = 1; //default page
        int pageSize = 5;   //default page size

        if(request.getParameter("page")!=null)
            page = Integer.parseInt(request.getParameter("page"));
        if(request.getParameter("pageSize")!=null)
            pageSize = Integer.parseInt(request.getParameter("pageSize"));

        Pagination pagination = new Pagination(page,pageSize);

        int totalRecords = bookDao.countBooks();
        int totalPages = (int)Math.ceil((double) totalRecords / pageSize);

        if(page<1)
            page = 1;
        if(page>totalPages)
            page = totalPages;

        pagination.setPage(page);

        List<Book> bookList = bookDao.getSelectedBooks(pagination);

        request.setAttribute("books",bookList);
        request.setAttribute("totalPages",totalPages);
        request.setAttribute("currentPage",page);
        request.setAttribute("pageSize",pageSize);

        request.getRequestDispatcher("Book-list.jsp").forward(request,response);
    }
    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookDao.delete(id);
        request.getRequestDispatcher("book?action=list&success=Deleted Successfully").forward(request,response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = null;
        String author = null;
        String category = null;
        double price = 0.0;

        boolean ans = true;
        try {
            title = request.getParameter("title");
            author = request.getParameter("author");
            category = request.getParameter("category");
            price = Double.parseDouble(request.getParameter("price"));

            ans = validate(request,title,author,category,price);

        } catch(Exception e){
            ans = false;
        }

        if(!ans){
            request.getRequestDispatcher("Book-form.jsp").forward(request,response);
            return;
        }
        bookDao.insert(new Book(title,author,category,price));
        request.getRequestDispatcher("book?action=list&success=Inserted Successfully").forward(request,response);
    }


    private void UpdateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        String title = null;
        String author = null;
        String category = null;
        double price = 0.0;
         boolean ans = true;
         try {
              id = Integer.parseInt(request.getParameter("id"));
             title = request.getParameter("title");
             author = request.getParameter("author");
             category = request.getParameter("category");
             price = Double.parseDouble(request.getParameter("price"));

             ans = validate(request,title,author,category,price);
         } catch (Exception e) {
             ans = false;
         }
        if(!ans){
            request.setAttribute("book",new Book(id,title,author,category,price));
            request.getRequestDispatcher("Book-form.jsp").forward(request,response);
            return;
        }

        bookDao.update(new Book(id,title,author,category,price));
        request.getRequestDispatcher("book?action=list&success=Updated Successfully").forward(request,response);
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

    private boolean validate(HttpServletRequest request,String title,String author,String category,double price) throws NumberFormatException{
        boolean isValid = true;
            if(title == null || !Pattern.matches("^[A-Za-z ]{3,25}$",title.trim())){
                isValid = false;
                request.setAttribute("titleError","Title must be at least 3 characters long.");
            }
            if(author == null || !Pattern.matches("^[A-Za-z. ]{3,25}$",author.trim())){
                isValid = false;
                request.setAttribute("authorError","Author Should be AtLeast 3-20 character ");

            }
            if(category == null || !Pattern.matches("^[A-Za-z ]{3,25}$",category.trim())){
                isValid = false;
                request.setAttribute("categoryError","Category Should be AtLeast 3-20 character ");

            }
            if (Double.isNaN(price) || price <= 0) {
                isValid = false;
                request.setAttribute("priceError","Price Should be Non-Negative");
            }
        return isValid;
    }

}
