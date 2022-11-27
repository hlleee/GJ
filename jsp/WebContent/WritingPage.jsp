<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type ="text/css">

div#input{
width:50%;
margin-left : 30%;

}

#btn{
width : 50%;
margin-left : 30%;
text-align : right;

}
</style>
</head>
<body>
<%
	String userID = "me";   		//세션에서 로그인중인 id 받아옴

	if(userID.isEmpty()){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('게시글 작성을 하려면 로그인을 하십시오.');</script>");		
		out.println("<script>location.href='Login.jsp';</script>");
	} 
%>
<form action = WritingBack.jsp method = "post">
<div id = "input"><h3>글 작성</h3>
						<select name = "_type" style = "width : 50%;" >
						<option>자유게시판</option>
						<option>취업후기게시판</option>
						<option>면접게시판</option>
						<option>질문게시판</option>
						<option>채용게시판</option>
				</select><p>
				<input type = "text" name = "_title" style = "width : 99%;"  placeholder = "제목을 입력하세요" required> <p>
				<textarea name = "_content" style = "width : 99%; height : 400px;"></textarea> 
</div>
<div id="btn"><input type = "submit" value = "작성" >
			  <input type = "reset" value = "취소" > 
</div>
</form>
</body>
</html>