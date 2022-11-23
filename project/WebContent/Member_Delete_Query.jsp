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
	stmt.executeUpdate("delete from member where id = '"+id+"'");
	
	out.println("<p>ID : " + id);
	out.println("<p>암호 : " + pw);
	out.println("<p>닉네임 : " + nickname);
	out.println("<h1>회원정보 삭제가 완료되었습니다.</h1>");
	
	stmt.close();
	conn.close();
	
	} catch(SQLException e){
	e.printStackTrace();
	}
%>

</body>
</html>