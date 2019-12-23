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
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
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
					<span>${mapRoom.room}</span>
					<span>채팅내용</span>
					<span style="margin-left: 370px;">사용자 리스트</span>
				</div>
				<!-- <div id="chat"></div> -->
				<textarea rows="3" cols="10" id="chat"
					style="width: 400px; height: 400px; display: inline-block;" readonly="readonly" >
					<%-- ${chatList.data} --%>
				</textarea>
				<!-- 내 채팅방(리스트) -->
				<div id="chatRoomList" style="border: 1px solid; width: 230px; height: 200px; display: inline-block;position: absolute;">
					<c:forEach var="memList" items="${chatList}">
						<div>${memList.member}</div>
					</c:forEach>
				</div>
				<!-- 현재 채팅방 사용자리스트 -->
				<div id="chatGuest" style="border: 1px solid; width: 230px;height: 150px;display: inline-block;">
					<!-- <div></div> -->
				</div>
				<form id="chatForm" style="display: inline-block;" onsubmit="return false;">
					<input type="text" id="message" style="width: 400px;" />
					<button >send</button>
				</form>
				<input type="button" onclick="fn_before()" value="이전페이지">
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
			console.log("들어와요");
			var data = e.data;
			var split = data.split("-/-");
			var member ="${mapRoom.member}";
			var room = "${mapRoom.room}";
			memMap = member.split(".");
			console.log(memMap);
			var chatRoomName = document.getElementById("chatRoomList");
			var splitParent = chatRoomName.children[0].innerText;
			var splitChildren = splitParent.split(".");

			//if(split[0] == ${mapRoom.room} && split[1] == ${userId} ){
			//for(var i = 0; i < (splitChildren.length); i++ ){
			//if(split[0] == "${mapRoom.room}" && split[1] == "${userId}" || split[1] == splitChildren[i]){
			if(split[0] == "${mapRoom.room}" && split[1] == "${userId}" || splitChildren.test(split[1])){
				//if(split[0] == room){
				console.log("메세지전송했습니다.");
				$("#chat").append(split[4] + "\n");	
				return true;
			}
			//}
			/* if(split[0] == ${mapRoom.room} && split[1] == ${mapRoom.id}  ){
				$("#chat").append(split[2] + "\n");	
			} */
			
			console.log("연결메시지");
		}

		sock.onclose = function() {
			
			$("#chat").append("연결 종료");
			console.log("연결종료");
		}

// 		function fn_chatSubmit(){
			
// 			$("#chatForm").submit(function(event) {
// 				event.preventDefault();
// 				sock.send( "${mapRoom.room}" +"-/-"+ "${userId}" + "-/-" +$("#message").val() );
// 				$("#message").val('').focus(); 
// 			});
// 		}
		
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				sock.send( "${mapRoom.room}" +"-/-"+ "${userId}" + "-/-" +$("#message").val() );
				$("#message").val('').focus();
			});
		});
		
		function fn_before(){
			location.href = "<c:url value='/chat/chatList' />"
		}
	</script>
</body>
</html>
