<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>admin</title>
<style type="text/css">
	.table-size {
		margin-left: auto;
		margin-right: auto;
		width: 50%;
	}
	.container_content {
		background-color: silver;
		width: 80vw;
		text-align: center;
		padding-right: 0px;
		padding-left: 0px;
		margin-left: auto;
		margin-right: auto;
	}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">
		<table class="table table-striped table-bordered table-ellipsis table-size">
			<tr>
				<td>사원번호</td>
				<td>ID</td>
				<td>이름</td>
				<td>연락처</td>
				<td>부서</td>
				<td>직급</td>
			</tr>
			<c:forEach var="emp" items="${employee }">
				<tr>
					<td>${emp.emp_no }</td>
					<td>${emp.emp_id }</td>
<<<<<<< HEAD
					<td>${emp.emp_name }</td>
					<td>${emp.emp_hp }</td>
					<td>${emp.emp_department }</td>
					<td>${emp.emp_rank }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
=======
					<td><a href="myPageEmpInfo?emp_no=${emp.emp_no }">${emp.emp_name }</a></td>
					<td>${emp.emp_hp }</td>
					<td>${emp.emp_department }</td>
					<td>${emp.emp_rank }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" id="emp_btn" value="사원등록">
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	document.getElementById("emp_btn").onclick = function() {
		location.href = "/now/myPage/myPageEmpInsert";
	};
// 	var empBtn = document.getElementById("emp_btn");
// 	empBtn.onclick = function() {
// 		alert("?");
// 	}
</script>
>>>>>>> refs/remotes/origin/shinHome
</html>
