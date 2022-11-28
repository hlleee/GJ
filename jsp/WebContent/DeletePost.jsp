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
	String userID = "me";
	String posnum = request.getParameter("_posnum");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from post where comnic = '"+userID+"' and posnum = '"+posnum+"'");
		if(rs.next()){
		stmt.executeUpdate("delete from post where posnum='"+posnum+"' and posnic='"+userID+"'");
		out.println("<script>alert('게시글 삭제가 완료되었습니다.');</script>");	
		out.println("<script>location.href='View.jsp?_posnum='"+posnum+"'';</script>");
		} else{
			out.println("<script>alert('권한이 없습니다.');</script>");	
			out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
		}
		stmt.close();
		conn.close();
		rs.close();
	} catch(Exception e){
		e.printStackTrace();
	}
	
%>
	
</body>
</html>