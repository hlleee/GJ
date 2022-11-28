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
	String comnum = request.getParameter("_comnum");
	String comchk = request.getParameter("_comchk");
	String posnum = request.getParameter("_posnum");
	String userID = "me2";
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = '"+comchk+"'");
			if(rs.next()){
				stmt.executeUpdate("delete from comment where comnic='"+userID+"' and comnum='"+comnum+"' and comrepdiv='"+comchk+"'");
				out.println("<script>alert('댓글 삭제가 완료되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum='"+posnum+"'';</script>");
				stmt.close();
				conn.close();
				rs.close();
			}else {
				out.println("<script>alert('권한이 없습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum='"+posnum+"'';</script>");
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	
%>
	
</body>
</html>