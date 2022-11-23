<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>���̾ƿ�</title>
    <link rel="stylesheet" href="main_login.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/77e29b57dd.js"
      crossorigin="anonymous"
    ></script>
    <!-- defer�� �����ΰ�?!!!! -->
    <script src="index.js" defer></script>
  </head>
  <style>
    * {
    box-sizing: border-box; /* ���� ����� ���ϰ� �ϱ�����. box-sizing�� ���� ������ �Ʒ� ��ũ�� �������ּ��� */
  }
  body {
    margin: 0; /* body�� �⺻������ �����ݴϴ�(���û���) */
    font-family: sans-serif;
  }
  /* �⺻ ������ �����մϴ� */
  /* a {
    text-decoration: none; 
    color: #888;
  }
  /* ���콺 Ŀ���� �ö��� �� ������ �����մϴ�*/
  /* a:hover {
    text-decoration: underline; 
  }  */

  header {
    
    margin: auto; /* header�� ���� ����(margin)�� �����ϰ� ���� -> ���򰡿���� */
    width: 100%;
    height: 160px;
    display: flex;
    align-items: center; /* ���� ��ҵ� ���� ������� */
    position: relative;
  }
    /* �⺻ border ���ֱ�(�� �ڵ带 ����� �⺻ border�� Ȯ���غ�����) */
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
  
  .visually-hidden { /* legend �Ⱥ��̰� ����. �̷����ϸ� ���ټ��� �ؼ��ϸ鼭 �������� ��ġ�� �ʽ��ϴ�. */
    position: absolute !important;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px, 1px, 1px, 1px);
    white-space: nowrap;
  }
  /* ��ũ���� ��� ������ ��ġ��ŵ�ϴ�. */
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
    flex: 9; /* search-box���ο��� 9��ŭ�� ũ�⸦ ����(����) */
    height: 46px;
    padding-left: 12px;
    padding-right: 12px;
    border: none;
    outline: none;
    font-size: 18px;
  }
  .search_box button {
    flex: 1; /* search-box���ο��� 1��ŭ�� ũ�⸦ ����(����) */
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

  /* <ul>���� 7��° <li>���� ���� ������ <a> �±� ���� */
  /* .nav_items ul > li:nth-child(-n + 7) > a { 
    color: #58b4cd;
  } */

  .nav_items ul > li > a {
    text-decoration: none;
    cursor: pointer;
  }
  
 
  /* ���� Ŭ���� */
  /* .color_naver {
    color: #03cf5d;
  } */

  section {
    background-color:  rgb(213, 245, 247);	 
    height: 450px;
    float:left;
    width:100%;
    padding: 10px;
  }

   article {
    display: flex;
    /* margin-top: 10px; */
    padding: 5px;
    background-color: rgb(235, 225, 225);
  }

  .container{
    justify-content: center;
    padding: 20px;
    height: 100%;
    width: 100%;
    
    }

    .area{
      
        width: 60%;
        background-color: #e6c3dc;
        display: block;
        padding: 3px;
    }

	table {border-collapse : collapse;} 

  /* Ǫ�� */


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
    line-height: 1em; /* �ٰ��� */
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
    display: inline-block; /* li ���������ϴ� ��� */
    margin-left: 8px;
  }
  
  .bottom_box {
    
    flex: 2;
    font-size: 14px;
    text-align: center;
  }
  .bottom_box ul > li {
    display: inline-block; /* �������� */
    margin-left: 8px;
  }
  .bottom_box ul > li:last-child { /* ������ li��� (���� Corp.) ���� */
    font-weight: bold;
  }
  /* ���� Ŭ���� */
  
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
          <legend class="visually-hidden">�˻�</legend>
          <div class="search_box">
            <input name="_keyword" type="text" maxlength="225" tabindex="1" />
            <button type="submit" tabindex="2">
              �˻�
            </button>
            
          </div>
          
        </fieldset>
        
      </form>
      </div>
      <div class="login">
        <ul class="myinfo">
            <li><a href="/" class="link_text_name"><%= (String)session.getAttribute("__ID") %></a>��</li>
            <li><a href="Main.jsp" class="link_text" >�α׾ƿ�</a></li> 
        </ul>
        <div class="member">
        
        <%
	//�� ȸ���� �޾ƿ���, ����..!
		
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
	      
	      out.println("<p style='text-align: center;'>"+"�� ȸ���� : <b>"+ Countrun + "��</b></p>");
	      
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
          
          <li><a href="">��ü��</a></li>
          <li><a href="">�����Խ���</a></li>
          <li><a href="">�����Խ���</a></li>
          <li><a href="">�����Խ���</a></li>
          <li><a href="">����ı�Խ���</a></li>
          <li><a href="">ä��Խ���</a></li>

        </ul>
       
      </div>
    </nav>
    
    <section>
        <article class="container">
            <article class="area" style="overflow-y:scroll">
               
<%

	String keyword = request.getParameter("_keyword");
	String id = request.getParameter("_id");	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(
				"Select * from post where postit = '" + keyword + "'");
		
		%>
		<table border="1">
		<tr><th>posnum</th><th>postit</th><th>poscon</th><th>views</th><th>posdat</th><th>btype</th><th>posnic</th></tr>
			
		<% 
		
		
		while(rs.next()){
			String posnum = rs.getString("posnum");
			String postit = rs.getString("postit");
			String poscon = rs.getString("poscon");
			int views = rs.getInt("views");
			String posdat = rs.getString("posdat");
			String btype = rs.getString("btype");
			String posnic = rs.getString("posnic");
			
			
			out.println("<tr>");
			out.println("<td width='50' height='50'>" + posnum + "</td>");
			out.println("<td width='150'>" + postit + "</td>");
			out.println("<td width='380'>" + poscon + "</td>");
			out.println("<td width='30'>" + views + "</td>");
			out.println("<td width='100'>" + posdat + "</td>");
			out.println("<td width='50'>" + btype + "</td>");
			out.println("<td width='30'>" + posnic + "</td>");
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
    
    <footer>
   
        <div class="aside_box">
          <div class="area_user">
            <div class="area_user_row">
              <span class="text_bold-13">Creators</span>
              <ul>
                <li><p>ũ��������</p></li>
                <li><p>��������Ͻ�</p></li>
              </ul>
            </div>
            <div class="area_user_row">
              <span class="text_bold-13">Partners</span>
              <ul>
                <li><p>����Ͻ� ����</p></li>
                <li><p>����� ����</p></li>
                <li><p>������ü ���</p></li>
              </ul>
            </div>
            <div class="area_user_row">
              <span class="text_bold-13">Developers</span>
              <ul>
                <li><p>���� �����ڼ���</p></li>
                <li><p>����API</p></li>
                <li><p>���¼ҽ�</p></li>
                <li><p>���� D2</p></li>
                <li><p>���� D2SF</p></li>
                <li><p>���� ����</p></li>
              </ul>
              
            </div>
          </div>
        </div>
        <div class="bottom_box">
            <ul>
              <li><p>ȸ��Ұ�</p></li>
              <li><p>����ä��</p></li>
              <li><p>��������</p></li>
              <li><p>�̿���</p></li>
              <li><p>��������ó����ħ</p></li>
              <li><p>�����ϱ�</p></li>
              <li><p>���� ��å</p></li>
              <li><p>������</p></li>
              <li><p>&copy; ���� Corp.</p></li>
            </ul>
          </div>
      </footer> 
  </body>
  </html>
    