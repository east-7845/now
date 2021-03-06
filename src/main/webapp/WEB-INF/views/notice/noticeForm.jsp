<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
		<div class="panel panel-default" style="width: 60vw; margin-left: 20vw;">
			<h3>글 작성</h3>
				<form action="noticeRegist" method="post" >
				<table class="table">
						<colgroup>
								<col width="15%" />
								<col width="35%" />
								<col width="15%" />
								<col  />
						</colgroup>
							<tr>
								<th>글제목</th>
									<td colspan="3">
										<input type="text" name="nt_title" value="${notice.nt_title}">
									</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>
									<input type="text" name="nt_writer" value="${sessionEmp.emp_no}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea rows="10" cols="60" name="nt_content">${notice.nt_content}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<a href="noticeList" class="btn btn-sm btn-default">목록</a>
									<button type="submit" class="btn btn-sm btn-success">등록</button>
							</td>
							</tr>
						</table>
					</form>
			</div>
</body>
</html>
