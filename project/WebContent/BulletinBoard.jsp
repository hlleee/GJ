
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="BulletinStyle.css">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>
<header>

      <div class="logo">
      <a href="Main.jsp">
     <img src="GJ_Logo.png" class="img_logo" style="display: block; width:300px; "/>
     </a>
      </div>
      <div class="search">
      <form name="search" action="Search.jsp" method="post" >
        <fieldset>
          <legend class="visually-hidden">검색</legend>
          <div class="search_box">
            <input name="_keyword" type="text" maxlength="225" tabindex="1" />
            <button type="submit" tabindex="2">검색</button>
          </div>
        </fieldset>
      </form>
      </div>
	
       
        <div class="member">
        <%
	//총 회원수 받아오기, 성공..!
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		String strQuery = "Select count(id) from member";
	    ResultSet rs = stmt.executeQuery(strQuery);

	    String Countrun="";
	      while(rs.next()){
	      Countrun = rs.getString(1);
	      
	       } 
	      
	      out.println("<p>"+"총 회원수 : <b>"+ Countrun + "명</b></p>");
	      
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
        </div>
      
    </header>
    <nav class="navbar">
 	  <!-- menu -->
      <ul class="navbar-menu">
        <li><a href="BulletinBoard.jsp">전체게시판</a></li>
        <li><a href="BulletinBoard3.jsp">자유게시판</a></li>
        <li><a href="BulletinBoard5.jsp">질문게시판</a></li>
        <li><a href="BulletinBoard4.jsp">면접게시판</a></li>
        <li><a href="BulletinBoard2.jsp">취업후기</a></li>
        <li><a href="BulletinBoard6.jsp">채용정보</a></li>
      </ul>
     
    </nav>

<nav class="nav2">
	<div class="box">
	<% //<%=는 프린트임
	request.setCharacterEncoding("UTF-8");
	int state = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/gj", "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select * from post where posnum < 10 or posnum = 10");
		%>
		 <table border = "1" width="1200px"> 
			<tr height="30px"><th width="55">번호</th><th width="150">게시판</th><th width="500">제목</th><th width="100">작성자</th><th width="90">조회수</th><th width="120">작성일</th ><th width="60">댓글</th><th width="60">좋아요</th></tr>
			
		<% 	
		if(rs.next())	{
			do {
				int postnum = rs.getInt("posnum");			//게시글번호
				String btype = rs.getString("btype");		//게시판유형
				String postit = rs.getString("postit");		//게시글제목
				String posnic = rs.getString("posnic");	
				String poscon = rs.getString("poscon");	//작성자
				int views = rs.getInt("views");				//조회수
				String posdat = rs.getString("posdat");		//날짜
				int commentcnt = rs.getInt("commentcnt");	//댓글 수
				int likes = rs.getInt("likes");				//좋아요 수
				
				
					out.println("<tr height = '40'>");
					out.println("<td>" + postnum + "</td>");
					out.println("<td>" + btype + "</td>");
					out.println("<td><a href='View.jsp' class='a2'>" + postit + "</a></td>");
					out.println("<td>" + posnic + "</td>");
					out.println("<td>" + views + "</td>");
					out.println("<td>" + posdat + "</td>");
					out.println("<td>" + commentcnt + "</td>");
					out.println("<td>" + likes + "</td>");
					out.println("</tr>");
					
				} while(rs.next());
		}		
			else{
				String su = "등록된 글이 없습니다.";
				out.println("<tr>");
				out.println("<td height = '420' colspan = '8'>" + su + "</td>");
				out.println("</tr>");
			}

		
		
		%> </table> <%
	} catch(SQLException e) {
		e.printStackTrace();
	}
%>
			
	</div>
</nav>

<section class="center2">
	<div class="box">
		 <a href="WritingPage.jsp" class="normal btn-gradient blue">🖍글쓰기</a>
	</div>
</section>


<section class="center3">
	<div class="box">
	<a href="BulletinBoard.jsp" class="btn-gradient blue mini">◁</a>
	<a href="BulletinBoard.jsp" class="btn-gradient blue mini">1</a>
			
<%
	request.setCharacterEncoding("UTF-8");
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/pro", "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("Select postnum from post"); 
	
	if(rs.next())	{
		while(rs.next()){
			int postnum = rs.getInt("postnum");			//게시글번호
			
			if(postnum > 10) {
				out.println("<a href='BulletinBoardPage2.jsp' class='btn-gradient blue mini'>2</a>");
				state = 1;
				break;
			}
		} 
	}		
	
} catch(SQLException e) {
	e.printStackTrace();
}
%>
			<a href="BulletinBoardPage2.jsp" class="btn-gradient blue mini">▷</a>
	</div>
</section>

  <footer>
   <div class="bottom_box">
        <ul>
        <li><p>회사소개</p></li>
        <li><p>인재채용</p></li>
        <li><p>제휴제안</p></li>
        <li><p>이용약관</p></li>
        <li><p><a>문의하기</a></p></li>
        <li><p>청소년보호정책</p></li>
        <li><p>굿잡 정책</p></li>
        <li><p>고객센터</p></li>
        
        </ul>
    </div>
     <div class="bottom_box">
     <p>&copy; 굿잡 Corp.</p>
     </div>
</footer>
</body>
</html>