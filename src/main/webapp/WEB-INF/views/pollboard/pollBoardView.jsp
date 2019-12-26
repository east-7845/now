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
		<table class="table table-bordered">
			<colgroup>
				<col width="15%" />
				<col />
				<col width="15%" />
				<col />
			</colgroup>
			<tr>
				<th>글 제목</th>
				<!-- PollBoard : Controller에서 준 이름 -->
				<td>${pollBoard.po_title}</td>
				<th>조회수</th>
				<td>${pollBoard.po_hit}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${pollBoard.po_writer}</td>
				<th>작성자 IP</th>
				<td>${pollBoard.po_ip}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${pollBoard.po_reg_date}</td>
				<th>수정일</th>
				<td>${pollBoard.po_mod_date}</td>
			</tr>
			<tr>
				<th>글내용</th>
				<pre>
					<td colspan="3">${pollBoard.po_content}</td>
				</pre>
			</tr>
		</table>
		<div class="row">
			<a href="pollBoardList" class="btn btn-default btn-sm">글 목록</a> 
			 <a href="pollBoardEdit?po_no=${pollBoard.po_no}"
				class="btn btn-sm btn-info"> <span
					class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					&nbsp;&nbsp;수 정
			</a>
    	    <a href="pollBoardDelete?po_no=${pollBoard.po_no}"
				class="btn btn-sm btn-danger"> <span
					class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					&nbsp;&nbsp;삭제
			</a>
		</div>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>




