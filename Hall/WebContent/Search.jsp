<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>


<%

	String keyword = request.getParameter("_keyword");
	String id = request.getParameter("_id");	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where postit = '" + keyword + "'");
		
		%>
		<table border="1">
		<tr><th>posnum</th><th>postit</th><th>poscon</th><th>views</th><th>posdat</th><th>btype</th><th>posnic</th></tr>
			
		<% 
		
		
		while(rs.next()){
			String posnum = rs.getString("posnum");
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");
			String btype = rs.getString("btype");
			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td style='text-align: center; width='100'>" + posnum + "</td>");
			out.println("<td style='text-align: center; width='100'>" + postit + "</td>");
			out.println("<td style='text-align: center; width='100'>" + poscon + "</td>");
			out.println("<td style='text-align: center; width='100'>" + views + "</td>");
			out.println("<td style='text-align: center; width='100'>" + posdat + "</td>");
			out.println("<td style='text-align: center; width='100'>" + btype + "</td>");
			out.println("<td style='text-align: center; width='100'>" + posnic + "</td>");
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
</body>
</html>