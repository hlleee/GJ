<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("euc-kr");	

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nickname = request.getParameter("nickname");
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/project","root","1234");
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("update member set id='"+id+"', nickname = '"+nickname+"' where pw = '"+pw+"'");
	
	out.println("<p>ID : " + id);
	out.println("<p>성명 : " + nickname);
	out.println("<h3>정보 수정이 완료되었습니다.</h3>");
	
	stmt.close();
	conn.close();
	
	} catch(SQLException e){
	e.printStackTrace();
	}
%>

</body>
</html>