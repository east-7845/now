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
	}
</style>
<script src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
</head>
<body>

	<div class="container_content" style="min-height: 34vw;">
		<div class="panel panel-default" style="width: 60vw; height: 88vw; margin-left: auto; margin-right: auto; overflow: auto;">
			<table border="1">
				<tr>
					<td colspan="2">${draft.draft_name }</td>
					<td colspan="2" rowspan="2">
						<table>
<!-- 							<tr> -->
<!-- 								<td>123 부장</td> -->
<!-- 								<td>321 상무</td> -->
<!-- 							</tr> -->
							<tr>
								<td height="30px;"></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>기안자 명</td>
					<td>${sessionEmp.emp_name }</td>
				</tr>
				<tr>
					<td>기안 제목</td>
					<td colspan="3"><input type="text" style="width: 100%;"></td>
				</tr>
				<tr>
					<td>결재자</td>
					<td colspan="3"><input type="text" id="grant" style="width: 88%;"><input type="button"  value="버튼" onclick="window.open('grantEmployee','grantEmployee','width=500,height=450,location=no,status=no,scrollbars=yes')"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="" cols="" class="form-control" id="id_content">${draft.draft_content }</textarea></td>
				</tr>
			</table>
		</div>
	</div>

</body>
<script type="text/javascript">
	CKEDITOR.replace('id_content', {
	    height: 500
	});
	
// 	$(document).ready(function(){
// 		document.getElementById("btnGrant").onclick = function() {
// 			window.open('grantEmployee','window_name','width=500,height=450,location=no,status=no,scrollbars=yes');
// 		};
// 	})
</script>
</html>

