
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ���� ���� Ȯ��</title>
</head>
<body>
<h1>�����ڿ� ȸ�� ���� ������</h1>

<%

	request.setCharacterEncoding("EUC-KR");

	String memnum = request.getParameter("memnum");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String joboffdiv = request.getParameter("joboffdiv");

	try{
		
		Class.forName("com.mysql.jdbc.Driver");//�� �ȿ� Ŭ���� �̸��� ������ �ε�����/ ������ mysql�� ���
		Connection conn =
				DriverManager.getConnection(
						"jdbc:mysql://localhost/gj"
						, "root"
						, "1234");
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Delete from member where id = '" + id + "' ");
		
		
		out.println("alert(<h3>��ǰ���� ������ �Ϸ�Ǿ����ϴ�.</h3>)");		
		
		stmt.close();
		conn.close();
		
		response.sendRedirect("Adm_main.jsp");
		
	} catch(SQLException e){
		e.printStackTrace();
		
		
	}

%>



</body>
</html>