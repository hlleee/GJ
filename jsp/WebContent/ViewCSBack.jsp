<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 문의 조회 처리</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	int inqnum = 1;
	String userID = "Admin";
	if(!userID.equals("Admin")){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('관리자만 접근할 수 있습니다.');</script>");		
		out.println("<script>location.href='Login.jsp';</script>");
	} else{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp", "root", "1234");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("update inquiry set process = 1 where inqnum = '"+inqnum+"'");
			out.println("<script>alert('문의 처리가 완료되었습니다.');</script>");	
			out.println("<script>location.href='문의목록.jsp';</script>");
			stmt.close();
			conn.close();
		 }catch(Exception e){
	 e.printStackTrace();
 		}
	}
%>
</body>
</html>