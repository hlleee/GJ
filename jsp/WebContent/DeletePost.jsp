<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
<%
	String userID =  (String) session.getAttribute("__NAME");		//세션에서 현재 접속중인 사용자의 닉네임을 받아서 출력
	String posnum = request.getParameter("_posnum");		//삭제할 게시글의 게시글번호를 받아옴
	String type = "";		//삭제 후 게시판 이동을 위해 게시판 정보를 받아옴
	int comnum = 0;			//게시글에 달린 댓글 삭제를 위한 댓글 번호 변수 초기화
	
	if(userID==null){		//로그아웃상태면 오류메시지 메인페이지로 이동
		out.println("<script>alert('접근 오류');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	}  
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false","root","1234");
		Statement stmt = conn.createStatement();		//반복문에 Statement 객체는 한번만 쓰일 수 있기때문에 생성
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from post where posnic = '"+userID+"' and posnum = '"+posnum+"'");
		ResultSet rsR = null;		//반복문에 쓰일 ResultSet 객체 초기화
		if(rs.next() || userID.equals("Admin")){	//로그인중인 사용자가 작성자이거나 관리자라면 삭제 수행
			
			if(rs.first()) type = rs.getString("btype");	//게시글의 게시판 정보 받아옴
			
			//게시글에 달린 댓글이 있다면 반복
			rs = stmt.executeQuery("select comnum from comment where fgnnum = '"+posnum+"' and comrepdiv = 1");
			while(rs.next()){
				comnum = rs.getInt("comnum");		//답글 삭제를 위해 댓글 번호를 받아옴
				rsR = stmt2.executeQuery("select comnum from comment where fgnnum = '"+comnum+"' and comrepdiv = 0");
				while(rsR.next())  stmt3.executeUpdate("delete from comment where fgnnum ='"+comnum+"'and comrepdiv = 0");		//댓글에 달린 답글이 모두 지워질때까지 delete문 수행
				stmt2.executeUpdate("delete from comment where fgnnum = '"+posnum+"' and comrepdiv = 1");		//답글이 모두 지워졌다면 댓글 삭제
			}
			
			stmt2.executeUpdate("delete from likes where posnum = '"+posnum+"'");	//게시글에 달린 좋아요 삭제
			
			stmt2.executeUpdate("delete from post where posnum='"+posnum+"'");		//게시글 삭제
			
			out.println("<script>alert('게시글 삭제가 완료되었습니다.');</script>");	
				//운영자가 삭제했다면 운영자 게시글 조회 페이지로 이동
				if(userID.equals("Admin")) out.println("<script>location.href='Adm_Board.jsp';</script>");
				else {		//사용자가 삭제했다면 삭제한 게시글에 해당하는 게시판으로 이동
					switch(type){
					case "자유게시판" : out.println("<script>location.href='BulletinBoard3.jsp';</script>"); break;
					case "취업후기게시판" : out.println("<script>location.href='BulletinBoard2.jsp';</script>"); break;
					case "면접게시판" : out.println("<script>location.href='BulletinBoard4.jsp';</script>"); break;
					case "질문게시판" : out.println("<script>location.href='BulletinBoard5.jsp';</script>"); break;
					case "채용게시판" : out.println("<script>location.href='BulletinBoard6.jsp';</script>"); break;
					default : out.println ("<script>alert('게시판 불러오기 오류'); location.href='BulletinBoard.jsp';</script>"); break;
					}
				}
		} else{		//삭제를 시도한 사용자가 글 작성자가 아닐경우 오류메시지
			out.println("<script>alert('권한이 없습니다.');</script>");	
			out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
		}
		stmt.close();
		if(stmt2 != null)stmt2.close();		//쓰이지 않았다면 NullPointerException 발생 할 수 있으므로 null이 아닐때만 close
		if(stmt3 != null)stmt3.close();
		conn.close();
		rs.close();
		if(rsR != null)rsR.close();
	} catch(Exception e){
		e.printStackTrace();
	}
	
%>
	
</body>
</html>