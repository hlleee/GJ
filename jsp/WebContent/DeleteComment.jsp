<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 삭제</title>
</head>
<body>
<%
	String comnum = request.getParameter("_comnum");
	String comchk = request.getParameter("_comchk");
	String posnum = request.getParameter("_posnum");
	String userID =  (String) session.getAttribute("__NAME");
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 1");
			if(rs.next()){
				stmt.executeUpdate("update comment set delchk = 1 where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 1");
				out.println("<script>alert('댓글 삭제가 완료되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
				
			}else {
				out.println("<script>alert('권한이 없습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
			}
			rs = stmt.executeQuery("select * from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 0");
			if(rs.next()){
				stmt.executeUpdate("delete from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 0");
				out.println("<script>alert('답글 삭제가 완료되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
			}else {
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