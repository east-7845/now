<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<%@include file="/WEB-INF/inc/now_top.jsp"%>
<title>게시판 수정</title>
</head>
<body>
	<div class="container">
		<h3>게시판 수정 페이지</h3>
		<form:form name="frm_notice" commandName="notice" action="noticeModify.do" method="post" enctype="multipart/form-data">
			<form:hidden path="nt_no"/>
			<table class="table table-striped">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col />
				</colgroup>
				<tr>
					<th>제목</th>
					<td colspan="3">
							<form:input path="nt_title" cssClass="form-control"/> 
							<form:errors path="nt_title" />
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<td colspan="3">${notice.nt_no}</td>	
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<form:input path="nt_writer" /><form:errors path="nt_writer" />
					</td>
				</tr>
				<tr>
					<th>구분</th>
					<td colspan="3">
						<form:select path="nt_class">
							<option value="">언어 선택</option>
							<form:options items="${bcList}" itemValue="com_cd"
								itemLabel="com_nm" />
						</form:select> <form:errors path="nt_class" />
					</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${notice.nt_hit}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${notice.nt_reg_date}</td>
					<td>수정일</td>
					<td>${notice.nt_mod_date}</td>
				</tr>
			
				<tr>
					<th>글내용</th>
					<td colspan="3">
						<form:textarea path="nt_content"/>
					</td>
				</tr>
				<tr>
					<td colspan="4"><a href="noticeList.do"
						class="btn btn-default btn-sm">목록</a>
						<button type="submit" class="btn btn-sm btn-success">수정</button>
						 	<a href="noticeList.do?nt_no=${notice.nt_no}&nt_del=Y" class="btn btn-default btn-sm" />삭제
						</button>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>