<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 작성</title>
<style>
#comment{
width:65%;
float : left; 
margin-left : 15%;
}
 .writeCom{
     margin: auto;
     width : 65px;
    height: 55px;
    font-size : 12px;
    border: none;
    outline: none;
    background-color: #3D5F95;
    padding-bottom: 0px;
    color: #ffffff;
    border-radius: 5px;
    
    }
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID =  (String) session.getAttribute("__NAME");	//세션에서 현재 로그인중인 사용자의 닉네임을 받아옴

	String fgnnum = request.getParameter("_fgnnum");
	String posnum = request.getParameter("_posnum");
	
	if(userID==null){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("접근 오류');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	}  
%>
<div id="comment">
	<h3>답글 작성</h3>
	<hr><br>
	<!-- WriteComment.jsp로 답글 작성을 위한 값을 넘겨주는 form태그 -->
	<form action = "WriteComment.jsp" method = "post">
	<input type = "hidden" name = "_comchk" value = 0>
	<input type = "hidden" name = "_fgnnum" value = <%=fgnnum%>>
	<input type = "hidden" name = "_posnum" value = <%=posnum%>>
	<!-- 답글 내용은 500글자까지만 입력받고 반드시 입력되어야함 -->
	<textarea style = "width : 700px; height : 50px; resize: none;" maxlength = "500" name = "_content" required></textarea>
	<span style = "margin-left : 1%; vertical-align : top;"> 
	<button type = "submit" class = "writeCom">답글 작성</button>
	</span>
	</form>
</div>
</body>
</html>