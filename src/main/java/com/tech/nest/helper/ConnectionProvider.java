package com.tech.nest.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	private static Connection con;
	public static Connection getConnection() {
		try {
			if (con == null) {
				//driver class load
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//create a connection..
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "cKHs52#d");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return con;
	}
}
