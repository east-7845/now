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
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
	<div class="container_content">
			<div class="panel panel-default"
			style="width: 60vw; margin-left: 10vw;">
		<%-- <form:form commandName="board" action="pollBoardModify.do"> --%>
		<form:form commandName="pollBoard" action="pollBoardRegist">
			<!-- Method는 기본적으로 POST  -->
			<table class="table">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col />
				</colgroup>
				<tr>
					<th>글제목</th>
					<td colspan="3"><form:input path="po_title" /> 
					<form:errors path="po_title" />
				</td>
				</tr>
				<tr>	
					<th>작성자</th>
					<td><form:input path="po_writer" />
						<form:errors path="po_writer" />
					</td>
					<th>패스워드</th>
					<td><form:password path="po_pass" placeholder="수정 및 삭제시 필요" />
						<form:errors path="po_pass" /></td>
				</tr>
				<tr>
					<th>그룹</th>
					<td colspan="3"><%-- <form:select path="bo_class">
							<option value="">게시물 분류를 선택해 주세요</option>
							<form:options items="${bcList}" itemValue="com_cd"
								itemLabel="com_nm" />
						</form:select> <form:errors path="bo_class" /> --%></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td colspan="3"><form:textarea rows="10" cols="60" path="po_content"/>
				<%-- <td colspan="3"><textarea rows="10" cols="60"
							name="po_content" path="po_content">${board.po_content}</textarea></td> --%>
				</tr>
				<tr>
					<td colspan="4"><a href="pollBoardList"
						class="btn btn-sm btn-default">글목록</a>
						<button type="submit" class="btn btn-sm btn-success">등록</button></td>
				</tr>
			</table>
		</form:form>
		<%-- </form:form> --%>
	</div>
	</div>
</body>
</html>




