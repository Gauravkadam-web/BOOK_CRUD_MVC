package com.myproject.crudapp.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtils {
    private static final String JDBC_HOST = System.getenv("JDBC_HOST") != null ? System.getenv("JDBC_HOST") : "localhost";
    private static final String JDBC_PORT = System.getenv("JDBC_PORT") != null ? System.getenv("JDBC_PORT") : "5432";
    private static final String JDBC_DB = System.getenv("JDBC_DB") != null ? System.getenv("JDBC_DB") : "bookdb";
    private static final String USERNAME = System.getenv("JDBC_USERNAME") != null ? System.getenv("JDBC_USERNAME") : "postgres";
    private static final String PASSWORD = System.getenv("JDBC_PASSWORD") != null ? System.getenv("JDBC_PASSWORD") : "1234";

    private static final String URL = "jdbc:postgresql://" + JDBC_HOST + ":" + JDBC_PORT + "/" + JDBC_DB;

    static {
        try {
            Class.forName("org.postgresql.Driver");
        }catch (ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException{
        return DriverManager.getConnection(URL,USERNAME,PASSWORD);
    }

}
