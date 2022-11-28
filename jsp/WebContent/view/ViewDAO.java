package view;
import java.sql.*;

public class ViewDAO {
	
	static Connection conn = null;
	static Statement stmt = null;
	
	public static ResultSet view(String num) {
		int view = 1;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			stmt.executeUpdate("update post set views = '"+view+"' where posnum = '"+num+"'"); 
			return stmt.executeQuery("select * from post where posnum = '"+num+"'"); 
	
		} catch(Exception e){
			return null;
		}
	}
	
	public static ResultSet viewLike(String num) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select count(posnum) from likes where posnum = '"+num+"'");
	
		} catch(Exception e){
			return null;
		}
	}
	
	
	public static ResultSet comment(String num) {
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from comment where fgnnum = '"+num+"' and comrepdiv = 1");
		} catch(Exception e){
			return null;
		}
		


	}

	public static ResultSet reply(int num) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from comment where fgnnum = '"+num+"' and comrepdiv = 0"); 
			
		} catch(Exception e){
			return null;
		}
		


	}
	public static ResultSet like(String num, String id) {
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from likes where liknic = '"+id+"' and posnum = '"+num+"'"); 
			
		} catch(Exception e){
			return null;
		

		}
	}
	public static void close() {
		try {
			conn.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
