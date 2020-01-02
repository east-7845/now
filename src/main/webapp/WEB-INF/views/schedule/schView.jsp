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
<style>
.dropNewEvent {
	font-size: 13px;
}

.popoverTitleCalendar {
	width: 100%;
	height: 100%;
	padding: 15px 15px;
	font-size: 13px;
	border-radius: 5px 5px 0 0;
}

.popoverInfoCalendar i {
	font-size: 14px;
	margin-right: 10px;
	line-height: inherit;
	color: #d3d4da;
}

.popoverInfoCalendar p {
	margin-bottom: 1px;
}

.popoverDescCalendar {
	margin-top: 12px;
	padding-top: 12px;
	border-top: 1px solid #E3E3E3;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.popover-title {
	background: transparent;
	font-weight: 600;
	padding: 0 !important;
	border: none;
}

.popover-content {
	padding: 15px 15px;
	font-size: 13px;
}

.inputModal {
	width: 65%;
	margin-bottom: 10px;
}

#contextMenu {
	position: absolute;
	display: none;
	z-index: 2;
}

#contextMenu .dropdown-menu {
	border: none;
}

.opacityWeekend {
	background-color: #f4f4fb !important;
}

.fc-avatar-image {
	top: 4px;
	left: 20px;
	height: 28px;
	width: 28px;
	border-radius: 50%;
	position: absolute;
	z-index: 2;
}

.fc-avatar-image img {
	height: 28px;
	width: 28px;
	border-radius: 50%;
}

.fc-avatar-image:before {
	content: none !important;
}

.fc-day-header {
	text-transform: uppercase;
	font-size: 13px;
	font-weight: 500;
	color: #505363;
	background-color: #FAFAFA;
	padding: 11px 0px !important;
	text-decoration: none;
}

.fc-day-header a {
	text-decoration: none !important;
	color: #505363;
}

.fc-center h2 {
	text-transform: uppercase;
	font-size: 18px;
	font-weight: 600;
	color: #505363;
	line-height: 32px;
}

.fc-toolbar.fc-header-toolbar {
	margin-bottom: 22px;
	padding-top: 22px;
}

.fc-agenda-view .fc-day-grid .fc-row .fc-content-skeleton {
	padding-bottom: 1em;
	padding-top: 1em;
}

.fc-day {
	-webkit-transition: all 0.2s linear;
	-o-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

.fc-day:hover {
	background: #EEF7FF;
	cursor: pointer;
	-webkit-transition: all 0.2s linear;
	-o-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

.fc-highlight {
	background: #EEF7FF;
	opacity: 0.7;
}

.fc-time-grid-event.fc-short .fc-time:before {
	content: attr(data-start);
	display: none;
}

.fc-time-grid-event.fc-short .fc-time span {
	display: inline-block;
}

.fc-time-grid-event.fc-short .fc-avatar-image {
	display: none;
	-webkit-transition: all 0.3s linear;
	-o-transition: all 0.3s linear;
	transition: all 0.3s linear;
}

.fc-time-grid .fc-bgevent, .fc-time-grid .fc-event {
	border: 1px solid #fff !important;
}

.fc-time-grid-event.fc-short .fc-content {
	padding: 4px 20px 10px 22px !important;
}

.fc-time-grid-event .fc-avatar-image {
	top: 9px;
}

.fc-event-vert {
	min-height: 22px;
}

.fc .fc-axis {
	vertical-align: middle;
	padding: 0 4px;
	white-space: nowrap;
	font-size: 10px;
	color: #505362;
	text-transform: uppercase;
	text-align: center !important;
	background-color: #fafafa;
}

.fc-unthemed .fc-event .fc-content, .fc-unthemed .fc-event-dot .fc-content
	{
	padding: 5px 10px 5px 10px;
	font-family: 'Roboto', sans-serif;
	margin-left: -1px;
	height: 100%;
}

.fc-event {
	border: none !important;
}

.fc-day-grid-event .fc-time {
	font-weight: 700;
	text-transform: uppercase;
}

.fc-unthemed .fc-day-grid td:not (.fc-axis ).fc-event-container {
	/* padding: 0.2rem 0.5rem; */
	
}

.fc-unthemed .fc-content, .fc-unthemed .fc-divider, .fc-unthemed .fc-list-heading td,
	.fc-unthemed .fc-list-view, .fc-unthemed .fc-popover, .fc-unthemed .fc-row,
	.fc-unthemed tbody, .fc-unthemed td, .fc-unthemed th, .fc-unthemed thead
	{
	border-color: #DADFEA;
}

.fc-ltr .fc-h-event .fc-end-resizer, .fc-ltr .fc-h-event .fc-end-resizer:before,
	.fc-ltr .fc-h-event .fc-end-resizer:after, .fc-rtl .fc-h-event .fc-start-resizer,
	.fc-rtl .fc-h-event .fc-start-resizer:before, .fc-rtl .fc-h-event .fc-start-resizer:after
	{
	left: auto;
	cursor: e-resize;
	background: none;
}

select.filter {
	width: 500px !important;
}

.popover {
	background: #fff !important;
	color: #2E2F34;
	border: none;
	margin-bottom: 10px;
}

/*popover header*/
.popover-title {
	background: #F7F7FC;
	font-weight: 600;
	padding: 15px 15px 11px;
	border: none;
}

/*popover arrows*/
.popover.top .arrow:after {
	border-top-color: #fff;
}

.popover.right .arrow:after {
	border-right-color: #fff;
}

.popover.bottom .arrow:after {
	border-bottom-color: #fff;
}

.popover.left .arrow:after {
	border-left-color: #fff;
}

.popover.bottom .arrow:after {
	border-bottom-color: #fff;
}

.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 24px;
	/* Preferred icon size */
	display: inline-block;
	line-height: 1;
	text-transform: none;
	letter-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	direction: ltr;
	/* Support for all WebKit browsers. */
	-webkit-font-smoothing: antialiased;
	/* Support for Safari and Chrome. */
	text-rendering: optimizeLegibility;
	/* Support for Firefox. */
	-moz-osx-font-smoothing: grayscale;
	/* Support for IE. */
	-webkit-font-feature-settings: 'liga';
	font-feature-settings: 'liga';
}

#add-color, #edit-color {
	color: #d25565;
}
</style>
<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath }/bootstrap-3.3.2/css/bootstrap.css"
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
 
<!--  스케줄러 -->
<link href="${pageContext.request.contextPath}/css/schedule.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/daygrid.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/timegrid.css"
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/schedule.js"></script>
<script src="${pageContext.request.contextPath}/js/daygrid.js"></script>
<script src="${pageContext.request.contextPath}/js/timegrid.js"></script>
<script src="${pageContext.request.contextPath}/js/interaction.js"></script>
<script src="${pageContext.request.contextPath}/js/ko.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content" style="width: 80vw; margin-left: 10vw;">
		<!-- 일자 클릭시 메뉴오픈 -->
		<div id="contextMenu" class="dropdown clearfix">
			<ul class="dropdown-menu dropNewEvent" role="menu"
				aria-labelledby="dropdownMenu"
				style="display: block; position: static; margin-bottom: 5px;">
				<li><a tabindex="-1" href="#">출근</a></li>
				<li><a tabindex="-1" href="#">퇴근</a></li>
				<li><a tabindex="-1" href="#">휴가</a></li>
				<li class="divider"></li>
				<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			</ul>
		</div>
		<div id="wrapper">
		 	<div id="loading"></div>
			<div id="calendar"></div>
		</div>

	</div>
	<!-- 	<div class="container_footer"> -->
	<%-- 		<%@include file="/WEB-INF/inc/now_footer.jsp"%> --%>
	<!-- 	</div> -->

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var num = 0;
			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
				selectable : true,
				defaultView : 'dayGridMonth',
				defaultDate : new Date(),
				header : {
					left : 'prev,next today',
					center : 'title',
					right : ''
				},
				dateClick : function(info) {
					//alert( "data -- " + info.resource.activeStart);
					/*alert('clicked ' +  info.resource.id);
					alert('clicked1 ' + info.activeStart);
					if(info.resource == null){
					  calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':'2019-12-20'});  
					}else{
					   alert( "data -- " + info.resource.title);
					} */
					//calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':'2019-12-20'});
// 					var division = "";
// 					if(num == 0) {
// 						calendar.addEvent({
// 							'title' : '출근',
// 							'start' : info.dateStr,
// 							'end' : info.endStr
// 						});
// 					}
// 					num = 1;
					//var v_jsonData = JSON.parse(info.view.props.eventStore.defs);
					//console.log(v_jsonData);

					console.log(info.view);
					// console.log(info.view.props.eventStore.defs."2".title);
					/* $.ajax({
						data:{
								"startStr" : info.startStr,
								"endStr"   : info.endStr
						},
						success : function(result){
							calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':info.endStr});
						}
					}); */
				},
				select : function(info) {

					$(".fc-body").unbind('click');
					$(".fc-body").on('click', 'td', function(e) {
						$("#contextMenu").addClass("contextOpened").css({
							display : "block",
							left : e.pageX,
							top : e.pageY
						});
						return false;
					});

					//날짜 클릭시 카테고리 선택메뉴
					var $contextMenu = $("#contextMenu");
					$contextMenu.on("click", "a", function(e) {
						e.preventDefault();
						var checkValue = e.target.innerText;	// 출근,퇴근,휴가 체크값
						//닫기 버튼이 아닐때
						if ($(this).data().role !== 'close') {
							//alert($(this).data());
							 $.ajax({
								 	url : "<c:url value='/schedule/schInput' />",
									data:{
											"checkValue" : checkValue,
											"startStr"   : info.startStr,
											"endStr"	 : info.startStr
									},
									success : function(result){
										calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':info.endStr});
										
										
									}
								});
						}

						$contextMenu.removeClass("contextOpened");
						$contextMenu.hide();
					});
				    $('body').on('click', function () {
				        $contextMenu.removeClass("contextOpened");
				        $contextMenu.hide();
				    });
				},
				eventClick : function(event) {
					var eventObj = event.event;
					if (eventObj.url) {
						alert(eventObj.title + "\n" + eventObj.url, "wicked",
								"width=700,height=600");
						window.open(eventObj.url);
						return false;
					} else {
						alert('Clicked ' + eventObj.title + "-----"
								+ eventObj.url);
					}
				},
				events: function (start, end, timezone, callback) {
					$.ajax({
					 	url : "<c:url value='/schedule/schList' />",
						success : function(result){
							for( var list in result) {
								console.log(list.sc_emp_no);
								console.log(list.sc_date);
								console.log(list.sc_attendance);
								console.log(list.sc_leave);
								console.log(list.sc_date_leng);
								console.log(list.sc_division);
								console.log(list.sc_status);
							}
							
// 							for(int i = 0; i<result.length; i++){
								
// 							}
// 							calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':info.endStr});
							
						}
					});
					
				},
				
				locale : 'ko'
			});
			calendar.render();

		});
	</script>

</body>
</html>




