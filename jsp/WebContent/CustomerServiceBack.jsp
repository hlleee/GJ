<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 처리</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("_type");		//작성한 문의의 내용 받아옴
	String title = request.getParameter("_title");
	String date = request.getParameter("_date");
	String content = request.getParameter("_content");
	String userID =  (String) session.getAttribute("__NAME");	//세션에서 현재 로그인중인 사용자의 닉네임을 받아옴


try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj", "root", "1234");
	Statement stmt = conn.createStatement();
		//inquiry 테이블에 문의글 저장
		stmt.executeUpdate("insert into inquiry(category, inqtit, inqnic, inqdat, inqcon, process) values ('"+ type +"', '" + title + "','"+userID+"', '" + date + "', '"+content+"', 0)");
		out.println("<script>alert('문의가 완료되었습니다.');</script>");	
		out.println("<script>location.href='Inquiry.jsp';</script>");	//문의완료 메시지 출력 후 내 문의내역 페이지로 이동
	stmt.close();
	conn.close();
 }catch(Exception e){
	 e.printStackTrace();
 }
%>
</body>
</html>