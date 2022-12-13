<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글, 답글 수정 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID =  (String) session.getAttribute("__NAME");		//세션으로부터 현재 로그인중인 사용자 닉네임을 받아옴
	String comchk = request.getParameter("_comchk");		//댓글번호, 댓글답글여부, 내용 받아옴.
	String content = request.getParameter("_content"); 
	String comnum = request.getParameter("_comnum");	
	String posnum = request.getParameter("_posnum");		//다시 View.jsp로 돌아가기 위한 게시글 번호 받아옴
	
	try{
			 Class.forName("com.mysql.jdbc.Driver");
		 	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
			Statement stmt = conn.createStatement();   
			//입력한 값으로 게시글 내용 업데이트
			stmt.executeUpdate("update comment set comcon = '"+content+"' where comrepdiv = '"+comchk+"' and comnum = '"+comnum+"'");
			
			stmt.close();
			conn.close();
			
			out.println("<script>alert('댓글이 수정 되었습니다.');</script>");	
			out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");	//수정 완료 메시지 출력 후 다시 게시글 페이지로 이동
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>