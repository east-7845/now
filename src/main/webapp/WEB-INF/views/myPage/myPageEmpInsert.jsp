<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>myPage</title>
<style type="text/css">
	.table-size {
		margin-left: auto;
		margin-right: auto;
		width: 50%;
	}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">
		<form:form action="myPageInsert" method="post" commandName="employee">
			<table class="table table-striped table-bordered table-ellipsis table-size">
				<tr>
					<td>사원번호</td>
					<td>
						<div id="empNo"></div><input type="button" value="사원번호 생성" id="empNoInsert">
						<input type="hidden" id="empNoHidden" name="emp_no" />
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="emp_name" /></td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="emp_department">
							<c:forEach var="dept" items="${dept }">
								<option value="${dept.com_cd }">${dept.com_name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
						<select name="emp_rank">
							<c:forEach var="rank" items="${rank }">
								<option value="${rank.com_cd }">${rank.com_name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>연봉</td>
					<td><input type="text" name="emp_salary" />만원</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form:form>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	document.getElementById("empNoInsert").onclick = function() {
		$.ajax({
	        type:"POST",
	        url:"/now/myPage/myPageEmpSelectNo",
	        dataType : "text",
	        success: function(success){
				document.getElementById("empNoInsert").style.display = "none";
				var emp_no = document.getElementById("empNo");
				var empNoHidden = document.getElementById("empNoHidden");
				emp_no.style.display = "block";
				emp_no.innerHTML = success;
				empNoHidden.value = success;
	        }
	    });
	}
</script>
</html>
