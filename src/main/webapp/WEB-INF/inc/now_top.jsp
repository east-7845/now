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
		location.href="/now/freeBoard/freeBoardList";
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
	
// 	document.getElementsByClassName("top_menu")[6].onclick = function(){ // 채팅
// 		location.href="/now/pollboard/pollBoardList";
// 	}
	
	document.getElementsByClassName("top_menu")[7].onclick = function(){ // 마이페이지
		location.href="/now/myPage/myPage";
	}
});

</script>
<body>
	<div class="container">
		<div style="border: 1px solid black; height: 70px;">
			<a href="#"> <img alt="" style="width: 100px; height: 65px;"
				src="${pageContext.request.contextPath }/images/logo.png">
			</a> <span> ${sessionEmp.emp_name } - 신입(인턴1년 6개월) </span><a href="/now/logout">logout</a>
		</div>
		<div class="top_menu">
			<a class="top_button btn_home"> <span class="top_button-icon"><i
					class="fa fa-home" aria-hidden="true"></i></span> <span
				class="top_button-text">홈</span>
			</a>
		</div>
		<div class="top_menu">
			<a class="top_button btn_board"> <span class="top_button-icon"><i
					class="fa fa-list" aria-hidden="true"></i></span> <span
				class="top_button-text">게시판</span>
			</a>
		</div>
		<div class="top_menu">
			<a class="top_button btn_approval"> <span class="top_button-icon"><i
					class="fa fa-pencil" aria-hidden="true"></i></span> <span
				class="top_button-text">전자결재</span>
			</a>
		</div>
		<div class="top_menu">
			<a class="top_button btn_poll"> <span class="top_button-icon"><i
					class="fa fa-check" aria-hidden="true"></i></span> <span
				class="top_button-text">투표</span>
			</a>
		</div>
		<div class="top_menu">
			<a class="top_button btn_통계"> <span class="top_button-icon"><i
					class="fa fa-bar-chart" aria-hidden="true"></i></span> <span
				class="top_button-text">통계</span>
			</a>
		</div>
		<div class="top_menu">
			<a class="top_button btn_근태"> <span class="top_button-icon"><i
					class="fa fa-male" aria-hidden="true"></i></span> <span
				class="top_button-text">근태</span>
			</a>
		</div>
		<div class="top_menu">
			<a class="top_button btn_채팅"> <span class="top_button-icon"><i
					class="fa fa-comments-o" aria-hidden="true"></i></span> <span
				class="top_button-text">채팅</span>
			</a>
		</div>
		<!-- 관리자 전용페이지 설정 -->
		<div class="top_menu">
			<a class="top_button btn_my"> <span class="top_button-icon"><i
					class="fa fa-user" aria-hidden="true"></i></span> <span
				class="top_button-text">MY</span>
			</a>
		</div>
	</div>
</body>
</html>


