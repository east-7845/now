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
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
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
					<c:forEach var="dataList" items="${dataList}">
						${dataList}
						
					</c:forEach>
					<%-- ${chatList.data} --%>
				</textarea>
				<!-- 내 채팅방(리스트) -->
				<div id="chatRoomList" style="border: 1px solid; width: 230px; height: 200px; display: inline-block;position: absolute;">
					<c:forEach var="memList" items="${chatList2}">
						<div>${memList}</div>
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
				<select class="lanSelect">
					<option value="end" selected="selected">번역안함</option>
					<option value="en" >English</option>
					<option></option>
					<option></option>
				</select>
				<input type="button" onclick="fn_chatBox()" value="채팅창">
			</div>
		</div>
	</div>


	<script>
		var sock = new SockJS("/now/echo");
		
		var selDivision = "end";
		sock.onmessage = function(e) {
			var data = e.data;
			var split = data.split("-.-");
			//var member ="${mapRoom.member}";
			var member ="${chatList}";
			var room = "${mapRoom.room}";
			var chatRoomName = document.getElementById("chatRoomList");
			var splitParent = chatRoomName.children[0].innerText;
			var splitChildren = splitParent.split(".");

			if(split[0] == "${mapRoom.room}" && (split[1] == "${userId}") || (member.search( "/"+ split[1] +"/")) ){
				if(selDivision == "end"){
					$("#chat").append(split[1] + " : " + split[5] + "\n");	
				}else{
					
					$.ajax({
						type:"POST",
						data:"&target="+ selDivision +"&format=html&q=" + split[5],
						url: "https://www.googleapis.com/language/translate/v2?key=AIzaSyDK-6ADsIFBisy3nAWpHzjCcrVXNrI8TJU",
						
						success:function(reponse){
							//alert(reponse.data.translations[0].translatedText);
							$("#chat").append(split[1] + " : " + split[5] + "\n");
							$("#chat").append("        (번역)" + reponse.data.translations[0].translatedText + "\n");
						}
					});
				}
				return true;
			}	
		}
			
		// 번역글 체크
		$(".lanSelect").change(function(){
			selDivision = $(':selected', this).val();
		});
		
		sock.onclose = function() {
			$("#chat").append("연결 종료");
			console.log("연결종료");
		}
	
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				sock.send( "${mapRoom.room}" +"-.-"+ "${userNm}"  +"-.-" + "${userId}" + "-.-" +$("#message").val() );
				$("#message").val('').focus();
			});
		});
		
		function fn_before(){
			location.href = "<c:url value='/chat/chatList' />"
		}
		
		var openWin;
		// 부모창 자식창 만들기
		function fn_chatBox(){
			// 부모창 이름
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("chatList?mini='ok'",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");

		}
		
		function setChildText(){
            openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
        }
		
	</script>
</body>
</html>
