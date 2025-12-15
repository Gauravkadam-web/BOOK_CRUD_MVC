package com.myproject.crudapp.dao;

import com.myproject.crudapp.exception.BookDAOException;
import com.myproject.crudapp.model.Book;
import com.myproject.crudapp.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO{
    private static final String INSERT_SQL ="INSERT INTO books(title,author,category,price) VALUES (?,?,?,?)";
    private static final String DELETE_SQL ="DELETE FROM books WHERE id=?";
    private static final String UPDATE_SQL ="UPDATE books SET title=?,author=?,category=?,price=? WHERE id=?";
    private static final String GET_BY_ID_SQL ="SELECT * FROM books WHERE id=?";
    private static final String GET_ALL_SQL ="SELECT * FROM books";

    @Override
    public void insert(Book book) {
        try(Connection connection = JDBCUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(INSERT_SQL)){

            statement.setString(1,book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setString(3, book.getCategory());
            statement.setDouble(4,book.getPrice());

            statement.executeUpdate();

        } catch (SQLException sqle) {
            throw new BookDAOException("Unable to Insert Record"+sqle,sqle);
        }
    }

    @Override
    public void delete(int id) {
        try(Connection connection = JDBCUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_SQL)){
            statement.setDouble(1,id);

            statement.executeUpdate();

        } catch (SQLException sqle) {
            throw new BookDAOException("Unable to Delete Record",sqle);
        }
    }

    @Override
    public void update(Book book) {
        try(Connection connection = JDBCUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_SQL)){
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setString(3, book.getCategory());
            statement.setDouble(4,book.getPrice());
            statement.setInt(5,book.getId());
            statement.executeUpdate();

        } catch (SQLException sqle) {
            throw new BookDAOException("Unable to Fetch Single Record",sqle);
        }
    }

    @Override
    public Book getBookById(int id) {
        Book book = null;
        try(Connection connection = JDBCUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(GET_BY_ID_SQL)){
            statement.setInt(1,id);
            try(ResultSet rs = statement.executeQuery()){
                if(rs.next()){
                    book = new Book(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getString("category"),
                            rs.getDouble("price")
                    );
                }
            }
        } catch (SQLException sqle) {
            throw new BookDAOException("Unable to Fetch Single Record",sqle);
        }
        return book;
    }

    @Override
    public List<Book> getAllBooks() {
        List<Book> bookList = new ArrayList<>();
        try(Connection connection = JDBCUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(GET_ALL_SQL);
            ResultSet rs = statement.executeQuery()){
                while(rs.next()){
                   bookList.add(new Book(
                           rs.getInt("id"),
                           rs.getString("title"),
                           rs.getString("author"),
                           rs.getString("category"),
                           rs.getDouble("price"))
                   );
                }
        } catch (SQLException sqle) {
            throw new BookDAOException("Unable to Fetch Records"+sqle,sqle);
        }
        return bookList;
    }
}
