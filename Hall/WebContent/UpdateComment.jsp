<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String id = request.getParameter("_id");
	String comnum = request.getParameter("_comnum");
	String content = request.getParameter("_content");
	String comchk = request.getParameter("_comchk");
%>
<div id="comment">
	<h3>댓글 수정</h3>
	<form action = UpdateCommentBack.jsp method = "post">
	<input type = "hidden" name = "_id" value = <%=id%>>
	<input type = "hidden" name = "_comnum" value = <%=comnum%>>
	<input type = "hidden" name = "_comchk" value = <%=comchk%>>
	<textarea style = "width : 700px; height : 50px;" name = "_content"><%=content %></textarea>
	<span style="float:right;"> 
	<button type = "submit" style = "height : 56px; font-size : 12px;">댓글 수정</button>
	</span>
	</form>
</div>
</body>
</html>