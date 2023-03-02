package com.data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 public class Database {	
	private PreparedStatement ps;
	private ResultSet rs;
	private static Connection conn;
public Database() {
	try {
	Class.forName("com.mysql.jdbc.Driver"); 
	}catch (ClassNotFoundException e) {
System.out.println(e.toString()+"  we   have problem here");
		}
}
public void initializeConnection() {
	conn = getMySqlConnection();
}
	public Connection getMySqlConnection() {
		try {
return DriverManager.getConnection(  
"jdbc:mysql://10.0.64.2:3306/testdb?"                             +"autoReconnect=true&useSSL=false","root","root");  
	}
	catch (SQLException e) {
	System.out.println("SQL connection failure");
		}
          return null;
}
public void addUser(int id, String fName, String lName) {
	String sql ="insert into Person values (?,?,?)";
		 try {
			 ps=conn.prepareStatement(sql);
			 ps.setInt(1, id);
			 ps.setString(2, fName);
			 ps.setString(3, lName);
			 ps.executeUpdate(); 
		 } catch(SQLException e) {
System.out.println("SQL execution    failure");
		 }
	 }
	
	 public boolean doesUserExist(int id) {	
String sql ="select * from Person where ID=?";
		 try {
			 ps=conn.prepareStatement(sql);
			 ps.setInt(1, id);
			 rs=ps.executeQuery();
			 return rs.next();
		 } catch(SQLException e) {
System.out.println("SQL execution failure");
		 }
		 return false;
	 }
public boolean isAdmin(int id, String password) {
String sql ="select * from Admin where ID=? and Password=?";
		 try {
			 ps=conn.prepareStatement(sql);
			 ps.setInt(1, id);
			 ps.setString(2, password);
			 rs=ps.executeQuery();
			 return rs.next();
		 } catch(SQLException e) {
System.out.println("SQL execution failure");
		 }
		 return false;
	 }
	 public ResultSet allUsers() {	
		 String sql ="select * from Person";
		 try {
			 ps=conn.prepareStatement(sql);
			 rs=ps.executeQuery();
			 return rs;
		 } catch(SQLException e) {
			System.out.println(e.toString());
		 }
		 return null;
	 }
}
