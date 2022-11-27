<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String posnum = request.getParameter("_posnum");
try{
	
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false", "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select inqnum from inquiry");
	rs = stmt.executeQuery("select * from t_like where user='"+"me2"+"' and posnum = '"+posnum+"'");   //me2 세션으로 아이디 받아와야함
	if(rs.next()) {
		out.println("<script>alert('좋아요는 한 번만 누를 수 있습니다.');</script>");
		out.println("<script>location.href='View.jsp';</script>");
	}
						
	else {
		stmt.executeUpdate("insert into t_like values ('"+"me2"+"','"+posnum+"')");	
		response.sendRedirect("View.jsp");
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>