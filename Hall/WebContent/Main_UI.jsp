<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>레이아웃</title>
    <link rel="stylesheet" href="main_login.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/77e29b57dd.js"
      crossorigin="anonymous"
    ></script>
    <!-- defer란 무엇인가?!!!! -->
    <script src="index.js" defer></script>
  </head>
  <style>
  
  table {border-collapse : collapse;} 
    * {
    box-sizing: border-box; /* 길이 계산을 편하게 하기위함. box-sizing에 관한 설명은 아래 링크를 참고해주세요 */
  }
  body {
    margin: 0; /* body의 기본마진을 없애줍니다(선택사항) */
    font-family: sans-serif;
  }
  /* 기본 밑줄을 제거합니다 */
   a {
    text-decoration: none; 
    color: rgb(54, 50, 50);
  }
  /* 마우스 커서가 올라갔을 때 밑줄을 생성합니다*/
   a:hover {
    text-decoration: underline; 
  }  

  header {
    
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 160px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
  }
    /* 기본 border 없애기(이 코드를 지우고 기본 border를 확인해보세요) */
  fieldset {
    border: none;
    display: inline-block;
  }

 .logo{
    width: 30%;
    height: 150px;
    background-color: #c2cfe6;
    padding-left: 180px;
  }
  .logo img {
    padding-top: 35px;
   
  }
  
  .visually-hidden { /* legend 안보이게 설정. 이렇게하면 접근성을 준수하면서 디자인을 해치지 않습니다. */
    position: absolute !important;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px, 1px, 1px, 1px);
    white-space: nowrap;
  }
  /* 링크들을 상단 우측에 위치시킵니다. */
  /* .links {
    position: absolute;
    top: 0;
    right: 0;
  }
  .link_text {
    font-size: 10px;
    margin-left: 5px;
  }
  .img_logo {
    margin-bottom: 12px;
    width: 220px;
    height: 65px;
  } */

  .search {
    width : 45%;
    height: 150px;
    padding-top: 60px;
    padding-left: 30px;
    background-color: #c2cfe6;
  }

  .search_box {
    width: 500px;
    height: 50px;
    
    border: 4px solid #4479db;
    display: flex;
    align-items: center;
  }
  .search_box input {
    flex: 9; /* search-box내부에서 9만큼의 크기를 차지(비율) */
    height: 46px;
    padding-left: 12px;
    padding-right: 12px;
    border: none;
    outline: none;
    font-size: 18px;
  }
  .search_box button {
    flex: 1; /* search-box내부에서 1만큼의 크기를 차지(비율) */
    height: 46px;
    padding: 0;
    border: none;
    outline: none;
    background: #4479db;
    color: #ffffff;
  }

  .login {
    width: 25%;
    height: 150px;
    background-color: #c2cfe6;
    padding: 10px;
  }

  /* .myinfo {
    width: 100%;
    height: 80px;
    background-color: #4479db;
  } */

  .myinfo {
    justify-content: flex-end;
    display: flex;
    list-style: none;
    padding-right: 150px;
    padding-top: 30px;
    font-size: 12px;
    width: 100%;
    height: 60px;
    background-color: #c2cfe6;
  }
  
  .myinfo li {
    font-size: larger;
    padding: 5px 12px;
  }
  .myinfo li:hover{
    text-decoration: underline;
  }

  .member {
    margin: auto;
    width: 100%;
    height: 20px;
    /* background-color: #8361d4; */
    padding-right: 60px;
    padding-top: 0px;
    
    background-color: #c2cfe6;
  }

  /* nav */
    nav {
    width: 100%;
    height: 42px;
    text-align: center;
    justify-content: center;
    bottom: 0;
    background-color: rgb(187, 224, 215);
  }
  .nav_items {
    width: 100%;
    height: 100%;
    /* display: flex; */
    justify-content: center;
    align-items: center;
    font-size: 18px;
    font-weight: bold;
    border-top: 1px solid #f1f3f6;
  }
 
  .nav_items ul > li {
    display: inline-block;
    margin-left: 10px;
  } 

  /* <ul>하위 7번째 <li>까지 각각 내부의 <a> 태그 접근 */
  /* .nav_items ul > li:nth-child(-n + 7) > a { 
    color: #58b4cd;
  } */

  .nav_items ul > li > a {
    text-decoration: none;
    cursor: pointer;
  }
  
  
 
  /* 재사용 클래스 */
  /* .color_naver {
    color: #03cf5d;
  } */

   section {
    background-color: #dee4ed;	 
    height: 450px;
    float:left;
    width:100%;
    padding: 5px;
  }

   article {
    display: flex;
    /* margin-top: 10px; */
    padding: 2px;
    background-color:  #dee4ed;
  }

  .container{
    padding: 3px;
    height: 100%;
    width: 100%;
    }

    .area1{
        width: 35%;
        height: 460px;
        background-color: #ffffff;
        display: block;
        padding: 3px;
    }

    /* .area1> .free */
    .area1> .gesipan{
        background-color: #c2cfe6;
        width: 100%;
        height: 48%;
        padding: 0px;
        margin: 0px;
        border: 3px solid rgba(126, 131, 141, 0.395)
    }
     
    .gesipan > b {
        padding-top: 0;
        font-weight: bold;
    }
    .gesipan_in{
        background-color: #cdeaf1;
        height: 185px;
        /* padding: 10px;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr; */
    }
    /* .room{
        background-color: aqua;
        margin: 5px;
    } */

    .room {
        width: 100%;
        height: 100%;
        border: 3px solid #e0eaec
    }
    
    .area1> .question{
      background-color: #dae2f0;
      width: 100%;
      height: 48%;
      padding: 0px;
      margin: 0px;
      border: 3px solid rgba(126, 131, 141, 0.395)
  }
    .area2 {
      width: 35%;
      height: 460px;
      background-color: #ffffff;
      display: block;
      padding: 3px;
    }

    .area2 > .interview{
      background-color: #dae2f0;
      width: 100%;
      height: 48%;
      padding: 0px;
      margin: 0px;
      border: 3px solid rgba(126, 131, 141, 0.395)
    }
    
    .area2 > .job_review{
      background-color: #c2cfe6;
      width: 100%;
      height: 48%;
      padding: 0px;
      margin: 0px;
      border: 3px solid rgba(126, 131, 141, 0.395)
    }

    

    .area3{
        width: 30%;
        height: 440px;
        background-color: #ffffff;
        padding: 3px;
    }

    .area3> .hire {
        background-color: #c2cfe6;
        width: 100%;
        height: 440px;
        padding: 0px;
        border: 3px solid rgba(126, 131, 141, 0.395)
    }
  
    .gesipan_in2{
      background-color: #cdeaf1;
      width: 100%;
      height: 355px;
      border: 3px solid #e0eaec
      
  }
 /* 푸터 */


  footer {
    color: black;   
    height: 90px;
    font-size: 12px;
    background-color: rgb(236, 236, 244);
    position: relative;
    clear: both;
    width:100%;
    bottom: 0;
  }
  
  .bottom_box {
    flex: 2;
    font-size: 14px;
    text-align: center;
  }
  .bottom_box ul > li {
    display: inline-block; /* 수평정렬 */
    margin-left: 8px;
  }
  .bottom_box >p { /* 마지막 li요소 (굿잡 Corp.) 굵게 */
    font-weight: bold;
  }
  /* 재사용 클래스 */
  
  .text_bold-13 {
    font-weight: bold;
    font-size: 13px;
  }
  </style>
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
            <button type="submit" tabindex="2">
              검색
            </button>
            
          </div>
          
        </fieldset>
        
      </form>
      </div>
      <div class="login">
        <ul class="myinfo">
            <li><a href="/" class="link_text_name"><%= (String)session.getAttribute("__ID") %></a>님</li>
            <li><a href="Logout.jsp" class="link_text" >로그아웃</a></li> 
        </ul>
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
    <nav>
    <div class="nav_items">
        <ul>
          
          <li><a href="">전체글</a></li>
          <li><a href="">자유게시판</a></li>
          <li><a href="">질문게시판</a></li>
          <li><a href="">면접게시판</a></li>
          <li><a href="">취업후기게시판</a></li>
          <li><a href="">채용게시판</a></li>

        </ul>
      </div>
    </nav>
     <section>
        <article class="container">
            <article class="area1">
                <div class="gesipan">
                    <P style="text-align: center; font-size: 10px;"><a href="자유게시판.jsp"><b>자유게시판</b></a></P>
                    <div class = "gesipan_in">
                        <%
	
	request.setCharacterEncoding("UTF-8");	
	String keyword = request.getParameter("_keyword");
	String id = request.getParameter("_id");	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where btype = '자유'LIMIT 3");
		//postit = '" + keyword + "'"
		//WHERE [컬럼명] LIKE '%특정문자열%'
		// AND views=
		
		%>
		<table border="1">
			
		<% 
		
		
		while(rs.next()){
			
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");
			
			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td width='150' height='30'>" + postit + "</td>");
			out.println("<td width='370'>" + poscon + "</td>");
			out.println("<td width='60'>" + views + "</td>");
			out.println("<td width='100'>" + posdat + "</td>");
			out.println("<td width='70'>" + posnic + "</td>");
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
                    </div>
                </div>
                <div class="question">
                    <P style="text-align: center; font-size: 10px;"><a href="자유게시판.jsp"><b>질문게시판</b></a></P>
                    <div class = "gesipan_in">
                        <%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where btype = '질문' LIMIT 3");
	
		
		%>
		<table border="1">
			
		<% 
		
		request.setCharacterEncoding("UTF-8");
		
		while(rs.next()){
			
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");

			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td width='150' height='30'>" + postit + "</td>");
			out.println("<td width='370'>" + poscon + "</td>");
			out.println("<td width='60'>" + views + "</td>");
			out.println("<td width='100'>" + posdat + "</td>");
			out.println("<td width='70'>" + posnic + "</td>");
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
                    </div>
                </div>
            </article>

            <article class="area2">
                <div class="interview">
                    <P style="text-align: center; font-size: 10px;"><a href="자유게시판.jsp"><b>면접게시판</b></a></P>
                    <div class = "gesipan_in">
                         <%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where btype = '면접' LIMIT 3");
	
		
		%>
		<table border="1">
			
		<% 
		
		request.setCharacterEncoding("UTF-8");
		
		while(rs.next()){
			
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");

			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td width='150' height='30'>" + postit + "</td>");
			out.println("<td width='370'>" + poscon + "</td>");
			out.println("<td width='60'>" + views + "</td>");
			out.println("<td width='100'>" + posdat + "</td>");
			out.println("<td width='70'>" + posnic + "</td>");
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
                    </div>
                </div>
                <div class="job_review">
                    <P style="text-align: center; font-size: 10px;"><a href="자유게시판.jsp"><b>취업후기게시판</b></a></P>
                    <div class = "gesipan_in">
                         <%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where btype = '취업후기' LIMIT 3");
	
		
		%>
		<table border="1">
			
		<% 
		
		request.setCharacterEncoding("UTF-8");
		
		while(rs.next()){
			
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");

			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td width='150' height='30'>" + postit + "</td>");
			out.println("<td width='370'>" + poscon + "</td>");
			out.println("<td width='60'>" + views + "</td>");
			out.println("<td width='100'>" + posdat + "</td>");
			out.println("<td width='70'>" + posnic + "</td>");
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
                    </div>
                </div>
        
            </article>
            <article class="area3">
                <div class="hire">
                    <P style="text-align: center; font-size: 13px;"><a href="자유게시판.jsp"><b>채용정보</b></a></P>
                    <div class = "gesipan_in2">
                         <%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where btype = '채용' LIMIT 7");
	
		
		%>
		<table border="1">
			
		<% 
		
		request.setCharacterEncoding("UTF-8");
		
		while(rs.next()){
			
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");

			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td width='150' height='30'>" + postit + "</td>");
			out.println("<td width='370'>" + poscon + "</td>");
			out.println("<td width='60'>" + views + "</td>");
			out.println("<td width='100'>" + posdat + "</td>");
			out.println("<td width='70'>" + posnic + "</td>");
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
                    </div>
                </div>
            </article>
            
        </article>
        
        
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
    