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
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content" style="min-height: 34vw;">
		
	</div>
	<!-- container_content -->

	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
	
	<script type="text/javascript">
		/* $.ajax({
			type:"POST",
			data:"&target=en&format=html&q=안녕하세요. 저는 넥스트아이티에 한수민입니다",
			url: "https://www.googleapis.com/language/translate/v2?key=AIzaSyDK-6ADsIFBisy3nAWpHzjCcrVXNrI8TJU",
			
			success:function(reponse){
				alert(reponse.data.translations[0].translatedText);
			}
		}); */
	</script>
	
</body>

</html>




