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
		<%-- <form:form commandName="board" action="pollBoardModify.do"> --%>
			<table class="table">
				<colgroup>
					<col width="15%" />
					<col />
					<col width="15%" />
					<col />
				</colgroup>
				<tr>
					<th>글제목</th>
					<td colspan="3"><form:input path="bo_title" /> <form:errors
							path="bo_title" /></td>
				</tr>
				<tr>
					<th><input type="hidden" name="bo_no"
						value="${PollBoard.bo_no}">글번호</th>
					<td colspan="3">${PollBoard.bo_no}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><form:input path="bo_writer" /> <form:errors
							path="bo_writer" /></td>
					<th>비밀번호</th>
					<td><form:password path="bo_pass" placeholder="수정 및 삭제시 필요" />
						<form:errors path="bo_pass" /></td>
				</tr>
				<tr>
					<th>분류</th>
					<td colspan="3"><form:select path="bo_class">
							<option value="">게시물 분류를 선택해 주세요</option>
							<form:options items="${bcList}" itemValue="com_cd"
								itemLabel="com_nm" />
						</form:select> <form:errors path="bo_class" /></td>
				</tr>

				<tr>
					<th>ip</th>
					<td>${board.bo_ip}</td>
					<th>조회수</th>
					<td>${PollBoard.bo_hit}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${PollBoard.bo_reg_date}</td>
					<th>수정일</th>
					<td>${PollBoard.bo_mod_date}</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td colspan="3"><textarea rows="5" name="bo_content"
							class="form-control">${PollBoard.bo_content}</textarea></td>
				</tr>
				<tr>
					<td><a href="pollBoardList" class="btn btn-sm btn-default">
							글목록 </a>
						<button type="submit" class="btn btn-sm btn-success">수정</button></td>
				</tr>
			</table>
		<%-- </form:form> --%>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>



