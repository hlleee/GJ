<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
</body>
</html>