<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
<%
	String userID =  (String) session.getAttribute("__NAME");
	String posnum = request.getParameter("_posnum");
	String type = "";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from post where posnic = '"+userID+"' and posnum = '"+posnum+"'");
		if(rs.next() || userID.equals("Admin")){
			if(rs.first()) type = rs.getString("btype");
			stmt.executeUpdate("delete from post where posnum='"+posnum+"'");
			out.println("<script>alert('게시글 삭제가 완료되었습니다.');</script>");	
				if(userID.equals("Admin")) out.println("<script>location.href='관리자 게시판.jsp';</script>");
				else {
					switch(type){
					case "자유게시판" : out.println("<script>location.href='자유게시판.jsp';</script>"); break;
					case "취업후기게시판" : out.println("<script>location.href='취업후기게시판.jsp';</script>"); break;
					case "면접게시판" : out.println("<script>location.href='면접게시판.jsp';</script>"); break;
					case "질문게시판" : out.println("<script>location.href='질문게시판.jsp';</script>"); break;
					case "채용게시판" : out.println("<script>location.href='채용게시판.jsp';</script>"); break;
					default : out.println ("<script>alert('게시판 불러오기 오류'); location.href='전체글게시판.jsp';</script>"); break;
					}
				}
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