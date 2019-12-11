<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<form:form commandName="board" action="freeBoardRegist" method="post" >
			<table>
				<colgroup>
					<col width="">
					<col width="">
				</colgroup>
				<tr>
					<td>제목</td>
					<td>
						<form:input path="fr_title" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<form:textarea path="fr_content"/>
					</td>
				</tr>
				<tr>
				<td colspan="4"><a href="freeBoardList"
						class="btn btn-default btn-sm">글 목록</a>
						<button type="submit" class="btn btn-sm btn-success">등록</button></td>
				</tr>
			</table>
		</form:form>		
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>




