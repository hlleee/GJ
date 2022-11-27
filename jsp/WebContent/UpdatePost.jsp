<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
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
	request.setCharacterEncoding("UTF-8");
	String posnum = request.getParameter("_posnum");
	String title = "", content = "", type = "";
	String userID = "me";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from post where comnic = '"+userID+"' and posnum = '"+posnum+"'");
		if(rs.next()){
		rs = stmt.executeQuery("select * from post where posnum = '"+posnum+"'");  	// 클릭한 게시글 번호 받아와서 조회수 받아옴
			if(rs.next()){
		
				title = rs.getString("postit");
				content = rs.getString("poscon");
				type = rs.getString("btype");
			} 
		} else{
			out.println("<script>alert('권한이 없습니다.');</script>");	
			out.println("<script>location.href='View.jsp?_posnum='"+posnum+"'';</script>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<form action = UpdatePostBack.jsp method = "post">
<div id = "input"><h3>글 작성</h3>
				<select name="_type">    

                    <option <%if(type.equals("자유게시판")) out.println("selected"); %>>자유게시판</option>

                    <option <%if(type.equals("취업후기게시판")) out.println("selected"); %>>취업후기게시판</option>

                    <option <%if(type.equals("면접게시판")) out.println("selected"); %>>면접게시판</option>

                    <option <%if(type.equals("질문게시판")) out.println("selected"); %>>질문게시판</option>
                    
                     <option <%if(type.equals("채용게시판")) out.println("selected"); %>>채용게시판</option>
                    
				</select><p>
				<input type = "hidden" name = "_posnum" value = <%=posnum %>>
				<input type = "text" name = "_title" style = "width : 99%;"  value=<%=title %> required> <p>
				<textarea name = "_content" style = "width : 99%; height : 400px;" required><%=content %></textarea> 
</div>
<div id="btn"><input type = "submit" value = "작성" >
			  <input type = "reset" value = "취소" > 
</div>
</form>
</body>
</html>