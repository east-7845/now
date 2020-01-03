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
	href="${pageContext.request.contextPath }/bootstrap-3.3.2/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scrip>
    <![endif]-->
<script src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<script	src="${pageContext.request.contextPath }/bootstrap-3.3.2/js/bootstrap.js"></script>

</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
	<div class="container_content" style="min-height: 34vw;">
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="board_list_head">
					<div class="num">체크</div>
                	<div class="num">번호</div>
                	<div class="writer">사용자</div>
            	</div>
				<div class="board_list_body" style="display: block;">
					<c:forEach var="memberList" items="${employee}">
						<div class="item">
							<div class="num">
								<input type="checkbox" name="memberCheck"
									value="${memberList.emp_no}">
							</div>
							<div class="num">${memberList.emp_no}</div>
							<div class="writer">${memberList.emp_name}</div>
						</div>
					</c:forEach>
					<input type="text" id="roomName" >
					<button onclick="fn_roomCreBtn();">방만들기</button>
				</div>
			</div>
		</div>
		<div class="board_list_wrap">
			<div class="board_list" id="chatRoomList">
				<div class="board_list_head">
					<div class="num">방번호</div>
					<div class="num">아이디</div>
	            	<div class="title">방제목</div>
	            	<div class="writer">참여자</div>
	            	<div class="date">날자</div>
        		</div>
				<div class="board_list_body" id="bodyid">
				<c:forEach var="chatlist" items="${chatListVO}">
					<c:if test="${chatListVO == null}">
						<div>데이터가 없습니다.</div>
					</c:if>
					<c:if test="${chatListVO != null}">
						<div class="item" name="roomList">
							<div class="num">${chatlist.room}</div>
							<div class="num">${chatlist.id}</div>
							<div class="title">${chatlist.title}</div>
							<div style="display: none;">${chatlist.member}</div>
							<div class="writer">${chatlist.memberName}</div>
							<div class="date">${chatlist.date}</div>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- container_content -->
	<script type="text/javascript">
		// 방클릭시 이동하기.
		$("div[name=roomList]").dblclick(function() {
			var div = $(this);
			console.log(div);
			var div1 = div.children("div");
			console.log(div1.innerHTML);
			var str = [];
			str[0] = div1[0].innerHTML; //방번호
			str[1] = div1[1].innerHTML; //계정 아이아이디
			str[2] = div1[2].innerHTML; //계정 아이아이디
			location.href = "<c:url value='/chat/chatView?data=" + str + "'/>"

		});

		function fn_moveForm() {
			location.href = "<c:url value='/chat/chatRoom' />";
		}

		// 방만들기
		function fn_roomCreBtn() {
			var checkVal = [];
			var checkNm = [];
			var title = document.getElementById("roomName").value;
			var lenMax = $("input:checkbox[name='memberCheck']:checked").length;
			var num = 0;
			
			// 체크 한 유저 정보
			$("input:checkbox[name='memberCheck']:checked").each(
				function() {
					var userName = $(this)[0].parentNode.parentNode.children[2].innerText;
					if (num < lenMax) {
						checkNm[num] = userName;
						checkVal[num] = $(this).val();
					} else {
						num = 0;
						return;
					}
					num++;
				});

			$.ajax({
						data : {
							"emp" : checkVal,
							"empUser" : checkNm,
							"empTile" : title
						},
						url : "<c:url value='/chat/chatRoom'/>",
						success : function(result) {
							var str = "";
							str = "<div name='roomList' class='item'>";
							str += "<div class='num'>" + result.room + "</div>";
							str += "<div class='num'>" + result.id + "</div>";
							str += "<div class='title'>" + title + "</div>";
							//str += "<div style='display: none;'>" + result.memberNm + "</div>";
							str += "<div class='writer'>" + result.memberNm + "</div>";
							str += "<div class='date'>" + result.date + "</div>";
							str += "</div>";
							$("#bodyid").append(str);

							// 방클릭시 이동하기.
							$("div[name=roomList]").dblclick(
								function() {
									
									var div = $(this);
									console.log(div);
									var div1 = div.children("div");
									console.log(div1);
									var str = [];
									str[0] = div1[0].innerHTML; //방번호
									str[1] = div1[1].innerHTML; //계정 아이아이디
									str[2] = div1[2].innerHTML; //계정 아이아이디
									location.href = "<c:url value='/chat/chatView?data="
											+ str + "'/>"
								});
							}
					});
		}
	</script>
</body>
</html>



