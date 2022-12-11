
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품정보 삭제 확인</title>
</head>
<body>
<h1>관리자용 회원 삭제 페이지</h1>

<%

	request.setCharacterEncoding("EUC-KR");

	String memnum = request.getParameter("memnum");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String joboffdiv = request.getParameter("joboffdiv");

	try{
		
		Class.forName("com.mysql.jdbc.Driver");//이 안에 클래스 이름을 넣으면 로딩해줌/ 지금은 mysql인 경우
		Connection conn =
				DriverManager.getConnection(
						"jdbc:mysql://localhost/gj"
						, "root"
						, "1234");
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Delete from member where id = '" + id + "' ");
		
		
		out.println("alert(<h3>상품정보 삭제가 완료되었습니다.</h3>)");		
		
		stmt.close();
		conn.close();
		
		response.sendRedirect("Adm_main.jsp");
		
	} catch(SQLException e){
		e.printStackTrace();
		
		
	}

%>



</body>
</html>