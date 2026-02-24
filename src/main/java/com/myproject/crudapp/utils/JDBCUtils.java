package com.myproject.crudapp.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtils {

    private static final String HOST =
            System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";

    private static final String PORT =
            System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "5432";

    private static final String DB =
            System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "bookdb";

    private static final String USER =
            System.getenv("DB_USERNAME") != null ? System.getenv("DB_USERNAME") : "postgres";

    private static final String PASS =
            System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "1234";

    private static final String URL =
            "jdbc:postgresql://" + HOST + ":" + PORT + "/" + DB;

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL Driver not found", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}