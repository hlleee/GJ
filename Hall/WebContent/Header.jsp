
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<script
      src="https://kit.fontawesome.com/77e29b57dd.js"
      crossorigin="anonymous"
    ></script>
    <!-- defer란 무엇인가?!!!! -->
    <script src="index.js" defer></script>
  </head>
  <style>
    * {
    box-sizing: border-box; /* 길이 계산을 편하게 하기위함. box-sizing에 관한 설명은 아래 링크를 참고해주세요 */
  }
  body {
    margin: 0; /* body의 기본마진을 없애줍니다(선택사항) */
    font-family: sans-serif;
  }
  /* 기본 밑줄을 제거합니다 */
  /* a {
    text-decoration: none; 
    color: #888;
  }
  /* 마우스 커서가 올라갔을 때 밑줄을 생성합니다*/
  /* a:hover {
    text-decoration: underline; 
  }  */

  header {
    
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 150px;
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
    background-color: #acbfe1;
    padding-left: 180px;
  }
  .logo img {
    right: 20px;
    
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
  
  .search {
    width : 45%;
    height: 150px;
    padding-top: 60px;
    padding-left: 30px;
    background-color: #acbfe1;
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
   .login {
    width: 25%;
    height: 150px;
    background-color: #ffffff;
    padding: 0px;
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
    padding-right: 130px;
    padding-top: 50px;
    font-size: 12px;
    width: 100%;
    height: 80px;
    
  }
  
   .myinfo li {
    font-size: 17px;
    padding: 5px 10px;
   
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
    
    background-color: #8db2f2;
  }

  
  /* 메뉴바 */
  .box {
	width: 1300px;
	margin: 0 auto;
	align-content: center;
	align-items: center;
	text-align: center;
}

.button--nina {
	
   padding: 3em 2em;
  background: #7986cb;
  -webkit-transition: background-color 0.3s;
  transition: background-color 0.3s;
  outline: none;
  border-radius: 15px;			/*안 하면 마우스오버 해제할 때 모양 뾰족 네모임*/
  border: none;
  width: 180px;
  height: 60px;
  text-align: center;
  content: attr(data-text);
  opacity: 1;
  
}	

.button:active {
	box-shadow: none;
}
.button--nina > span {
	
  display: inline-block;	
  padding: 2em 0em;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, -20px, 0);							/*마우스 오버 전 글씨 위치 - 건들지말기*/
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s; 			/*하나씩 내려오기*/
  transition: transform 0.3s, opacity 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
  transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
  text-align: center;
}
.button--nina::before {	/*지우면 마우스 오버했을때만 보임*/
	
	align-content:center;
  
}

.button--nina:hover {		
	padding: 0em 2em;
	text-align: center;
	background-color: #3f51b5;
	box-shadow: 3px 3px 3px black;
	-webkit-transform: translate3d(0, 100%, 0);
 	transform: translate3d(0, -21px, 0);		/* 마우스 오버시 버튼 위치 */
 	border-radius: 15px;
}

.button--nina:hover::before {	
  opacity: 0;
  position: absolute; 
  -webkit-transform: translate3d(0, 100%, 0);
  transform: translate3d(0, 40px, 0);	/* 마우스 오버시 시작 글자 위치 */
  text-align: center;
}

.button--nina:hover > span {		/* 지우면 마우스 오버해도 안 보임*/
	
  opacity: 1;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0px, 0);		/*글씨 내려오는 위치 */
}
.button--nina:hover > span:nth-child(1) {
  -webkit-transition-delay: 0.045s;
  transition-delay: 0.045s;
}
.button--nina:hover > span:nth-child(2) {
  -webkit-transition-delay: 0.09s;
  transition-delay: 0.09s;
}
.button--nina:hover > span:nth-child(3) {
  -webkit-transition-delay: 0.135s;
  transition-delay: 0.135s;
}
.button--nina:hover > span:nth-child(4) {
  -webkit-transition-delay: 0.18s;
  transition-delay: 0.18s;
}
.button--nina:hover > span:nth-child(5) {
  -webkit-transition-delay: 0.225s;
  transition-delay: 0.225s;
}
.button--nina:hover > span:nth-child(6) {
  -webkit-transition-delay: 0.27s;
  transition-delay: 0.27s;
}
.button--nina:hover > span:nth-child(7) {
  -webkit-transition-delay: 0.315s;
  transition-delay: 0.315s;
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
            <li><a href="Main_UI.jsp"><b><%= (String)session.getAttribute("__NAME") %></b></a>님</li>
            <li><a href="MyInfo.jsp" class="link_text" ><b>내정보</b></a></li> 
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
    <menu>
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
	</menu>
    </nav>
</body>
</html>