<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#comment{
width:65%;
float : left; 
margin-left : 15%;
}
</style>

</head>
<body>
<%
	String comnum = request.getParameter("_comnum");
	String content = request.getParameter("_content");
	String comchk = request.getParameter("_comchk");
	String posnum = request.getParameter("_posnum");
	String userID = "me";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = '"+comchk+"'");
	if(!rs.next()){
		out.println("<script>alert('권한이 없습니다.');</script>");	
		out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
	} else{
%>
<div id="comment">
	<h3>댓글 수정</h3>
	<form action = UpdateCommentBack.jsp method = "post">
	<input type = "hidden" name = "_comnum" value = <%=comnum%>>
	<input type = "hidden" name = "_comchk" value = <%=comchk%>>
	<input type = "hidden" name = "_posnum" value = <%=posnum%>>
	<textarea style = "width : 700px; height : 50px;" name = "_content"><%=content %></textarea>
	<span style="float:right;"> 
	<button type = "submit" style = "height : 56px; font-size : 12px;">댓글 수정</button>
	</span>
	</form>
</div>
<%
	}
	}  catch(Exception e){
		e.printStackTrace();
	}	
	
%>
</body>
</html>