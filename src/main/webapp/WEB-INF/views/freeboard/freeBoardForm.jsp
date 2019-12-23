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
<title>부트스트랩 101 템플릿</title>
<style type="text/css">


	.textareaBox{
		min-width: 625px;
		min-height: 240px;
	}

</style>

<script type="text/javascript">
$(document).ready(function(){

	$("#id_btn_new_file").click(function(){
		$(".file_area").append("<div class='form-inline'>"
		+ "<input type='file' name='fr_files' class='form-control'>"
		+ " <button type='button' class='btn_delete btn btn-sm'>삭제</button>"
		+ "</div>");
	});

	$('.file_area').on('click','.btn_delete', function(){
		$(this).closest('div').remove();
	});

});
</script>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
			<form:form commandName="board" action="freeBoardRegist" method="post"
				enctype="multipart/form-data">
				<table class="table table-striped">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr class="text-center">
						<td>제목</td>
						<td><form:input path="fr_title" cssStyle="min-width: 625px;" /></td>
					</tr>
					<tr>
						<td>첨부파일
							<button type="button" id="id_btn_new_file">추가</button>
						</td>
						<td class="file_area" colspan="3">
							<div class="form-inline">
								<input type="file" name="fr_files" class="form-control">
								<button type="button" class="btn_delete btn btn-sm">삭제</button>
							</div>
						</td>
					</tr>
					<tr class="text-center">
						<td>내용</td>
						<td><form:textarea path="fr_content" cssClass="textareaBox" /></td>
					</tr>
					<tr>
						<td colspan="4"><a href="freeBoardList"
							class="btn btn-default btn-sm">글 목록</a>
							<button type="submit" class="btn btn-sm btn-success">등록</button></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>




