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
		margin-left: 30px;
		color: red;
	}
	.radio_text {
		text-align: center;
	}
</style>
</head>
<body>
	<form:form action="now" method="post" commandName="resultMessage">
		<div class="login_div">
			<table class="login_table">
				<tr class="radio_text">
					<td>
						<input type="radio" id="radio_no" name="login_radio" checked> 사원번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="radio_id" name="login_radio" > ID
					</td>
				</tr>
				<tr>
					<td id="login_no">사원번호  <input type="text" name="emp_no"></td>
					<td id="login_id">ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="emp_id"></td>
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
<script type="text/javascript">
	var login_no = document.getElementById("login_no");
	var login_id = document.getElementById("login_id");
	login_id.style.display = "none";
	
	var radio_check = document.getElementsByName("login_radio");
	radio_check[0].onclick = function() {
		login_no.style.display = "contents";
		login_id.style.display = "none";
	}
	radio_check[1].onclick = function() {
		login_no.style.display = "none";
		login_id.style.display = "contents";
	}
</script>
</html>
