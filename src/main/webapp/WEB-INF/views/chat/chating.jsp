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
<script src="${pageContext.request.contextPath }/js/sockjs.min.js"></script>
</head>
<body>

	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
			<form id="chatForm">
				<input type="text" id="message" />
				<button>send</button>
			</form>
			<div id="chat"></div>
		</div>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>

	<script>
		$(document).ready(function() {
			$("#chatForm").submit(function(event) {
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});

		var sock = new SockJS("/now/echo");

		sock.onmessage = function(e) {
			$("#chat").append(e.data + "<br/>");
			console.log("연결메시지");
		}

		sock.onclose = function() {
			$("#chat").append("연결 종료");
			console.log("연결종료");
		}
	</script>
</body>
</html>
