<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="JoinStyle.css">
<title>Insert title here</title>
</head>
<body>

<header>
		<div class="box">
		</div> <!-- box -->
</header>
<%

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("_id");				//아이디
	String pw = request.getParameter("_pw");				//비밀번호
	String pwcon = request.getParameter("_pwcon");			//비밀번호 확인
	String nickname = request.getParameter("_nickname");	//닉네임
	String email = request.getParameter("_email");			//이메일
	String emailOp = request.getParameter("_emailOp");		//이메일 옵션
	String ename = request.getParameter("_ename");			//기업명
	String etype = request.getParameter("_etype");			//기업구분
	String joboffdiv = request.getParameter("_joboffdiv");	//회원 등급
	int state = 0;
	String spage = "";
	

	String emailVal = email + "@" + emailOp;		//이메일 입력값+셀렉트값
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/pro", "root", "1234");
		Statement stmt = conn.createStatement();
		
		ResultSet rs;
	
		
		//1. 입력한 아이디가 db에 있을 때
		rs = stmt.executeQuery("Select * from member where id = '"+id+"'");
		if(rs.next())	{
			do {
				String idvalue = rs.getString("id");

			} while(rs.next());
				out.println("<script language='javascript'>");
				out.println("alert('아이디가 중복됩니다. 중복확인을 진행해주세요.')");
				out.println("</script>");
				state = 1;
		} else {
			state = 0;
		}
				
		
		//2. 입력한 닉네임이 db에 있을 때
		rs = stmt.executeQuery("Select * from member where nickname = '"+nickname+"'");
		if(rs.next())	{
			do {
				String idvalue = rs.getString("nickname");

			} while(rs.next());
				out.println("<script language='javascript'>");
				out.println("alert('닉네임이 중복됩니다. 중복확인을 진행해주세요.')");
				out.println("</script>");
				state = 1;
		} else {
			state = 0;
		}
		
		
		
		
		//모두 다 해당 안 될 때 - db에 값 입력하기
		if( state != 1) { 
			stmt.executeUpdate("insert into member (id, pw, nickname, ename, email, etype, joboffdiv) values ('"+id+"', '"+pw+"', '"+nickname+"', '"+ename+"', '"+emailVal+"', '"+etype+"', '"+joboffdiv+"')");
		} 
		stmt.close();
		conn.close();
		
	} catch (SQLException e){
		e.printStackTrace();
	}
	
	%>
<form>
<nav class = "nav2">
<div class = "dd">
<h2 align="left">회원가입</h2>
	<table align="center" width="500px" cellspacing = "105" cellpadding = "15" class="table2">
	<%
		//모두 다 해당 안 될 때 - 회원가입 완료 띄우기
		if(state != 1) {
			out.println("<tr>");
			out.println("<td width='480px'>" + nickname + "님 회원가입이 완료되었습니다.</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<td><a href='Main.jsp' class='btnbottom1 btn-gradient blue mini'>메인으로</a></td>");
			out.println("</tr>");
		} else {	//하나라도 해당되면 다시 회원가입 페이지 불러옴
			out.println("<script>location.href='Join.jsp?page=" + spage + "'</script>");
		}
	%>
	</table>
	
</div>
</nav>
</form>

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