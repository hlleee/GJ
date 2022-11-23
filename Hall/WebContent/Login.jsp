<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<h1>로그인</h1>
<form action="LoginCheck.jsp" method="post">
<table>
<tr><td>ID</td><td><input type="text" name="_id"></td></tr>
<tr><td>암호</td><td><input type="password" name="_pw"></td></tr>
<tr><td><input type="submit" value="로그인"></td></tr>
</table>
</form>
</body>
</html>