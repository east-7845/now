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
<link href="${pageContext.request.contextPath}/css/schedule.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/daygrid.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/timegrid.css" rel="stylesheet">

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
		
		<div id="wrapper">
			<div id="calendar"></div>
		</div>

	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
				selectable: true,
				defaultView : 'dayGridMonth',
				defaultDate : new Date(),
				header : {
					left : 'prev,next today',
					center : 'title',
					right : ''
				},
				dateClick: function(info) {
					console.log("dateClick" + info.title);
					console.log("dateClick" + info.view.type);
					  //alert( "data -- " + info.resource.activeStart);
				      /*alert('clicked ' +  info.resource.id);
				      alert('clicked1 ' + info.activeStart);
				      if(info.resource == null){
				    	  calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':'2019-12-20'});  
				      }else{
				         alert( "data -- " + info.resource.title);
				      } */
				      //calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':'2019-12-20'});
				    var division = "";
				    
				    $.ajax({
				    	data:{
				    			"startStr" : info.startStr,
				    			"endStr"   : endStr
				    	},
				    	success : function(result){
				    		calendar.addEvent({'title':'출근', 'start': info.dateStr, 'end':info.endStr});
				    	}
				    })
				},
				select: function (info) {
					//alert( "data -- " + info.resource.title);
					//alert( "data -- " + info.resource.activeStart);
				    //alert('selected ' + info.startStr + ' to ' + info.endStr);
				    
				    console.log("select1" + info);
				    console.log("select2" + info.view.type);
				    console.log("start -" + info.startStr +"-----" + info.endStr);
// 				    alert("select jsEvent - " + info.view.title);
				},
				eventClick:function(event) {
					var eventObj = event.event;
	                if(eventObj.url) {
	                    alert(eventObj.title + "\n" + eventObj.url, "wicked", "width=700,height=600");
	                    window.open(eventObj.url);
	                    return false;
	                }else{
	                	alert('Clicked ' + eventObj.title + "-----" + eventObj.url);
	                }
				},
    				
				locale: 'ko'
			});
			calendar.render();
			
			
		});
	</script>
	
</body>
</html>




