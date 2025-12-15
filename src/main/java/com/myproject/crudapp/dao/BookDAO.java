package com.myproject.crudapp.dao;


import com.myproject.crudapp.model.Book;

import java.util.List;

public interface BookDAO {
    void insert(Book book);
    void delete(int id);
    void update(Book book);
    Book getBookById(int id);
    List<Book> getAllBooks();
}
