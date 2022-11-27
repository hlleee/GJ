<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "view.ViewDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#text{
width:75%;
float : left;
margin-left : 5%;
}

#like{
width:65%;
float : left; 
margin-left : 15%;
text-align : center;
}
#content{
width:65%;
float : left; 
margin-left : 15%;
}
#comment{
width:65%;
float : left; 
margin-left : 15%;
}
#reply{
width:55%;
float : left; 
margin-left : 15%;
}

.table {
    width:80%; 
    margin-left:5%; 

}
.tableR {
    width:80%; 
    margin-left:10%; 

}

.button {
  background-color: white;
  border: none;
  color: red;
  padding: 5px 20px;
  text-align: center;
  margin-top : 15px;
  font-size: 30px;
  border-radius: 100%;
  cursor: pointer;

}
a{
	font-size : 5px;
	color : black;
}
</style>
</head>
<body>
<% 
	//게시글 출력
	request.setCharacterEncoding("UTF-8");
//	String num = request.getParameter("_num");    //게시글번호 받아옴
	String num = "2";
	String title = "", content = "", name = "", type = "", date = "";
	int view = 1;
	int like = 0;
	String userID = "me2";

	if(userID.isEmpty()){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('게시글 작성을 하려면 로그인을 하십시오.');</script>");		
		out.println("<script>location.href='Login.jsp';</script>");
	} 
	else{
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?useSSL=false","root","1234");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from post where posnum = '"+num+"'");  	// 클릭한 게시글 번호 받아와서 조회수 받아옴
				if(rs.next()){
					view += rs.getInt("view");		// 조회수 +1
					
					title = rs.getString("postit");
					content = rs.getString("poscon");
					name = rs.getString("posnic");
					date = rs.getString("posdate");
					type = rs.getString("btype");
					
					stmt.executeUpdate("update post set view = '"+view+"'where posnum = '"+num+"'");       // 조회수 저장
					
					rs = stmt.executeQuery("select count(posnum) from t_like where posnum = '"+num+"'"); //게시글의 좋아요 개수 받아옴
						while (rs.next())
						like = rs.getInt(1);
					
					conn.close();
					stmt.close();
					rs.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
	
%>
	<div id = "text">
		<table class="table">
			<tr> 
				<td> </td> 
				<td colspan = 3> <%=type %> </td> 
				<td colspan = 2 style = "text-align : right;">조회수 | <%=view %> </td>
			</tr>
			<tr>
				<td style = "text-align : right;">제목 | </td>
				<td colspan = 5> <%=title %> </td>
			</tr>
			<tr>
				<td style = "text-align : right;"> 작성자 | </td>
				<td colspan = 3> <%=name %></td>
				<td colspan = 2 style = "text-align : right;"> <%=date %></td>
			</tr>
		</table>
		
	</div>
	<div id = "content">
		<hr>
		<table class="table">
			<tr>
				<td style = "text-align : right; "> 
				
					<form action = "UpdatePost.jsp" method = "post">
						<input type = hidden name = "_posnum" value = <%=num %>>
						<input onclick = "return confirm('게시글을 수정하시겠습니까?')" type = submit value = "글 수정">
					</form>
				</td>
				<td style = "text-align : right;width :50px;">
					<form action = "DeletePost.jsp" method = "post">
						<input type = hidden name = "_posnum" value = <%=num %>>
						<input onclick = "return confirm('게시글을 정말 삭제하시겠습니까?')" type = submit value = "글 삭제">
					</form>
					
				</td>
			</tr>
			<tr>
				<td colspan=2><div style = "min-height : 200px;"><%=content.replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div></td>				
			</tr>
			<tr>
				<td colspan = 2 style = "text-align : right;"> 
					<form action = "글목록.jsp" method = "post">
						<input type = submit value = "글 목록">
					</form>
				</td>
			</tr>
		</table>
		<hr>
	</div>	
	<div id = "like">
		<form action = "ViewLike.jsp" method = "post">
			<input type = "hidden" name = "_posnum" value = <%=num %>>
			<button type = "submit" class = "button"><%
				ResultSet rsL=ViewDAO.like(num,userID); 
				if(rsL.next())
					out.println("♥");
				else out.println("♡");
				rsL.close();
			%>
			</button> <%=like%>
		</form>
	</div>
	<div id = "comment">
		<h3>댓글</h3>
		<%
			ResultSet rs = ViewDAO.comment(num);
		//		if(!rs.next()) out.println("작성된 댓글이 없습니다.");
				
				while (rs.next()){
			String comnic = rs.getString("comnic");
			String comcon = rs.getString("comcon");
			String comdate = rs.getString("comdate");
			int comnum = rs.getInt("comnum");
		%>
		<table class="table">
			<tr> 
				<td> <%=comnic%></td>
				<td> <%=comdate%></td>
				<td style = "text-align : right;"> <a href="ViewReply.jsp?_id=me2&_comchk=0&_fgnnum=<%=comnum%>&_posnum=<%=num%>">답글</a> 
											<a>|</a><a onclick = "return confirm('댓글을 정말 삭제하시겠습니까?')" href="DeleteComment.jsp?_id=me2&_comnum=<%=comnum%>&_comchk=1&_posnum=<%=num%>"> 삭제</a> 
											<a>|</a><a onclick = "return confirm('댓글을 수정 하시겠습니까?')" href="UpdateComment.jsp?_id=me2&_comnum=<%=comnum%>&_comchk=1&_content=<%=comcon%>"> 수정</a>
			</tr>
			<tr>
				<td colspan = 3><%=comcon.replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
			</tr>
		</table>
		
		<br>
			<%
				ResultSet rsR = ViewDAO.reply(comnum);
					while(rsR.next()){
						String renic = rsR.getString("comnic");
						String recon = rsR.getString("comcon");
						String redate = rsR.getString("comdate");
						String renum = rsR.getString("comnum");
			%>
				<table class= "tableR">
				<tr> 
					<td> ➥ <%=renic %></td>
					<td> <%=redate %></td>
					<td style = "text-align : right;">  <a onclick = "return confirm('답글을 정말 삭제하시겠습니까?')" href="DeleteComment.jsp?_id=me2&_comnum=<%=renum%>&_comchk=0&_posnum=<%=num%>"> 삭제</a> 
												<a>|</a><a onclick = "return confirm('답글을 수정 하시겠습니까?')" href="UpdateComment.jsp?_id=me2&_comnum=<%=renum%>&_comchk=0&_content=<%=recon%>"> 수정</a>
				</tr>
				<tr>
					<td colspan = 3"><div style = "margin-left:3%"><%=recon.replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")  %></div></td>
				</tr>
			</table>
			
			<br>
			<%
				}
		rsR.close();		
			}
		rs.close();
		}
		ViewDAO.close();
			%>
	
		<form action = "ViewComment.jsp" method = "post">
			<input type = "hidden" name = "_comchk" value = 1>
			<input type = "hidden" name = "_fgnnum" value = <%=num %>>
			<input type = "hidden" name = "_posnum" value = <%=num %>>
			<textarea style = "width : 600px; height : 50px;" name = "_content"></textarea>
			<span style="float:right;">  				<!-- 줄바꿈이 일어나지 않게 함 -->
			<button type = "submit" style = "height : 56px; font-size : 12px;">댓글 작성</button>
			</span>
		</form>
	</div>
</body>
</html>