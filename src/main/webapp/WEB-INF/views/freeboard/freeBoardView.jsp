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
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
			<table class="table table-striped table-bordered table-ellipsis">
				<colgroup>
					<col width="10%%">
					<col width="50%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<tr class="text-center">
					<td>제목</td>
					<td colspan="3">${board.fr_title}</td>
				</tr>
				<tr class="text-center">
					<td>작성자</td>
					<td>${board.fr_parent_no}</td>
					<td>작성일</td>
					<td>${board.fr_reg_date}</td>
				</tr>
				<tr class="text-center">
					<td>작성내용</td>
					<td colspan="3" class="text-left">${board.fr_content}</td>
				</tr>
			</table>
		</div>
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
			<div class="panel-body form-horizontal">
				<div class="form-group">
					<a href="freeBoardList" class="btn btn-default btn-sm">회원 목록</a> <a
						href="freeBoardEdit?fr_no=${board.fr_no}"
						class="btn btn-primary btn-sm"> <span
						class="glyphicon glyphicon-plus" aria-hidden="true"> 수정</span>
					</a>
				</div>
			</div>
		</div>
		
		<div class="panel panel-default" style="width: 60vw; margin-left: 20vw;">
			<div class="panel-body form-horizontal">
				<form name="frm_reply" action="<c:url value='/reply/replyRegist'/>"
					method="post" onclick="return false;">
					<input type="hidden" name="re_parent_no" value="${board.fr_no}">
					<input type="hidden" name="re_category" value="FREEBOARD">
					<div class="form-group">
						<label class="col-sm-2 control-label">댓글</label>
						<div class="col-sm-8">
							<textarea rows="3" name="re_content" class="form-control"></textarea>
						</div>
						<div class="col-sm-2">
							<button type="button" id="btn_reply_regist"
								class="btn btn-sm btn-info">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
	<script type="text/javascript">
		// 페이지 로딩된 후
		$(document).ready(function(){
			$("#btn_reply_regist").click(function(){
				params = $("form[name=frm_reply]").serialize();
				$.ajax({
					type : "POST", // 요청메소드
					data : params,
					url : "/reply/replyRegist",
					dataType: "json",
					success:function(result){ // 성공
						
					},
					error:function(a,b,c){ // 통신 실패
						
					}
					
				})
			});
		});
	</script>	
</body>

</html>




