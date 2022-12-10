<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
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
      <a href="Main_UI.jsp">
     <img src="GJ_Logo.png" class="img_logo" style="display: block; width:300px; "/>
     </a>
      </div>
      <div class="search">
      <form name="search" action="Search_UI.jsp" method="post" >
        <fieldset>
          <legend class="visually-hidden">검색</legend>
          <div class="search_box">
            <input name="_keyword" type="text" maxlength="225" tabindex="1" />
            <button type="submit" tabindex="2">검색</button>
          </div>
        </fieldset>
      </form>
      </div>
      <div class="login">
        <ul class="myinfo">
            <li><a href="/" class="link_text_name"><%= (String)session.getAttribute("__ID") %></a>님</li>
            <li><a href="Main.jsp" class="link_text" >로그아웃</a></li> 
        </ul>
        <div class="member">
        
        <%
	//총 회원수 받아오기, 성공..!
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/pro","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		String strQuery = "Select count(id) from member";
	    ResultSet rs = stmt.executeQuery(strQuery);

	    String Countrun="";
	      while(rs.next()){
	      Countrun = rs.getString(1);
	      
	       } 
	      
	      out.println("<p style='text-align: center;'>"+"총 회원수 : <b>"+ Countrun + "명</b></p>");
	      
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
        </div>
      </div>
    </header>
    

<nav class="menu">
		<div class="box" text-align: center>
				<a href="BulletinBoard.jsp"><button class="button button--nina button--text-thick button--text-upper button--size-s" data-text="전체글">
            <span>전</span><span>체</span><span>글</span></button></a>
				<a href="BulletinBoard2.jsp"><button class="button button--nina button--text-thick button--text-upper button--size-s" data-text="취업후기게시판">
            <span>취</span><span>업</span><span>후</span><span>기</span><span>게</span><span>시</span><span>판</span></button></a>
				<a href="BulletinBoard3.jsp"><button class="button button--nina button--text-thick button--text-upper button--size-s" data-text="자유게시판">
            <span>자</span><span>유</span><span>게</span><span>시</span><span>판</span></button></a>
				<a href="BulletinBoard4.jsp"><button class="button button--nina button--text-thick button--text-upper button--size-s" data-text="면접게시판">
            <span>면</span><span>접</span><span>게</span><span>시</span><span>판</span></button></a>
				<a href="BulletinBoard5.jsp"><button class="button button--nina button--text-thick button--text-upper button--size-s" data-text="질문게시판">
            <span>질</span><span>문</span><span>게</span><span>시</span><span>판</span></button></a>
				<a href="BulletinBoard6.jsp"><button class="button button--nina button--text-thick button--text-upper button--size-s" data-text="채용게시판">
            <span>채</span><span>용</span><span>게</span><span>시</span><span>판</span></button></a>
		</div>
</nav>

<nav class="nav2">
	<div class="box">
	<% //<%=는 프린트임
	request.setCharacterEncoding("UTF-8");
	int state = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/pro", "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select * from post where postnum > 10");
		%>
		 <table border = "1" width="1200px" > 
			<tr height="30px"><th>번호</th><th width="150">게시판</th><th width="500">제목</th><th>작성자</th><th>조회수</th><th width="120">작성일</th><th>댓글</th><th>좋아요</th></tr>
		
		<% 	
	
		if(rs.next())	{
			do {
				
				int postnum = rs.getInt("postnum");			//게시글번호
				String btype = rs.getString("btype");		//게시판유형
				String postit = rs.getString("postit");		//게시글제목
				String posnic = rs.getString("posnic");		//작성자
				int views = rs.getInt("views");				//조회수
				String posdat = rs.getString("posdat");		//날짜
				int commentcnt = rs.getInt("commentcnt");	//댓글 수
				int likes = rs.getInt("likes");				//좋아요 수
				
				
					out.println("<tr height = '40'>");
					out.println("<td>" + postnum + "</td>");
					out.println("<td>" + btype + "</td>");
					out.println("<td>" + postit + "</td>");
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
		<a href="BulletinBoardPage2.jsp" class="btn-gradient blue mini">2</a>
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
        <li><p>개인정보처리방침</p></li>
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