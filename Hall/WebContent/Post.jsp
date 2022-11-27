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
	
	request.setCharacterEncoding("UTF-8");	
	String keyword = request.getParameter("_keyword");
	String id = request.getParameter("_id");	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where btype = '자유'LIMIT 2");
		//postit = '" + keyword + "'"
		//WHERE [컬럼명] LIKE '%특정문자열%'
		// AND views=
		
		%>
		<table border="1">
		<tr><th>제목</th><th>내용</th><th>조회수</th><th>게시일자</th><th>작성자</th></tr>
			
		<% 
		
		//request.setCharacterEncoding("UTF-8");
		
		while(rs.next()){
			
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");
			
			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td width='150' height='30'>" + postit + "</td>");
			out.println("<td width='370'>" + poscon + "</td>");
			out.println("<td width='60'>" + views + "</td>");
			out.println("<td width='100'>" + posdat + "</td>");
			out.println("<td width='70'>" + posnic + "</td>");
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
</body>
</html>