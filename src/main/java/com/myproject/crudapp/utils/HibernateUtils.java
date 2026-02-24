package com.myproject.crudapp.utils;

import com.myproject.crudapp.exception.BookDAOException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

    private static final SessionFactory factory;

    static {
        try {

            Configuration configuration = new Configuration().configure();

            String host = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
            String port = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "5432";
            String db   = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "bookdb";
            String user = System.getenv("DB_USERNAME") != null ? System.getenv("DB_USERNAME") : "postgres";
            String pass = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "1234";

            String url = "jdbc:postgresql://" + host + ":" + port + "/" + db;

            configuration.setProperty("hibernate.connection.url", url);
            configuration.setProperty("hibernate.connection.username", user);
            configuration.setProperty("hibernate.connection.password", pass);

            factory = configuration.buildSessionFactory();

        } catch (Throwable ex) {
            throw new BookDAOException("Initial SessionFactory Creation Failed:", ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return factory;
    }

    public static void shutdown() {
        getSessionFactory().close();
    }
}