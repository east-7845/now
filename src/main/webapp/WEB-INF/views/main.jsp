<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<%-- <script src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script> --%>
<style>
.idx_board {
	display: inline-block;
	width: 48%;
	background: #fff;
}

.idx_board .title {
	position: relative;
	padding: 20px;
	border-bottom: 1px solid #aaa;
}

.idx_board .title a {
	display: inline-block;
	vertical-align: middle;
}

.idx_board .title .name {
	font-size: 24px;
	font-weight: 600;
	letter-spacing: -2px;
}

.idx_board .title .more {
	position: absolute;
	top: 24px;
	right: 20px;
}

.idx_board .title .more img {
	width: 24px;
	margin-left: 3px;
}

.idx_board .list {
	padding: 20px;
}

.idx_board .list ul li {
	margin-top: 10px;
	padding-left: 7px;
	background: url(../images/dot.gif) no-repeat 0 7px/2px;
	font-size: 0;
}

.idx_board .list ul li:first-child {
	margin-top: 0;
}

.idx_board .list a, .idx_board .list span {
	display: inline-block;
	vertical-align: middle;
}

.idx_board .list a {
	width: 80%;
	font-size: 14px;
}

.idx_board .list span {
	width: 20%;
	text-align: right;
	font-size: 12px;
	color: #777;
}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
	<div class="container_content">
		<div class="top_menu" style="margin-left: 30px;">
			<a class="top_button btn_board"> <span class="top_button-text">게시판</span>
				<span class="top_button-icon"><i class="fa fa-list"
					aria-hidden="true"></i> </span>

			</a>
		</div>
		<div class="top_menu" style="margin-left: 30px;">
			<a class="top_button btn_approval"> <span class="top_button-text"
				style="font-size: 30px;">전자결재</span> <span class="top_button-icon">
					<i class="fa fa-pencil" aria-hidden="true"></i>
			</span>

			</a>
		</div>
		<!-- <div class="top_menu">
			<a class="top_button btn_poll"> <span class="top_button-icon"><i
					class="fa fa-check" aria-hidden="true"></i></span> <span
				class="top_button-text">투표</span>
			</a>
		</div> -->
		<!-- <div class="top_menu">
			<a class="top_button btn_통계"> <span class="top_button-icon"><i
					class="fa fa-bar-chart" aria-hidden="true"></i></span> <span
				class="top_button-text">통계</span>
			</a>
		</div> -->
		<div class="top_menu" style="margin-left: 30px;">
			<a class="top_button btn_근태"> <span class="top_button-text">근태</span>
				<span class="top_button-icon"> <i class="fa fa-male"
					aria-hidden="true"></i>
			</span>
			</a>
		</div>
		<div class="top_menu" style="margin-left: 30px;">
			<a class="top_button btn_채팅"> <span class="top_button-text">채팅</span>
				<span class="top_button-icon"> <i class="fa fa-comments-o"
					aria-hidden="true"></i>
			</span>
			</a>
		</div>
		<!-- 관리자 전용페이지 설정 -->
		<!-- 		<div class="top_menu">
			<a class="top_button btn_my"> <span class="top_button-icon"><i
					class="fa fa-user" aria-hidden="true"></i></span> <span
				class="top_button-text">MY</span>
			</a>
		</div> -->

		<div class="idx_board" style="margin-left: 30px;">
			<div class="title">
				<a href="#" class="name">공지사항</a> <a href="#" class="more"><img
					src="${pageContext.request.contextPath }/images/dot.gif" alt="더 보기"></a>
			</div>
			<div class="list">
				<ul>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
				</ul>
			</div>
		</div>

		<div class="idx_board" style="margin-left: 1%;">
			<div class="title">
				<a href="#" class="name">투표게시판</a> <a href="#" class="more"><img
					src="${pageContext.request.contextPath }/images/dot.gif" alt="더 보기"></a>
			</div>
			<div class="list">
				<ul>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
				</ul>
			</div>
		</div>

		<div class="idx_board" style="margin-left: 3%;">
			<div class="title">
				<a href="#" class="name">자유게시판</a> <a href="#" class="more"><img
					src="${pageContext.request.contextPath }/images/dot.gif" alt="더 보기"></a>
			</div>
			<div class="list">
				<ul>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
					<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
				</ul>
			</div>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
// 							document.getElementsByClassName("top_menu")[0].onclick = function() { // 홈

// 								location.href = "/now/main";
// 							}

							document.getElementsByClassName("top_menu")[0].onclick = function() { // 게시판
								location.href = "/now/freeboard/freeBoardList";
							}

							document.getElementsByClassName("top_menu")[1].onclick = function() { // 전자결재
								location.href = "/now/approval/approvalList";
							}

							document.getElementsByClassName("top_menu")[2].onclick = function() { // 투표
								location.href = "/now/pollboard/pollBoardList";
							}

							//	 	document.getElementsByClassName("top_menu")[4].onclick = function(){ // 통계
							//	 		location.href="/now/pollboard/pollBoardList";
							//	 	}

							//	 	document.getElementsByClassName("top_menu")[5].onclick = function(){ // 근태
							//	 		location.href="/now/pollboard/pollBoardList";
							//	 	}

							document.getElementsByClassName("top_menu")[3].onclick = function() { // 채팅
								location.href = "/now/chat/chatList";
							}

// 							document.getElementsByClassName("top_menu")[7].onclick = function() { // 마이페이지
// 								location.href = "/now/myPage/myPage";
// 							}
						});
	</script>
</body>
</html>
