<%@page import="java.util.List"%>
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
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
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
<style type="text/css">
.container_content div {
	display: inline-block;
	border: 1px solid black;
}
</style>
</head>

<body>
	<div class="container">
		<%-- <%@include file="/WEB-INF/inc/now_top.jsp"%> --%>
	</div>
	<div class="container_content"
		style="min-height: 34vw; text-align: center;">
		<div style="text-align: center;">
			<span>사용자 리스트</span> <br>
			<div style="display: block;">
				<c:forEach var="memberList" items="${employee}">
					<div>
						<div>
							<input type="checkbox" name="memberCheck" value="${memberList.emp_no}">
						</div>
						<div>${memberList.emp_no}</div>
						<div>${memberList.emp_name}</div>
					</div>
					<br>
				</c:forEach>
				<input type="text" id="roomName" value="">
				<button onclick="fn_roomCreBtn();">방만들기</button>
			</div>
			<div id="chatRoomList">
				<br> <span>채팅방 목록</span> <br>
				<div style="display: block;">
					<div>방번호</div>
					<div>방장넘버</div>
					<div>참여자</div>
					<div>날짜</div>
				</div>
				<c:forEach var="chatlist" items="${chatListVO}">
					<c:if test="${chatListVO == null}">
						<div>데이터가 없습니다.</div>
					</c:if>

					<c:if test="${chatListVO != null}">
						<div name="roomList">
							<div>${chatlist.room}</div>
							<div>${chatlist.id}</div>
							<div>${chatlist.member}</div>
							<%-- <div>${chatlist.data}</div> --%>
							<div>${chatlist.webSocSession}</div>
							<div>${chatlist.userSession}</div>
							<div>${chatlist.date}</div>
							<div>${chatlist.deleteYN}</div>
						</div>
					</c:if>
					<br>
				</c:forEach>
			</div>
			<button onclick="fn_moveForm()">방만들</button>
		</div>


		<%-- <c:forEach var="chatList"  items="{}">
			<c:if test="${chatList != null } ">
				<div></div>
			</c:if>
			<c:if test="${chatList == null }">
				<div>채팅중인 방이 없습니다</div>
			</c:if>
		</c:forEach> --%>
	</div>
	<!-- container_content -->

	<div class="container_footer">
		<%-- <%@include file="/WEB-INF/inc/now_footer.jsp"%> --%>
	</div>
	<script type="text/javascript">
		// 		var sock = new SockJS("/now/echo");

		// 		sock.onmessage = function(e) {
		// 			//$("#chat").append(e.data + "<br/>");
		// 			$("#chat").append(e.data + "\n");
		// 			console.log("연결메시지");
		// 		}

		// 		sock.onclose = function() {
		// 			$("#chat").append("연결 종료");
		// 			console.log("연결종료");
		// 		}

		// 		$(document).ready(function() {
		// 			$("#chatForm").submit(function(event) {
		// 				event.preventDefault();
		// 				sock.send($("#message").val());
		// 				$("#message").val('').focus();
		// 			});
		// 		});
		// 방클릭시 이동하기.
		$("div[name=roomList]").dblclick(function() {
			var div = $(this);
			var div1 = div.children("div");
			console.log(div1.innerHTML);
			var str = [];
			str[0] = div1[0].innerHTML; //방번호
			str[1] = div1[1].innerHTML; //계정 아이아이디
			str[2] = div1[2].innerHTML; //계정 아이아이디
			location.href = "<c:url value='/chat/chatView?data=" + str + "&mini=ok'/>"
		});

		function fn_moveForm() {
			location.href = "<c:url value='/chat/chatRoom' />";
		}

		// 방만들기
		function fn_roomCreBtn() {
			var checkVal = [];

			var lenMax = $("input:checkbox[name='memberCheck']:checked").length;
			var num = 0;
			// 체크 한 유저 정보
			$("input:checkbox[name='memberCheck']:checked").each(function() {
				if (num < lenMax) {
					checkVal[num] = $(this).val();
				} else {
					num = 0;
					return;
				}
				num++;
			});

			var roomName = $("#roomName").val(); // 방 이름

			$.ajax({
						data : {
							"emp" : checkVal
						},
						url : "<c:url value='/chat/chatRoom'/>",
						success : function(result) {
							var str = "";
							str = "<div name='roomList'>";
							str += "<div>" + result.room + "</div>";
							str += "<div>" + result.id + "</div>";
							str += "<div>" + result.date + "</div>";
							/* str += "<div>"+result.id+"</div>";
							str += "<div>"+result.member+"</div>";
							str += "<div>"+result.date+"</div>"; */
							str += "</div>";
							$("#chatRoomList").append(str);

							// 방클릭시 이동하기.
							$("div[name=roomList]")
									.dblclick(
											function() {
												var div = $(this);
												var div1 = div.children("div");
												console.log(div1.innerHTML);
												var str = [];
												str[0] = div1[0].innerHTML; //방번호
												str[1] = div1[1].innerHTML; //계정 아이아이디
												str[2] = div1[2].innerHTML; //계정 아이아이디
												location.href = "<c:url value='/chat/chatView?data="
														+ str + "&mini=ok'/>"
											});
						}
					});

		}
	</script>
</body>
</html>



