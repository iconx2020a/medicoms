package com.dataaccessor;
import com.connection.DBConnection;
import java.sql.SQLException;

public class UserFinder {
 public boolean doesUserExist(String fname, String pass) {
	
	 String sql ="select * from register where fullName=? and password=?";
    
	 DBConnection gc = new DBConnection();
	 try {
		 gc.ps=DBConnection.getMySqlConnection().prepareStatement(sql);
		 gc.ps.setString(1, fname);
		 gc.ps.setString(2, pass);
		 gc.rs=gc.ps.executeQuery();
		 return gc.rs.next();
	 } catch(SQLException e) {
		
			System.out.println("SQL execution failure");
	 }
	 return false;
 }
 
 
 
}
