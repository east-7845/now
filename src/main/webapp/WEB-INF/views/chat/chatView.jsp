<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>Home</title>
<meta charset="UTF-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
<!-- <script src="/resources/sockjs.min.js"></script> -->
<!-- <script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script> -->
<!-- <script src="js/sockjs.min.js"></script> -->
<!-- <script src="resources/sockjs.min.js"></script> -->
</head>
<body>

	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">

		<!--  채팅 TEXT -->
		<div style="">
			<div class="panel panel-default" style="width: 60vw; margin-left: 20vw;">
				<div>
					<span>채팅내용</span>
					<span style="margin-left: 370px;">채팅룸 리스트</span>
				</div>
				<!-- <div id="chat"></div> -->
				<textarea rows="3" cols="10" id="chat"
					style="width: 400px; height: 400px;     display: inline-block;">
				</textarea>
				<!-- 내 채팅방(리스트) -->
				<div id="chatRoomList" style="border: 1px solid; width: 230px; height: 200px; display: inline-block;position: absolute;">
					<!-- <div id="chatRoomList"></div> -->
				</div>
				<!-- 현재 채팅방 사용자리스트 -->
				<div id="chatGuest" style="border: 1px solid; width: 230px;height: 150px;display: inline-block;">
					<!-- <div></div> -->
				</div>
				<form id="chatForm" style="display: inline-block;">
					<input type="text" id="message" style="width: 400px;" />
					<button>send</button>
				</form>
			</div>
		</div>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>

	<script>
		var sock = new SockJS("/now/echo");

		sock.onmessage = function(e) {
			//$("#chat").append(e.data + "<br/>");
			$("#chat").append(e.data + "\n");
			console.log("연결메시지");
		}

		sock.onclose = function() {
			$("#chat").append("연결 종료");
			console.log("연결종료");
		}

		$(document).ready(function() {
			$("#chatForm").submit(function(event) {
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});
	</script>
</body>
</html>
