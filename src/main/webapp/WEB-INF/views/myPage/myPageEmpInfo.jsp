<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
	<form:form action="myPageEdit" method="post" commandName="employee" class="myPageForm">
		<table class="table table-striped table-bordered table-ellipsis table-size">
			<tr>
				<td>사원 번호</td>
				<td>${employee.emp_no }
					<form:hidden path="emp_no"/>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${employee.emp_name }
					<form:hidden path="emp_name"/>
				</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>${employee.emp_id }
					<form:hidden path="emp_id"/>
				</td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td>
					${employee.emp_regno1 } - ${employee.emp_regno2 }
					<form:hidden path="emp_regno1"/><form:hidden path="emp_regno2"/>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					${employee.emp_zip } ${employee.emp_add1 } ${employee.emp_add2 }
					<form:hidden path="emp_zip"/><form:hidden path="emp_add1"/><form:hidden path="emp_add2"/>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					${employee.emp_hp }
					<form:hidden path="emp_hp"/>
				</td>
			</tr>
			<tr>
				<td>비상연락망</td>
				<td>
					${employee.emp_hp_sub }
					<form:hidden path="emp_hp_sub"/>
				</td>
			</tr>
			<tr>
				<td>메일</td>
				<td>
					${employee.emp_mail }
					<form:hidden path="emp_mail"/>
				</td>
			</tr>
			<tr>
				<td>은행명</td>
				<td>
					${employee.emp_bankname }
					<form:hidden path="emp_bankname"/>
				</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td>
					${employee.emp_banknum }
					<form:hidden path="emp_banknum"/>
				</td>
			</tr>
			<tr>
				<td>연봉</td>
				<td>
					${employee.emp_salary }
					<form:hidden path="emp_salary"/>
				</td>
			</tr>
			<tr>
				<td>연차</td>
				<td>
					${employee.emp_vacation }
					<form:hidden path="emp_vacation"/>
				</td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					${employee.emp_department }
					<form:hidden path="emp_department"/>
				</td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					${employee.emp_rank }
					<form:hidden path="emp_rank"/>
				</td>
			</tr>
			<tr>
				<td>입사일</td>
				<td>
					${employee.emp_hiredate }
					<form:hidden path="emp_hiredate"/>
				</td>
			</tr>
			<c:if test="${sessionEmp.emp_no == 'NOW0000001' }">
				<tr>
					<td>퇴사여부</td>
					<td>
						${employee.emp_yn }
						<form:hidden path="emp_yn"/>
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>
		</table>
		</form:form>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>
