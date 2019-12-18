<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>부트스트랩 101 템플릿</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/css/btn.css"
	rel="stylesheet">
</head>
<style>
.container {
	width: 100vw;
	height: 180px;
	text-align: center;
	padding-right: 0px;
	padding-left: 0px;
	overflow: auto;
}

.top_menu {
	display: inline-block;
	margin-left: 15px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	document.getElementsByClassName("top_menu")[0].onclick = function(){ // 홈

		location.href="/now/main";
	}
	
	document.getElementsByClassName("top_menu")[1].onclick = function(){ // 게시판
		location.href="/now/freeboard/freeBoardList";
	}
	
	document.getElementsByClassName("top_menu")[2].onclick = function(){ // 전자결재
		location.href="/now/approval/approvalList";
	}
	
	document.getElementsByClassName("top_menu")[3].onclick = function(){ // 투표
		location.href="/now/pollboard/pollBoardList";
	}
	
// 	document.getElementsByClassName("top_menu")[4].onclick = function(){ // 통계
// 		location.href="/now/pollboard/pollBoardList";
// 	}
	
// 	document.getElementsByClassName("top_menu")[5].onclick = function(){ // 근태
// 		location.href="/now/pollboard/pollBoardList";
// 	}
	
 	document.getElementsByClassName("top_menu")[6].onclick = function(){ // 채팅
 		location.href="/now/chat/chatView";
 	}
	
	document.getElementsByClassName("top_menu")[7].onclick = function(){ // 마이페이지
		location.href="/now/myPage/myPage";
	}
});

</script>
<body>
	<nav>
		<h5>Menu</h5>
		<a href="#">공지사항</a>
		<a href="#">자유게시판</a>
		<a href="#">투표게시판</a>
		<a href="#">마이페이지</a>
		<a href="#">채팅</a>
	</nav>
</body>
</html>


