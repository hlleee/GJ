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
	String comchk = request.getParameter("_comchk");
	String comcon = request.getParameter("_content"); 
	String fgnnum = request.getParameter("_fgnnum"); 
	String posnum = request.getParameter("_posnum");
	String userID = "me2";
	int comnum = 1;										// 세션으로 아이디도 받아와야함
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	 
    String date = now.format(formatter);
	
	try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false", "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select comnum from comment");
		while(rs.next())
			++comnum;
			
			stmt.executeUpdate("insert into comment values ('"+comnum+"', '"+userID+"','"+comcon+"', '"+date+"', '"+comchk+"', '"+fgnnum+"')");	
			if(comchk.equals("1"))
				out.println("<script>alert('댓글이 등록되었습니다.');</script>");	
			else
				out.println("<script>alert('답글이 등록되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
			
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>