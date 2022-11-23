<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보</h1>

<%
 	try{
 		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn = DriverManager.getConnection(
 				"jdbc:mysql://localhost/project","root","1234");
 		Statement stmt = conn.createStatement();
 		ResultSet rs = stmt.executeQuery("select * from member");
 		%> <table border = "1">
 			<tr><th>ID</th><th>암호</th><th>성명</th></tr>
 		<%
 		while(rs.next()){
 			String id = rs.getString("id");
 			String pw = rs.getString("pw");
 			String nickname = rs.getString("nickname");
 			
 			out.println("<tr>");
 			out.println("<td width = '100'><a href = 'Member_Delete_Query.jsp?id="+id+"&pw="+pw+"&nickname="+nickname+"'>" + id + "</a>"+"</td>");
 			out.println("<td width = '100'>" + pw + "</td>");
 			out.println("<td width = '100'>" + nickname + "</td>");
 			out.println("탈퇴하려면 아이디를 누르세요.");
 			out.println("</tr>");
 		}  
 		%> </table><%
 		} catch(SQLException e){
 		e.printStackTrace();
 	}
%>
</body>
</html>