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
<link
	href="${pageContext.request.contextPath }/bootstrap-3.3.2/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/css/btn.css"
	rel="stylesheet">
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scrip>
    <![endif]-->
<script src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap-3.3.2/js/bootstrap.js"></script>
</head>
<style>
.container {
	width: 100vw;
	height: 120px;
	text-align: center;
	padding-right: 0px;
	padding-left: 0px;
}

.top_menu {
	display: inline-block;
	margin-left: 15px;
}
</style>

<body>
	<div class="container">
		<div style="border: 1px solid black; height: 70px;">
			<a href="#"> <img alt="" style="width: 100px; height: 65px;"
				src="${pageContext.request.contextPath }/images/logo.png">
			</a> <span> 한수민 - 신입(인턴1년 6개월) </span>
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
		<div class="top_menu">
			<a class="top_button btn_my"> <span class="top_button-icon"><i
					class="fa fa-user" aria-hidden="true"></i></span> <span
				class="top_button-text">MY</span>
			</a>
		</div>
	</div>
</body>
</html>




