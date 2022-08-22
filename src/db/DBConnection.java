package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException,
            ClassNotFoundException{
        Connection conn = null;

        String url = "jdbc:mysql://192.168.1.216:3306/shop_db";
        String user = "root";
        String password = " 1234 ";

        //mariaDB 준비
        Class.forName("org.mariadb.jdbc.Driver");
        System.out.println("mariadb 사용가능");

        // mariaDB 연결
        conn = DriverManager.getConnection(url,user,password);
        System.out.println(conn + "<-- conn");

        return conn;
    }
}
