<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="_id" value="<%= (String)session.getAttribute("__ID") %>">

<%
	request.setCharacterEncoding("euc-kr");	

	Object id=session.getAttribute("__ID");
	String _id=(String)id;
	if(_id.equals("Adm")){
		response.sendRedirect("AllInquiry.jsp");
	}
	else{
		response.sendRedirect("Inquiry.jsp");
	}
%>
</body>
</html>