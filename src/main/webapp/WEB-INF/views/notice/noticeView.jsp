<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>공지사항</title>
</head>
<body>
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	<div class="container">
		<table class="table table-striped">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col />
			</colgroup>
				<tr>
					<th>제목</th>
					<td>${noticeVO.nt_title}</td>
					<th>조회수</th>
					<td>${noticeVO.nt_hit}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${noticeVO.nt_writer}</td>
				</tr>
<%-- 				<tr>
					<th>구분</th>
					<c:forEach var="code" items="${lanList}">
						<c:choose>
							<c:when test="${noticeVO.nt_class eq code.com_cd}">
								<td colspan="3">${code.com_nm }</td>
							</c:when>
						</c:choose>
					</c:forEach>
				</tr> --%>

				<tr>
					<th>글내용</th>
					<td colspan="3">${noticeVO.nt_content}</td>
				</tr>
		</table>
			</div>
		<c:if test="${noticeVO != null }">
			<div class="row">
				<a href="noticeList.do" class="btn btn-default btn-sm">회원 목록</a> <a
					href="noticeEdit.do?nt_no=${noticeVO.nt_no}"
					class="btn btn-primary btn-sm"> <span
					class="glyphicon glyphicon-plus" aria-hidden="true"></span> 수정
				</a>
			</div>
		</c:if>


	<!-- container -->
			<div class="container_footer">
				<%@include file="/WEB-INF/inc/now_footer.jsp"%>
		</div>

</body>
</html>

