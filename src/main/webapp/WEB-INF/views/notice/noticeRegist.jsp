<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>

<title>결과</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/now_top.jsp"%>
	<div class="container">
		<div class="page-header">
			<h3>등록 성공</h3>
		</div>
		<div>
			<a class="btn btn-sm btn-default" href="noticeList.do">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			&nbsp;&nbsp;글목록
			</a>
		</div>
	</div>
</body>
</html>