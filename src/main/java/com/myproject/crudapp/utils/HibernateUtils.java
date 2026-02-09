package com.myproject.crudapp.utils;

import com.myproject.crudapp.auth.model.Users;
import com.myproject.crudapp.exception.BookDAOException;
import com.myproject.crudapp.model.Book;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
    private static final SessionFactory factory;

    static{
        try{
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            throw new BookDAOException("Initial SessionFactory Creation Failed :",ex);
        }
    }

    public static SessionFactory getSessionFactory(){
        return factory;
    }

    public static void shutdown(){
        getSessionFactory().close();
    }
}
