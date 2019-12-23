<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% /* request.setCharacterEncoding("UTF-8"); */ %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/inc/common_header.jsp" %>
	<title>회원가입결과</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/now_top.jsp"%>
	<div>

	<c:if test="${cnt > 0 }">
	<h3>수정성공</h3>
	<div>
		<a class="btn btn-sm btn-default" href="noticeList.">회원목록</a> <a
			class="btn btn-sm btn-info"
			href="noticeView?nt_no=<%=request.getParameter("nt_no") %>">상세보기</a>
		<a class="btn btn-sm btn-info"
			href="noticeView?nt_id=${param.nt_no}">상세보기</a> 
			<a class="btn btn-sm btn-info" href="noticeEdit?nt_no=${notice.nt_no }">상세보기</a>
	</div>
	</c:if>
	<c:if test="${cnt == 0 }">
		<h3>수정실패</h3>
	<div>
		예외 정보 : ${ex.message }
	</div>
	<div>
		<a class="btn btn-sm btn-default" href="noticeList">회원목록</a>
		<a class="btn btn-sm btn-info" 
			href="#" onclick="history.go(-1)">뒤로가기</a>
		<a class="btn btn-sm btn-info" 
			href="noticeForm">목록으로 돌아가기</a>
	</div>
	</c:if>

<!--  catch문은 에러가 발생했을 경우를 의미한다. -->
<c:if test="${not empty ex }">
	<h3>수정실패</h3>
	<div>
		예외 정보 : ${ex.message }
	</div>
	<div>
		<a class="btn btn-sm btn-default" href="noticeList.do">회원목록</a>
		<!-- 뒤로가기 -->
		<!-- <a class="btn btn-sm btn-info" 
			href="javascript:history.go(-1)" onclick="history.go(-1)">뒤로가기</a> -->
		<a class="btn btn-sm btn-info" 
			href="#" onclick="history.go(-1)">뒤로가기</a>
		<a class="btn btn-sm btn-info" 
			href="noticeForm.do">목록으로 돌아가기</a>
	</div>
</c:if>

</div>
</body>
</html>