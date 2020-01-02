<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<%-- <script src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script> --%>
<!--  스케줄러 -->
<link href="${pageContext.request.contextPath}/css/schedule.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/daygrid.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/timegrid.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/schedule.js"></script>
<script src="${pageContext.request.contextPath}/js/daygrid.js"></script>
<script src="${pageContext.request.contextPath}/js/timegrid.js"></script>
<script src="${pageContext.request.contextPath}/js/interaction.js"></script>
<script src="${pageContext.request.contextPath}/js/ko.js"></script>

<style>
.idx_board {
	display: inline-block;
	width: 48%;
	background: #fff;
	margin-top: 2%;
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
	/* background: url(../images/dot.gif) no-repeat 0 7px/2px; */
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
		<div class="top_menu" style="margin-left:30px;"> 
			<a class="top_button btn_board"> <span class="top_button-text">게시판</span>
				<span class="top_button-icon">
					<i class="fa fa-list" aria-hidden="true"></i>
				</span>
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

		<div class="idx_board" style="margin-left: 2%;">
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
    
		<div class="idx_board" style="width: 200px;margin-left: 2%;">
			<div class="title">
				<a href="#" class="name">미세먼지 </a> <a href="#" class="more"><img
					src="${pageContext.request.contextPath }/images/dot.gif" alt="더 보기"></a>
			</div>
			<div class="list" style="padding: 0px;">
				<ul style="margin: 0px; padding: 0px;">
					<li style="margin: 10px;"><span style="width: 100px; text-align: left; font-size: 15px;">측정값 : ${dust}</span></li>
					<li style="margin: 10px;"><span style="width: 150px; font-size: 15px; text-align: left;">측정일 : ${dustDay}</span></li>
					<li><img style="margin-left: 45px; width: 100px; height:100px " alt="" src="${pageContext.request.contextPath }/images/dust1.png"> </li>
				</ul>
			</div>
		</div>
		
		<div class="idx_board" style="margin-left: 2%; vertical-align: top; width: 350px;">
			<div class="title">
				<a href="#" class="name">캘린더</a> <a href="#" class="more"><img
					src="${pageContext.request.contextPath }/images/dot.gif" alt="더 보기"></a>
			</div>
			<div class="list" id="calendar">
				
			</div>
		</div>
		
	</div>

	<script>
		$(document).ready(function() {
			// 메뉴 클릭 
			// 			document.getElementsByClassName("top_menu")[0].onclick = function() { // 홈
			// 				location.href = "/now/main";
			// 			}
		
			document.getElementsByClassName("top_menu")[0].onclick = function() { // 게시판
				location.href = "/now/freeboard/freeBoardList";
			}
		
			document.getElementsByClassName("top_menu")[1].onclick = function() { // 전자결재
				location.href = "/now/approval/approvalList";
			}
		
			document.getElementsByClassName("top_menu")[2].onclick = function() { // 투표
				location.href = "/now/pollboard/pollBoardList";
			}
		
			document.getElementsByClassName("top_menu")[3].onclick = function() { // 채팅
				location.href = "/now/chat/chatList";
			}
		
			// 			document.getElementsByClassName("top_menu")[7].onclick = function() { // 마이페이지
			// 				location.href = "/now/myPage/myPage";
			// 			}
			

			// 미니 달력
			
			var kCalendar = document.getElementById("calendar");
			var date = new Date();
			
			var currentYear = date.getFullYear(); // 년도
			var currentMonth = date.getMonth() + 1;	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
			var currentDate = date.getDate(); // 오늘 일자
			
			date.setDate(1);
			var currentDay = date.getDay();	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
			
			var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
			var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
			// 각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 
			// 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
			if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 ){
				lastDate[1] = 29;
			}
			
			//총 몇 주인지 구함.
			var currentLastDate = lastDate[currentMonth-1];
			var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
			
			if(currentMonth != 1){
				var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
			}else{
				var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
			}

			//만약 이번달이 1월이라면 1년 전 12월로 출력.
			if(currentMonth != 12){
				var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
			}else{
				var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
			}
			//만약 이번달이 12월이라면 1년 후 1월로 출력.
			
			if( currentMonth < 10 ){
				var currentMonth = '0' + currentMonth;
			}
			
			var calendar = '';
			/* calendar += '<div id="header">'; */
			/* calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"></a></span>'; */
			/* calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>'; */
			/* calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')"></a></span>'; */
			/* calendar += '		</div>'; */
			calendar += '		<table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">';
			calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
			calendar += '			<thead>';
			calendar += '				<tr>';
			calendar += '					<th class="sun" scope="row">일</th>';
			calendar += '					<th class="mon" scope="row">월</th>';
			calendar += '					<th class="tue" scope="row">화</th>';
			calendar += '					<th class="wed" scope="row">수</th>';
			calendar += '					<th class="thu" scope="row">목</th>';
			calendar += '					<th class="fri" scope="row">금</th>';
			calendar += '					<th class="fri" scope="row">토</th>';
			calendar += '				</tr>';
			calendar += '			</thead>';
			calendar += '			<tbody>';
			
			var dateNum = 1 - currentDay;

			for(var i = 0; i < week; i++) {
				calendar += '			<tr>';
				for(var j = 0; j < 7; j++, dateNum++) {
					if( dateNum < 1 || dateNum > currentLastDate ) {
						calendar += '				<td class="' + dateString[j] + '"> </td>';
						continue;
					}
					calendar += '				<td class="' + dateString[j] + '">' + dateNum + '</td>';
				}
				calendar += '			</tr>';
			}

			calendar += '			</tbody>';
			calendar += '		</table>';
			
			kCalendar.innerHTML = calendar;
		});
		
	</script>
</body>
</html>
