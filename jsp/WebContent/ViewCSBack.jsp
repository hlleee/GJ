<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 문의 조회 처리</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String inqnum = request.getParameter("_inqnum");		//처리할 문의글의 문의 번호를 받아옴
	int process = Integer.parseInt(request.getParameter("_process"));	//처리할 문의글의 처리상태르 받아옴
	String userID = (String) session.getAttribute("__ID"); 		//세션에서 현재 로그인중인 사용자의 ID를 받아옴
	
	if(!userID.equals("Admin")){		//로그인중인 사용자가 관리자가 아닐 경우 오류메시지, 메인페이지로 이동
		out.println("<script>alert('관리자만 접근할 수 있습니다.');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	} else{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj", "root", "1234");
			Statement stmt = conn.createStatement();
			if(process == 0){		//처리가 안된상태라면 처리여부 1로 업데이트, 처리완료
			stmt.executeUpdate("update inquiry set process = 1 where inqnum = '"+inqnum+"'");
			out.println("<script>alert('문의 처리가 완료되었습니다.');</script>");	
			out.println("<script>location.href='AllInquiry.jsp';</script>");
			} else{				//이미 처리가 된 상태라면 오류메시지, 문의내역으로 돌아감
				out.println("<script>alert('이미 처리된 문의입니다.');</script>");	
				out.println("<script>location.href='AllInquiry.jsp';</script>");
			}
			stmt.close();
			conn.close();
		 }catch(Exception e){
	 e.printStackTrace();
 		}
	}
%>
</body>
</html>