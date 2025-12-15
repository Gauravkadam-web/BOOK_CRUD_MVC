package com.myproject.crudapp.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtils {
    private static final String URL = "jdbc:postgresql://localhost:5432/bookdb";
    private static final String USER = "postgres";
    private static final String PASS = "1234";

    static {
        try {
            Class.forName("org.postgresql.Driver");
        }catch (ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException{
        return DriverManager.getConnection(URL,USER,PASS);
    }

}
