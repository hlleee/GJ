<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
</head>
<style type="text/css">

#text{
width:85%;
float : left;
margin-top : 1%
}

#inqCheck{
width:65%;
float : left; 
margin-left : 15%;
text-align : center;
}
#content{
width:70%;
float : left; 
margin-left : 15%;
margin-top : 3%;
padding : 1%;
border-radius: 15px;
border : 1px solid;
background-color : rgb(240, 255, 255);
}

.table {
    width:100%; 
    margin-left:5%; 
}
.right {
    text-align : right;
    width : 100px;
    vertical-align : top;
}

.likeBtn {
  background-color: rgb(240, 255, 255);
  border-color : red;
  color: red;
  padding: 5px 20px;
  text-align: center;
  margin-top : 15px;
  font-size: 30px;
  border-radius: 100%;
  cursor: pointer;

}

 
  #main{
  width:80%;
float : left;
margin-left : 10%;
border-radius: 30px;
border : 1px solid;
padding-top : 3%;
padding-bottom : 3%;
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
    padding-top: 37px;
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
    
    border: 4px solid #3D5F95;
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
    background: #3D5F95;
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
    padding-top: 60px;
    font-size: 12px;
    width: 100%;
    height: 80px;
    
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
    /* background-color: #8361d4; */
    padding-right: 120px;
    padding-top: 10px;
   
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

  footer {
    color: black;   
    height: 90px;
    font-size: 12px;
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
  text{
  font-size : 3px;
  color : rgb(200, 200, 200);
  vertical-align : center;
  }
  
  .btn{
    margin: auto;
    width: 70px;
    height: 30px;
    border: none;
    outline: none;
    background-color: #3D5F95;
    padding-bottom: 0px;
    color: #ffffff;
    border-radius: 5px;
    }
    
    .inqCheck{
     margin: auto;
     width : 55px;
    height: 55px;
    font-size : 12px;
    border: none;
    outline: none;
    background-color: #3D5F95;
    padding-bottom: 0px;
    color: #ffffff;
    border-radius: 5px;
    
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
            <li><a href="Main_UI.jsp"><%= (String)session.getAttribute("__NAME") %></a>님</li>
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
	      conn.close();
	      stmt.close();
	      rs.close();
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
        <li><a href="BulletinBoard.jsp">전체게시판</a></li>
        <li><a href="BulletinBoard3.jsp">자유게시판</a></li>
        <li><a href="BulletinBoard5.jsp">질문게시판</a></li>
        <li><a href="BulletinBoard4.jsp">면접게시판</a></li>
        <li><a href="BulletinBoard2.jsp">취업후기</a></li>
        <li><a href="BulletinBoard6.jsp">채용정보</a></li>
      </ul>
     
    </nav>
    <br>
<% 
	//게시글 출력
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("_inqnum");    //게시글번호 받아옴
	String title = "", content = "", name = "", type = "", date = "";
	String userID =  (String) session.getAttribute("__NAME");
	
	if(userID.equals("Admin")){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('관리자만 접근이 가능합니다.');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	} 
	else{
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false","root","1234");
			Statement stmt = conn.createStatement();
			Statement stmt2 = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from inquiry where inqnum = '"+num+"'");  	// 클릭한 게시글 번호 받아와서 조회수 받아옴
				if(rs.next()){					
					title = rs.getString("inqtit");
					content = rs.getString("inqcon");
					name = rs.getString("inqnic");
					date = rs.getString("inqdat");
					type = rs.getString("category");
					
				} else{
					out.println("<script>alert('유효하지 않은 문의입니다.');</script>");	
					out.println("<script>location.href='AllInquiry.jsp';</script>");
				}
		
	
%><div id = "main">
	<div id = "text">
		<table style = "width : 100%;">
			<tr> 
				<td></td>
				<td colspan = 2 style = "margin-bottom : 4px"> <font size = "2px"><b><%=type %></b> </font></td> 
			</tr>
			<tr>
				<td style = "text-align : right;"><text> 제목 | &nbsp;</text></td>
				<td colspan = 2 ><font size = "6px"><b><%=title %></b></font></td>
			</tr>
			<tr>
				<td style = "text-align : right;"><text> 작성자 |&nbsp; </text></td>
				<td > <%=name %></td>
				<td style = "text-align : right;"><text> <%=date %></text></td>
			</tr>
		</table>
		
	</div>
	<div id = "content">
		<table style = "width : 95%; margin-left : 5%;">
			
			<tr>
				<td><div style = "min-height : 200px;"><%=content.replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div></td>				
			
				<td style = "text-align : right; vertical-align : top;"> 
					<form action = "AllInquiry.jsp" method = "post">
						<input type = submit  class = "btn" value = "문의 목록">
					</form>
					
				</td>			
			</tr>
			<tr>
				
				<td colspan = 2 style = "text-align : right; width : 50px;">
				<form action = "ViewCSBack.jsp" method = "post">	
						<button class = "btn">처리완료</button>
					</form>
				</td>
			</tr>
		</table>
	</div>
	
	</div>
	<br>
	<%
		conn.close();
		stmt.close();
		rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

	%>
	
<!--풋터-->
	<hr>
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