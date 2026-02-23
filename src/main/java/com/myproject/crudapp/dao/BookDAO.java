package com.myproject.crudapp.dao;


import com.myproject.crudapp.model.Book;
import com.myproject.crudapp.model.Pagination;

import java.util.List;

public interface BookDAO {
    void insert(Book book);
    void delete(int id);
    void update(Book book);
    Book getBookById(int id);
    List<Book> getSelectedBooks(Pagination pagination);
    int countBooks();
}
