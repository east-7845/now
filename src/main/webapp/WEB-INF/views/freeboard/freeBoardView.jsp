<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<table>
			<colgroup>
				<col width="10%%">
				<col width="50%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tr>
				<c:forEach var="board" items="${freeBoardList}">
					<td>${board.fr_no}</td>
					<td><a href="">${board.fr_title}</a></td>
					<td>${board.fr_writer}</td>
					<td>${board.fr_reg_date}</td>
					<td>${board.fr_hit}</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>




