package view;
import java.sql.*;

public class ViewDAO {
	
	static Connection conn = null;
	static Statement stmt = null;
	
	
	/** 게시글의 좋아요 수를 구하는 함수  */
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
	
	/** 게시글에 달린 댓글을 구하는 함수  */
	public static ResultSet comment(String num) {
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from comment where fgnnum = '"+num+"' and comrepdiv = 1 and delchk = 0");
		} catch(Exception e){
			return null;
		}
	}
	
	
	/*
	
	public static ResultSet delComment(String num) {
		try{			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from comment where fgnnum = '"+num+"' and comrepdiv = 1 and delchk = 1");
		} catch(Exception e){
			return null;
		}
	}
	

	public static ResultSet chkDelComment(int comnum) {
		try{			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from comment where fgnnum = '"+comnum+"' and comrepdiv = 0 and delchk = 0");
		} catch(Exception e){
			return null;
		}
	}
	*/
	
	public static ResultSet delComment(String posnum) {
		try{			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from comment where fgnnum = '"+posnum+"' and comrepdiv = 1 and delchk = 1 and  exists(select * from comment where comrepdiv = 0 and fgnnum = (select comnum from comment where fgnnum = '"+posnum+"' and comrepdiv = 1) and delchk = 0)");
		} catch(Exception e){
			return null;
		}
	}
	
	
	/** 게시글에 달린 댓글의 답글을 구하는 함수  */
	public static ResultSet reply(int num) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			stmt = conn.createStatement();
			return stmt.executeQuery("select * from comment where fgnnum = '"+num+"' and comrepdiv = 0 and delchk = 0"); 
			
		} catch(Exception e){
			return null;
		}
	}
	
	/** 로그인 한 사용자가 해당 게시글에 좋아요를 눌렀는지 확인하는 함수 */
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
	
	/** DB 연결을 종료하는 함수  */
	public static void close() {
		try {
			conn.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
