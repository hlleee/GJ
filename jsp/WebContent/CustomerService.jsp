<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type ="text/css">

div#text{
width:20%;
float:left;
text-align : right;
margin-left : 5%;    
margin-top : 4%;

}

div#input{
width:50%;
float:left;
margin-left : 1%;

}

#btn{
width : 50%;
margin-left : 26%;
text-align : right;

}

</style>

<body>
<%
	String userID = "me";   		//세션에서 로그인중인 id 받아옴

	if(userID.isEmpty()){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('게시글 작성을 하려면 로그인을 하십시오.');</script>");		
		out.println("<script>location.href='Login.jsp';</script>");
	} 
%>
<form action = "CustomerServiceBack.jsp" method = "post">
    <div id = "text">
    				<p style = "font-size : 16px">문의사항 |</p>
					<p style = "font-size : 16px">	제목 |</p>
					<p style = "font-size : 16px">발생일자 |</p>
   					<p style = "font-size : 16px"> 문의내용 |</p>
   	</div>
    <div id = "input"> <h3>고객센터</h3>
    				   <select name = "_type" style = "width : 50%">
					   <option>버그 제보</option>
					   <option>사용자 신고</option>
					   <option>건의사항</option>
				   	   </select><p>
					   <input type = "text" style = "width : 99%" name = "_title" size = "50" placeholder = "제목을 입력하세요" required> <p>
   					   <input type = "date" style = "width : 50%" name = "_date" value = "${dateType2}"> <p>
   					   <textarea name = "_content" style = "width : 99%; height : 350px;"></textarea> 
   	</div>
   	<div id = "btn">
		<input type = "submit" value = "문의" >
		<input type = "reset" value = "취소" > 
	</div>
  </form>

</body>
</html>