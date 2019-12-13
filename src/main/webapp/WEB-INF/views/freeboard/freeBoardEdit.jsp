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
		<div class="container_content" style="min-height: 34vw;">
			<div class="panel panel-default"
				style="width: 60vw; margin-left: 20vw;">
				<form:form commandName="board" action="freeBoardModfiy"
					method="post">
					<form:hidden path="fr_no" />
					<table class="table table-striped table-bordered table-ellipsis">
						<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<tr class="text-center">
							<td>제목</td>
							<td><form:input path="fr_title" /></td>
							<td>비밀번호</td>
							<td><form:input path="fr_pass" /></td>
						</tr>
						<tr class="text-center">
							<td>작성자</td>
							<td><form:input path="fr_parent_no" readonly="fr_parent_no" />
							</td>
							<td>작성일</td>
							<td><form:input path="fr_reg_date" readonly="fr_reg_date" />
							</td>
						</tr>
						<tr class="text-center">
							<td>아이피</td>
							<td><form:input path="fr_ip" readonly="true" /></td>
							<td>조회수</td>
							<td><form:input path="fr_hit" readonly="true" /></td>
						</tr>
						<tr class="text-center">
							<td>내용</td>
							<td colspan="3"><form:textarea path="fr_content" /></td>
						</tr>
					</table>
					<div class="row">
						<a href="freeBoardList" class="btn btn-default btn-sm">회원 목록</a>
						<button type="submit" class="btn btn-sm btn-success">수정</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- container_content -->
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>




