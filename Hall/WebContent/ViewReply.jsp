<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>\
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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("_id");
	String comchk = request.getParameter("_comchk");
	String fgnnum = request.getParameter("_fgnnum");
%>
<div id="comment">
	<h3>답글 작성</h3>
	<form action = ViewComment.jsp method = "post">
	<input type = "hidden" name = "_id" value = <%=id%>>
	<input type = "hidden" name = "_comchk" value = <%=comchk%>>
	<input type = "hidden" name = "_fgnnum" value = <%=fgnnum%>>
	<textarea style = "width : 700px; height : 50px;" name = "_content"></textarea>
	<span style="float:right;"> 
	<button type = "submit" style = "height : 56px; font-size : 12px;">답글 작성</button>
	</span>
	</form>
</div>
</body>
</html>