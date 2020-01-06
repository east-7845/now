<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/inc/common_header.jsp"%>

<title>공지 수정</title>
</head>
<body>

	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
		<div class="panel panel-default" style="width: 60vw; margin-left: 20vw;">
			<h3>수정 페이지</h3>
			<form:form name="frm_notice" commandName="notice" action="noticeModify" method="post">
				<form:hidden path="nt_no"/>
					<table class="table table-striped  table-ellipsis">
						<colgroup>
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
						</colgroup>
							<tr>
								<th>제목</th>
								<td colspan="3">
										<form:input path="nt_title" cssClass="form-control"/> 
								</td>
							</tr>
							<tr>
								<th>번호</th>
								<td colspan="3">${notice.nt_no}</td>	
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="3"> 
									<form:input path="nt_writer" name="nt_writer" value="${sessionEmp.emp_no}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>조회수</td>
								<td>${notice.nt_hit}</td>
							</tr>
							<tr>
								<td>작성일</td>
								<td colspan="1">${notice.nt_reg_date}</td>
								<td>수정일</td>
								<td colspan="1">${notice.nt_mod_date}</td>
							</tr>
					
							<tr>
								<th>글내용</th>
								<td colspan="3" >
									<form:textarea path="nt_content" rows="10" cols="60"/>
								</td>
							</tr>
							<tr>
								<td colspan="4"><a href="noticeList" class="btn btn-default btn-sm" >목록</a>
								<button type="submit" class="btn btn-sm btn-success right">수정</button></td>
							</tr>
					</table>
			</form:form>
	</div>
</body>
</html>