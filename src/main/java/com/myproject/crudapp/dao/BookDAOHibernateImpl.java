package com.myproject.crudapp.dao;

import com.myproject.crudapp.exception.BookDAOException;
import com.myproject.crudapp.model.Book;
import com.myproject.crudapp.utils.HibernateUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class BookDAOHibernateImpl implements BookDAOHibernate{

    @Override
    public void insert(Book book) {
        Transaction tx = null;
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            tx = session.beginTransaction();
            session.persist(book);
            tx.commit();
        }catch (HibernateException he){
            throw new BookDAOException("Unable to Insert Record",he);
        }
    }

    @Override
    public void delete(int id) {
        Transaction tx = null;
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            tx = session.beginTransaction();
            Book book = session.find(Book.class,id);
            if(book != null)
                session.remove(book);
            tx.commit();
        }catch (HibernateException he){
            throw new BookDAOException("Unable to Delete Record",he);
        }
    }

    @Override
    public void update(Book book) {
        Transaction tx = null;
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            tx = session.beginTransaction();
            session.merge(book);
            tx.commit();
        }catch (HibernateException he){
            throw new BookDAOException("Unable to Update Record",he);
        }
    }

    @Override
    public Book getBookById(int id) {
        Book book = null;
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            book = session.find(Book.class,id);
        } catch (Exception he) {
            throw new BookDAOException("Unable to Fetch Single Record",he);
        }
        return book;
    }

    @Override
    public List<Book> getAllBooks() {
        List<Book> books = null;
        try(Session session = HibernateUtils.getSessionFactory().openSession();){
            String hql = "FROM Book";
            books = session.createQuery(hql,Book.class).getResultList();
        } catch (Exception he) {
            throw new BookDAOException("Unable to Fetch Record",he);
        }
        return books;
    }
}
