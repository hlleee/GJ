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
		


	String id = request.getParameter("_id");	
	String pw = request.getParameter("_pw");	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from member where id = '"+ id + "' and pw = '" + pw +"'" );
		
		if(rs.next()){
			
			String nickname = rs.getString("nickname");
			
			//세션으로 아이디와 닉네임 받아오기.
			session.setAttribute("__ID", id);//(name, value)
			session.setAttribute("__NAME", nickname);
			
			if(id.equals("Admin")){
				response.sendRedirect("Adm_main.jsp");
			} else
			
			response.sendRedirect("Main_UI.jsp");
		} else {
			
			out.println("<script>alert('아이디/비밀번호가 틀렸습니다.');</script>");
			out.println("<script>location.href='Main.jsp';</script>");
			//out.println("<h1>접근 불가한 사용자입니다.<h1>");
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

</body>
</html>