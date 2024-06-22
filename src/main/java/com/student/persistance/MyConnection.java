package com.student.persistance;

import java.sql.*;

public class MyConnection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/student";
			String username = "root";
			String password = "admin123";
			con = DriverManager.getConnection(dbUrl, username, password);

			System.out.println("Database Connecting...");
		} catch (ClassNotFoundException e) {
			System.out.println("class not found" + e);
		} catch (SQLException sql) {
			System.out.println(sql);
			System.out.println("connection error" + sql);
		}
		return con;

	}
}
