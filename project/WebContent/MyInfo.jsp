<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	 <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>���̾ƿ�</title>
    <link rel="stylesheet" href="main.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/77e29b57dd.js"
      crossorigin="anonymous"
    ></script>
	<title>HTML Layouts</title>
	<style>
		 #header {
    
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
    background-color: #acbfe1;
    padding: 10px;
  }

  .login_idpw {
    display: block;
    margin: auto;
    width: 200px;
    height: 70px;
    background-color: #93abf4;
    padding: 5px;
  }

  .login_idpw input {
    display: block;
    width: 150px;
    height: 30px;
    padding: 10px;
  }

  .login_button {
   
    margin: auto;
    width: 200px;
    height: 30px;
    background-color: #93abf4;
    padding: 5px;
  }

  .login_button input {
   /* padding-left: 5px;  */
  }

  .member {
    margin: auto;
    width: 250px;
    height: 46px;
    /* background-color: #8361d4; */
    padding-left: 80px;
    padding-top: 0px;
  }
		
		#nav {
			/* �� ���� */
			width: 70%;
			float: center;
			height: 400px;
			position: relative;
			left:400px;
			overflow-x:hidden;
			overflow-y:hidden"
			
		}
		
		#section {
			/* �޴� */
			width: 200px;
			float: center;
			height: 400px;
			position: absolute;
			top: 250px;
			left:100px;
			
		}
		#footer {
  color: black;   
  height: 110px;
  font-size: 12px;
  background-color: rgb(176, 176, 229);
  position: relative;
  clear: both;
  width:100%;
}

.aside_box {
  flex: 1;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #91acd6;
}
.area_user {
  flex: 4;
  line-height: 2em; /* �ٰ��� */
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
.aur_title {
  font-size: 13px;
  font-weight: bold;
}
.area_user_row ul > li {
  display: inline-block; /* li ���������ϴ� ��� */
  margin-left: 8px;
}
.area_col {
  flex: 1;
  display: flex;
}
.area_col .ac_content {
  line-height: 20px;
}
.area_col .ac_img {
  width: 60px;
  height: 60px;
}
.bottom_box {
  flex: 2;
  padding-top: 20px;
  font-size: 14px;
  text-align: center;
}
.bottom_box ul > li {
  display: inline-block; /* �������� */
  margin-left: 8px;
}
.bottom_box ul > li:last-child { /* ������ li��� (Naver Corp.) ���� */
  font-weight: bold;
}
/* ���� Ŭ���� */

.text_bold-13 {
  font-weight: bold;
  font-size: 13px;
}
		@media (max-width: 600px) {
			#nav, #section {
				width: 100%;
				height: 100%;
			}
		}
		*.box     { border:1px solid black; background-color:gold; } 
		a{text-decoration:none}
		ul{list-style:none;}
		
	</style>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div id="header">
	
      <div class="logo">
      <img src="images/Logo.png" class="img_logo" style="display: block; margin: 0 auto; width:150px; height:150px;"/>
      </div>
      <div class="search">
      <form>
        <fieldset>
          <legend class="visually-hidden">�˻�</legend>
          <div class="search_box">
            <input type="text" maxlength="225" tabindex="1" />
            <button type="submit" tabindex="2">
              �˻�
            </button>
            
          </div>
          
        </fieldset>
        
      </form>
      </div>
      <div class="login">
        <div class="login_idpw">
            <input type="text" placeholder="���̵�" >
            <input type="password" placeholder="��й�ȣ">
        </div>
        <div class="login_button">
            <input type="button" value="�α���">
            <input type="button" value="ȸ������">
        </div>
        <div class="member"><p>ȸ���� 4��</p>
        </div>
      </div>
      
   
	
	</div>
	<div id="nav">
	
		<block>
		<h1>�� ����</h1>
		<hr width="50%" align="left">
		</block>
	<block>
	  
	<%
 	try{
 		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn = DriverManager.getConnection(
 				"jdbc:mysql://localhost/project","root","1234");
 		Statement stmt = conn.createStatement();
 		ResultSet rs = stmt.executeQuery("select * from member");
 		//�����߰��ؼ� �ش������� ���(���ǿ��� �޾ƿ� ID)
 		
 		if(rs.next()){
 			String id=rs.getString("id");
 			String nickname=rs.getString("nickname");
 			String email=rs.getString("email");
 			String etype = rs.getString("etype");
 			String ename = rs.getString("ename");
 			String joboffdiv = rs.getString("joboffdiv");
 			%>
 			<h4>���̵�: <%=id%></h4><p>
 			<h4>�г���: <%=nickname%></h4><p>
 			<h4>�̸���: <%=email%></h4><p>
 			<h4>�������: <%=etype%></h4><p>
 			<h4>�����:	<%=ename%></h4><p>
 			<h4>�ź�: <%=joboffdiv%></h4><p>
 			<% 
 		} 
 		} catch(SQLException e){
 		e.printStackTrace();
 	}
	// " + "'"+ session.getAttribute("id") + "'" �����߰�
%>
	<td norwap align=center>
   <div id="row1" style="float:left;">
    <form method="post" action="Member_Update_List.jsp" style="width: 80px;">
     <fieldset>
      <input type="submit" value="�����ϱ�">
    </form>
   </div>
   <div id="row2" style="float:left;">
    <form method="post" action="Member_Delete_List.jsp" style="width: 100px;">
     <fieldset>
     <input type="submit"  value="Ż���ϱ�">
    </form>  
   </div>
  </td>
	</block>
		
	</div>
	
	<div id="section">
	<block>
	<div class="info">
	<div align="left" style="border: 3px solid black; width: 170px;height: 170px;">
      <ul>
        <li class="item">
          <a href = "MyInfo.jsp?"> �� ����<p>
        </li>
        <li class="item">
           <a href="MyPost.jsp">���� �� ��</a><p>
        </li>
        <li class="item">
           <a href="LikePost.jsp">���ƿ� ���� ��</a><p>
        </li>
        <li class="item">
          <a href="Inquiry.jsp">���� ����</a><p>
        </li>
    </ul> 
    </div>
   </div>
   </block>
	</div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="js/bootstrap.min.js"></script>
</body>

</html>