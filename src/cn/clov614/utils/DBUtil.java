package cn.clov614.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String url="jdbc:mysql://localhost:3306/db?useUnicode=true&characterEncoding=utf8";
    // private static final String url="jdbc:mysql:///book_management_db";
    private static final String name="root";
    private static final String password="i614614.";

    /**
     * 静态代码块
     * 注入JDBC连接
     */
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获得JDBC连接
     * @return 连接Connection conn
     */
    public static Connection getConnection() {
        Connection conn=null;
        try {
            conn = DriverManager.getConnection(url, name, password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return conn;
    }

}
