<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 작성</title>\
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
	String userID =  (String) session.getAttribute("__NAME");

	String comchk = request.getParameter("_comchk");
	String fgnnum = request.getParameter("_fgnnum");
	String posnum = request.getParameter("_posnum");
%>
<div id="comment">
	<h3>답글 작성</h3>
	<form action = "WriteComment.jsp" method = "post">
	<input type = "hidden" name = "_comchk" value = <%=comchk%>>
	<input type = "hidden" name = "_fgnnum" value = <%=fgnnum%>>
	<input type = "hidden" name = "_posnum" value = <%=posnum%>>
	<textarea style = "width : 700px; height : 50px;" name = "_content"></textarea>
	<span style="float:right;"> 
	<button type = "submit" style = "height : 56px; font-size : 12px;">답글 작성</button>
	</span>
	</form>
</div>
</body>
</html>