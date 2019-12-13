<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>now</title>
<style type="text/css">
	.login_div {
		position: absolute;
		top: 39%;
		left: 39%;
	}
	.login_table td{
		width: 250px;
		height: 40px;
	}
	.login_btn {
		width: 65px;
		height: 65px; 
	}
	.login_td {
/* 		text-align: center; */
		margin-left: 30px;
		color: red;
	}
</style>
</head>
<body>
	<form:form action="now" method="post" commandName="resultMessage">
		<div class="login_div">
			<table class="login_table">
				<tr>
					<td>사원번호  <input type="text" name="emp_no"></td>
					<td rowspan="2"><input type="submit" class="login_btn" value="login"></td>
				</tr>
				<tr>
					<td>비밀번호  <input type="password" name="emp_pass"></td>
				</tr>
			</table>
				<c:if test="${resultMessage != null }">
					<p class="login_td">${resultMessage.message}</p>
				</c:if>
		</div>
	</form:form>
</body>
</html>
