package com.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	public PreparedStatement ps, ps1,ps2;
	public ResultSet rs,rs1;
	private static Connection conn;
	
	public static Connection getMySqlConnection() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");  
			conn=DriverManager.getConnection(  
			//"jdbc:mysql://127.0.0.1/mysql","root","root");  
			"jdbc:mysql://restricted.xcom.net/mysql","root","root");  
		     return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated atch block
			System.out.println("Driver loading failure");
			//e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL connection failure");
		//	e.printStackTrace();
		}
		
		return null;
	}
	
	
 
}
