<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<script src="${pageContext.request.contextPath }/bootstrap-3.3.2/js/bootstrap.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content" style="min-height: 34vw;">
		<div>
			<div>방제목</div>
			<div>방수정일</div>
			<div>참여자수</div>
		</div>
		<div>
			<div>채팅어려워요</div>
			<div>2019-12-30</div>
			<div>5</div>
		</div>
		<button onclick="fn_moveForm()" value="방만들기"/>
		<%-- <c:forEach var="chatList"  items="{}">
			<c:if test="${chatList != null } ">
				<div></div>
			</c:if>
			<c:if test="${chatList == null }">
				<div>채팅중인 방이 없습니다</div>
			</c:if>
		</c:forEach> --%>
	</div><!-- container_content -->
	
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
	<script type="text/javascript">
		function fn_moveForm(){
			location.href =  "<c:url value='/chat/chatRoom' />";
		}
	</script>
</body>
</html>




