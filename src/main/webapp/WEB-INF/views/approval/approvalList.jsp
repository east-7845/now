<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전자결재</title>
<style type="text/css">
	.draft_div {
		height: 25px;
		font-size: 15px;
		margin-top: 10px;
	}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content" style="min-height: 34vw;">
		<div class="panel panel-default" style="width: 30vw; height: 33vw; margin-left: auto; margin-right: auto; overflow: auto;">
			<c:forEach var="draft" items="${draft}">
				<div class="draft_div" id="draft" onclick="window.open('draftInfo?draft_no=${draft.draft_no}','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');">
					<a href="#">${draft.draft_name}</a>
				</div>
			</c:forEach>
		</div>
		<c:if test="${sessionEmp.emp_no == 'NOW0000001' }">
			<div style="width: 30vw; margin-left: auto; margin-right: auto; text-align: center;">
				<input type="button" value="기안서 등록" id="draftFormInsert">
			</div>
		</c:if>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		document.getElementById("draftFormInsert").onclick = function() {
			window.open('draftFormInsert','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');
		};
	})
</script>
</html>



