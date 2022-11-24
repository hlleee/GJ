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
    background-color: #acbfe1;
    padding-left: 180px;
  }
  .logo img {
    right: 20px;
    padding-top: 30px;
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
    width: 25%;
    height: 150px;
    background-color: #8db2f2;
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
    background-color: #8db2f2;
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
    
    background-color: #8db2f2;
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
    background-color: green;	 
    height: 450px;
    float:left;
    width:100%;
    padding: 10px;
  }

   article {
    display: flex;
    /* margin-top: 10px; */
    padding: 5px;
    background-color: #999;
  }

  .container{
    padding: 5px;
    height: 100%;
    width: 100%;
    }

    .area1{
        width: 35%;
        background-color: #ca0e94;
        display: block;
        padding: 3px;
    }

    /* .area1> .free */
    .area1> .gesipan{
        background-color: rgb(245, 170, 210);
        width: 100%;
        height: 50%;
        padding: 0px;
        margin: 0px;
        border: 3px solid rgba(11, 26, 192, 0.395)
    }
        /* 모든방 */
    /* .gesipan{
        background-color: crimson;
        padding: 5px;
        width: 100%;
        height: 50%;
        padding-top: 0;
    } */
    .gesipan > b {
        padding-top: 0;
        font-weight: bold;
    }
    .gesipan_in{
        background-color: #03cf5d;
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
        height: 80px;
        border: 3px solid rgba(11, 26, 192, 0.395)
    }
    
    .area1> .question{
        background-color: rgb(198, 152, 177);
        
        width: 100%;
        height: 50%;
        padding: 0px;
        margin: 0px;
        border: 3px solid rgba(11, 26, 192, 0.395)
    }

    .area2 {
        width: 35%;
        background-color: aqua;
        display: block;
        padding: 5px;
    }

    .area2 > .interview{
        background-color: rgb(131, 237, 188);
        width: 100%;
        height: 50%;
        padding: 0px;
        border: 3px solid rgba(11, 26, 192, 0.395)
    }
    .area2 > .job_review{
        background-color: rgb(118, 180, 141);
        width: 100%;
        height: 50%;
        padding: 0px;
        border: 3px solid rgba(11, 26, 192, 0.395)
    }

    

    .area3{
        width: 30%;
        background-color: rgb(230, 225, 99);
    }

    .area3> .hire {
        background-color: rgb(118, 180, 141);
        width: 100%;
        height: 100%;
        padding: 0px;
        border: 3px solid rgba(11, 26, 192, 0.395)
    }
  /*
  .container1 {
    display: flex;
    justify-content: space-between;
    align-items: stretch;
    background-color: rgb(216, 157, 84);
    padding: 10px;
    width: 35%;
    height: 100%;
    margin: 10px;
    
  } */
  
  /* .container2 {
    display: flex;
    justify-content: space-between;
    align-items: stretch;
    background-color: rgb(208, 208, 102);
    padding: 10px;
    width: 35%;
    height: 100%;
    margin: 10px;
  }

  .container3 {
    display: block;
    justify-content: space-between;
    align-items: stretch;
    background-color: rgb(208, 208, 102);
    padding: 10px;
    width: 30%;
    height: 100%;
    margin: 10px;
  } */


  /* 푸터 */


  footer {
    color: black;   
    /* height: 110px; */
    font-size: 12px;
    background-color: rgb(176, 176, 229);
    position: relative;
    clear: both;
    width:100%;
    bottom: 0;
  }
  
  .aside_box {
    flex: 1;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #91acd6;
    padding: 0;
    margin: 0;
  }
  .area_user {
    flex: 4;
    line-height: 1em; /* 줄간격 */
  }
  .area_user_row {
    display: flex;
  }
  .area_user_row span {
    flex: 1;
  }
  .area_user_row ul {
    flex: 6;
  }
  /* .aur_title {
    font-size: 13px;
    font-weight: bold;
  } */
  .area_user_row ul > li {
    display: inline-block; /* li 수평정렬하는 방법 */
    margin-left: 8px;
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
  .bottom_box ul > li:last-child { /* 마지막 li요소 (굿잡 Corp.) 굵게 */
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
     <img src="GJ_Logo.png" class="img_logo" style="display: block; width:300px; "/>
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
            <li><a href="Main.jsp" class="link_text" >로그아웃</a></li> 
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
        <!-- <div class="keyword">
          <span class="color_naver">1</span>
          <span>Eoldam spark</span></span>
        </div> -->
      </div>
    </nav>
    
    
    <section>
        <article class="container">
            <article class="area1">
                <div class="gesipan">
                    <P style="text-align: center; font-size: 10px;">자유게시판</P>
                    <div class = "gesipan_in">
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>김인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 자유게시판입니다. 글내용을 작성해주세요</td>
                                   
                                </tr>
                            </table>
                        </div>
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>박인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 자유게시판입니다. 글내용을 작성해주세요</p></td>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="question">
                    <P style="text-align: center; font-size: 10px;">질문게시판</P>
                    <div class = "gesipan_in">
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>김인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 질문게시판입니다. 글내용을 작성해주세요</td>
                                   
                                </tr>
                            </table>
                        </div>
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>박인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 질문게시판입니다. 글내용을 작성해주세요</p></td>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </article>

            <article class="area2">
                <div class="interview">
                    <P style="text-align: center; font-size: 10px;">면접게시판</P>
                    <div class = "gesipan_in">
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>김인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 면접게시판입니다. 글내용을 작성해주세요</td>
                                   
                                </tr>
                            </table>
                        </div>
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>박인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 면접게시판입니다. 글내용을 작성해주세요</p></td>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="job_review">
                    <P style="text-align: center; font-size: 10px;">취업후기게시판</P>
                    <div class = "gesipan_in">
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>김인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 취업후기게시판입니다. 글내용을 작성해주세요</td>
                                   
                                </tr>
                            </table>
                        </div>
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>박인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 취업후기게시판입니다. 글내용을 작성해주세요</p></td>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
        
            </article>
            <article class="area3">
                <div class="hire">
                    <P style="text-align: center; font-size: 20px;">채용정보</P>
                    <div class = "gesipan_in">
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>김인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요. 이것은 채용게시판입니다.</td>
                                   
                                </tr>
                            </table>
                        </div>
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>박인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요.이것은 채용게시판입니다.</p></td>
                                    
                                </tr>
                            </table>
                        </div>
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>박인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요.이것은 채용게시판입니다.</p></td>
                                    
                                </tr>
                            </table>
                        </div>
                        <div class = "room">
                            <table>
                                <tr>
                                    <td><b>글제목</b></td>
                                    <td>박인하</td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><p width="10" height="10">안녕하세요.이것은 채용게시판입니다.</p></td>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </article>
            
        </article>
        
        
    </section>
    
    <footer>
   
        <div class="aside_box">
          <div class="area_user">
            <div class="area_user_row">
              <span class="text_bold-13">Creators</span>
              <ul>
                <li><p>크리에이터</p></li>
                <li><p>스몰비즈니스</p></li>
              </ul>
            </div>
            <div class="area_user_row">
              <span class="text_bold-13">Partners</span>
              <ul>
                <li><p>비즈니스 광고</p></li>
                <li><p>스토어 개설</p></li>
                <li><p>지역업체 등록</p></li>
              </ul>
            </div>
            <div class="area_user_row">
              <span class="text_bold-13">Developers</span>
              <ul>
                <li><p>굿잡 개발자센터</p></li>
                <li><p>오픈API</p></li>
                <li><p>오픈소스</p></li>
                <li><p>굿잡 D2</p></li>
                <li><p>굿잡 D2SF</p></li>
                <li><p>굿잡 랩스</p></li>
              </ul>
              
            </div>
          </div>
        </div>
        <div class="bottom_box">
            <ul>
              <li><p>회사소개</p></li>
              <li><p>인재채용</p></li>
              <li><p>제휴제안</p></li>
              <li><p>이용약관</p></li>
              <li><p>개인정보처리방침</p></li>
              <li><p>문의하기</p></li>
              <li><p>굿잡 정책</p></li>
              <li><p>고객센터</p></li>
              <li><p>&copy; 굿잡 Corp.</p></li>
            </ul>
          </div>
      </footer> 
  </body>
  </html>
    