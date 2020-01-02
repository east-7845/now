<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="ko">
<head>
<title>전자결재</title>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<style type="text/css">
	td {
		height: 40px;
		text-align: center;
	}
</style>
</head>
<body>

	<div class="container_content" style="min-height: 34vw;">
		<div class="panel panel-default" style="width: 60vw; height: 75vw; margin-left: auto; margin-right: auto; overflow: auto;">
		<form:form action="draftInsert">
			<table border="1">
				<tr>
					<td>출장보고서</td>
					<td><input type="text" name="draft_name" style="width: 100%;"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="draft_content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"> </td>
				</tr>
			</table>
		</form:form>
		</div>
	</div>

</body>
<script type="text/javascript">
	CKEDITOR.replace("draft_content", {
	    height: 500
	});
</script>
</html>

