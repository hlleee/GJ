<%@page import="java.time.format.DateTimeFormatter"%>
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
	int posnum = 1;
	String type = request.getParameter("_type");
	String title = request.getParameter("_title");
	String userID = "me";
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	 
    String date = now.format(formatter);
    
	String content = request.getParameter("_content");

	try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false", "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select posnum from post");
		while(rs.next())
			++posnum;
			stmt.executeUpdate("insert into post values ('"+posnum+"', '" + title + "','"+content+"', '" + date + "', '"+userID+"', 0, '"+type+"')");
			out.println("<script>alert('게시글 작성이 완료되었습니다.');</script>");	
			out.println("<script>location.href='View.jsp';</script>");
		stmt.close();
		conn.close();
		rs.close();
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	
%>
</body>
</html>