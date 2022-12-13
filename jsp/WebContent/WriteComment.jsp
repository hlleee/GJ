<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글, 답글 작성 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String comchk = request.getParameter("_comchk");		//작성한 댓글의 기본정보 저장
	String comcon = request.getParameter("_content"); 
	String fgnnum = request.getParameter("_fgnnum"); 		//댓글이라면 어느 게시글에 달린 댓글인지, 답글이라면 어느 댓글에 달린 답글인지
	String posnum = request.getParameter("_posnum");		//다시 게시글페이지로 돌아가기 위한 게시글번호 저장
	String userID =  (String) session.getAttribute("__NAME");	//세션에서 현재 로그인중인 사용자의 닉네임을 받아옴
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 
    String date = now.format(formatter);		//댓글 작성한 날짜를 받아옴 (오늘)
    
	if(userID==null){		//로그아웃상태면 오류메시지 메인페이지로 이동
		out.println("<script>alert('접근 오류');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	}  
	
	try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
		Statement stmt = conn.createStatement();
			
			//comment 테이블에 작성한 댓글 정보 저장
			stmt.executeUpdate("insert into comment (comnic, comcon, comdat, comrepdiv, fgnnum, delchk) values ('"+userID+"','"+comcon+"', '"+date+"', '"+comchk+"', '"+fgnnum+"', 0)");
			if(comchk.equals("1")) out.println("<script>alert('댓글이 등록되었습니다.');</script>");	//작성한게 댓글이라면
			else out.println("<script>alert('답글이 등록되었습니다.');</script>");	//작성한게 답글이라면
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>"); //원래 게시글로 이동
			
			conn.close();
			stmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>