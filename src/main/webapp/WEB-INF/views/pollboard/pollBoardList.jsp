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
<title>자유게시판</title>

</head>
<body>
	<!-- header -->
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div> <!-- header end -->
	<div class="container_content"> <!-- 게시글 container  -->
		<table class="table table-striped table-bordered table-ellipsis">
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col />
				<col width="15%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<tr class="text-center">
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>상태</th>
				<th>조회수</th>
			</tr>
		<!-- pollBoardList(게시글)길이만큼 c:forEach로 반복해서 List 불러오기 -->
			<c:forEach var="board" items="${pollBoardList}">
				<tr>
					<td>${board.po_no}</td>
					<td>${board.po_topic}</td>
					<!-- a태그로 제목 클릭시 해당글로 이동 -->
					<td class="text-left"><a href="pollBoardView?po_no=${board.po_no}">${board.po_title}</a></td>
					<td>${board.po_writer}</td>
					<td>${board.po_comp_yn}</td>
					<td>${board.po_hit}</td>
				</tr>
			</c:forEach>

		</table>
	</div> <!-- 게시글 container end -->
	<!-- footer -->
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div> <!-- footer end -->
</body>
</html>




