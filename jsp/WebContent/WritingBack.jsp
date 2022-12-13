<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 처리</title>
</head>
<body>
<% 
	
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("_type");		//작성한 게시글 정보를 저장
	String title = request.getParameter("_title");
	String content = request.getParameter("_content");
	
	String userID =  (String) session.getAttribute("__NAME"); //세션에서 현재 로그인중인 사용자의 닉네임을 가져옴
	int posnum=0;		//부여할 게시글 번호 초기화
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 
    String date = now.format(formatter);		//게시글 작성 날짜 저장 (오늘)
    

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
		Statement stmt = conn.createStatement();
		//post 테이블에 작성한 게시글 저장
		int result = stmt.executeUpdate("insert into post (postit, poscon, posdat, posnic, views, btype) values ('" + title + "','"+content+"', '" + date + "', '"+userID+"', 0, '"+type+"')");
		if(result!=0){	//작성에 성공했으면 작성한 게시글 번호를 불러옴(이동을위해)
			ResultSet rs = stmt.executeQuery("select posnum from post where postit = '"+title+"' and poscon = '"+content+"' and posdat = '"+date+"' and btype = '"+type+"'");
			if (rs.next()){
				posnum = rs.getInt("posnum");		//방금 작성한 게시글의 게시물번호 저장
				rs.close();
				out.println("<script>alert('게시글 작성이 완료되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");	//작성한 게시글 페이지로 이동
				
			}
		} else{		//게시글 작성에 실패할 시 오류메시지 출력
			out.println("<script>alert('글 작성 오류');</script>");	
			out.println("<script>location.href='WritingPage.jsp';</script>");
		}
		
		stmt.close();
		conn.close();
		
		
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	
%>
</body>
</html>