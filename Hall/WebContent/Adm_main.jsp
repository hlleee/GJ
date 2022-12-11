<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 메인 화면 - 회원삭제가 메인</title>
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
    color: #888;
  }
  /* 마우스 커서가 올라갔을 때 밑줄을 생성합니다*/
   a:hover {
    text-decoration: underline; 
  } 

 
  header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 160px;
    display: inline-flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
    background-color: rgb(255, 255, 255);
  }
  
  fieldset {
    border: none;
    display: inline-block;
  }

  .logo{
    width: 30%;
    height: 150px;
    /* background-color: #acbfe1; */
    padding-left: 180px;
  }
  
  .logo img {
    right: 20px;
    padding-top: 27px;
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
    padding-top: 55px;
    padding-left: 70px;
    /* background-color: #acbfe1; */
  }

  .search_box {
    width: 500px;
    height: 50px;
    
    border: 4px solid #2867dd;
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
    background: #2867dd;
    color: #ffffff;
  }

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
    padding-right: 160px;
    padding-top: 50px;
    font-size: 12px;
    width: 100%;
    height: 80px;
    background-color: #ffffff;
  }
  
  .myinfo li {
    font-size: 17px;
    padding: 5px 12px;
   
  }
  .myinfo li:hover{
    text-decoration: underline;
  }

  .member {
    margin: auto;
    width: 100%;
    height: 20px;
    padding-right: 120px;
    padding-top: 0px;
    
  }

	 /* 메뉴바 */
	:root {
   /* --text-color: #eee5e9; */
    --background-color: #3D5F95;
    --accent-color: #6a87b5;
}

  /* 폰트는 최상위 컴포넌트에 */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* .body {
    margin: 0;
  } */

a {
    text-decoration: none;
    color: var(--text-color);
}

.navbar {
    position:sticky;
    top:0;
    justify-content: space-between;
    display: flex;
    align-items: center;
    padding: 22px 12px;
    background-color: var(--background-color);
    width: 100%;
    border-radius: 5px;
}

  /* menu */

.navbar-menu {
    display: flex;
    margin: auto;
    padding-left: 0px;
    list-style: none;
    font-size: 22px;
    /* font-family: "Black Han Sans", sans-serif; */
    color: #ffffff;
}
.navbar-menu li {
    padding: 15px 35px;
    word-spacing: 20px;
}

.navbar-menu li:hover {
    background-color: var(--accent-color);
    border-radius: 5px;
}

  


@media screen and (max-width: 768px) {
    .navbar {
        flex-direction: column;
        align-items: center;
        padding: 8px 24px;
    }

    .navbar-menu {
        display: none;
        flex-direction: column;
        text-align: center;
        width: 100%;
    }
    ￼ .navbar-menu a {
        display: block;
    }



    .navbar-menu.active {
        display: flex;
    }

}
 

  section {
    height: 450px;
    float:left;
    width:100%;
    padding: 10px;
  }

   article {
    display: flex;
    padding: 5px;
  }

  .container{
    justify-content: center;
    padding: 20px;
    height: 100%;
    width: 100%;
    
    }

    .area{
        width: 60%;
        display: block;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 0 1px #000;
    }

	table {
		width: 800px;
		
    	margin-left:13px; 
    	margin-right:13px;
		text-align: center;
	 	background-color: #e6eef9;
	  	border-collapse: collapse;
  		border-radius: 5px;
  		border-style: hidden;
  		box-shadow: 0 0 0 1px #000;
	}

/* 푸터 */


  footer {
    color: black; 
    width:100%;  
    height: 60px;
    font-size: 12px;
    padding: 10px;
    position: relative;
    clear: both;
    
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
            <li><a href="Adm_main.jsp" class="link_text_name"><%= (String)session.getAttribute("__NAME") %></a>님</li>
            <li><a href="Adm_main.jsp" class="link_text" >로그아웃</a></li> 
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
     <nav class="navbar">
 	  <!-- menu -->
      <ul class="navbar-menu">
        <li><a href="Gesipan.html">회원정보</a></li>
        <li><a href="createroom.html">문의,,</a></li>
        <li><a href="Myroom.html">질문게시판</a></li>
        <li><a href="Myroom.html">면접게시판</a></li>
        
      </ul>
     
    </nav>
  	<hr>
    <section>
        <article class="container">
            <article class="area" style="overflow-y:scroll">
               
<%
	request.setCharacterEncoding("UTF-8");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from member ");
		
		%>
		<table border="1">
		<tr><th>회원번호</th><th>ID</th><th>닉네임</th><th>직업</th></tr>
			
		<% 
		
		
		
		while(rs.next()){
			String memnum = rs.getString("memnum");
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String nickname = rs.getString("nickname");
			String ename = rs.getString("ename");
			String etype = rs.getString("etype");
			String joboffdiv = rs.getString("joboffdiv");
			
			
			out.println("<tr>");
			out.println("<td width='100' height = '40'>" + memnum + "</td>");
			out.println("<td width='180'>" + id + "</td>");
			out.println("<td width='180'>" + nickname + "</td>");
			out.println("<td width='180'>" + joboffdiv + "</td>");
			//out.println("<td><input type='button' onclick='location.href='Adm_Delete_Query.jsp?memnum="+memnum+"&id="+id+"&nickname="+nickname+"&joboffdiv="+joboffdiv+"' value='삭제''></td>");
			out.println("<td><a href='Adm_Delete_Query.jsp?memnum="+memnum+"&id="+id+"&nickname="+nickname+"&joboffdiv="+joboffdiv+"'>삭제</td>");
			
			out.println("</tr>");
		}
		%> </table>
		<%
		
	}catch (SQLException e){
		
		
	}

%>
                
            </article>  
        </article>
    </section>
    <hr>
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
    