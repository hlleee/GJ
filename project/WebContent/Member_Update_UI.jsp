<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>ȸ�������� �����ϼ���</h3>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nickname = request.getParameter("nickname");
%>
<form action = "Member_Update_Query.jsp" method = "post">
<table>
<tr> <td>ID</td> <td> <input type = "text" name = "id" value = <%=id %>> </td> </tr>
 <input type = "hidden" name = "pw" value = <%=pw %>> </td> </tr>
<tr> <td>����</td> <td> <input type = "text" name = "nickname" value = <%=nickname %>> </td> </tr>
<tr> <td> <input type = "submit" value = "����"> </td> </tr>
</table>
</form>

</body>
</html>