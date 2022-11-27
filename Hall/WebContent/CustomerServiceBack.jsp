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
	request.setCharacterEncoding("UTF-8");
	int inqnum = 1;
	String type = request.getParameter("_type");
	String title = request.getParameter("_title");
	String date = request.getParameter("_date");
	String content = request.getParameter("_content");
try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp", "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select inqnum from inquiry");
	while(rs.next())
		++inqnum;
//		stmt.executeUpdate("insert into inquiry values ('"+inqnum+"', '"+ type +"', '" + title + "','"+session.getAttribute("__ID")+"', '" + date + "', '"+content+"', 0)"); //로그인 구현되면 id도 db에 넣는다.
		stmt.executeUpdate("insert into inquiry values ('"+inqnum+"', '"+ type +"', '" + title + "','"+"me"+"', '" + date + "', '"+content+"', 0)");
		out.println("<script>alert('문의가 완료되었습니다.');</script>");	
		out.println("<script>location.href='CustomerService.jsp';</script>");
	stmt.close();
	conn.close();
	rs.close();
 }catch(Exception e){
	 e.printStackTrace();
 }
%>
</body>
</html>