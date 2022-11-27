<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = "me";
	String comchk = request.getParameter("_comchk");
	String content = request.getParameter("_content"); 
	String comnum = request.getParameter("_comnum");									// 세션으로 아이디도 받아와야함
	
	try{
			 Class.forName("com.mysql.jdbc.Driver");
		 	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false", "root", "1234");
			Statement stmt = conn.createStatement();   //세션 아이디하고 받아온 아이디 비교 맞으면 밑에 수행 아니면 에러메시지
			
			stmt.executeUpdate("update comment set comcon = '"+content+"' where comchk = '"+comchk+"' and comnum = '"+comnum+"'");
			
			stmt.close();
			conn.close();
			
			out.println("<script>alert('댓글이 수정 되었습니다.');</script>");	
			out.println("<script>location.href='View.jsp';</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>