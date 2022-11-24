<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 회원수 받아오기</title>
</head>
<body>


<%
	//총 회원수 받아오기, 쿼리문 작성은 하였으나 값 전달을 어떻게 해야할지,,
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		
		String strQuery = "Select total(id) from member";
	    ResultSet rs = stmt.executeQuery(strQuery);

	    String Countrun="";
	      while(rs.next()){
	      Countrun = rs.getString(1);
	      
	       } 
	      
	      out.println("<a href=saem-ee.jsp?name='새박'>");
	      out.println("<script>location.href='Main.jsp';</script>");
	      //session.setAttribute("__Memsum", Countrun);
	      //response.sendRedirect("Main_UI.jsp");
		
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

</body>
</html>