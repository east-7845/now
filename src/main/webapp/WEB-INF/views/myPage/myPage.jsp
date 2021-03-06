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
	.container_content {
		width: 80vw;
		text-align: center;
		padding-right: 0px;
		padding-left: 0px;
		margin-left: auto;
		margin-right: auto;
	}
	.container_content_item {
 		display: inline-block;
	}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
	<div class="container_content">
		<div class="panel panel-default" style="width: 60vw; margin-left: 10vw;">
			<form:form action="myPageEdit" method="post" commandName="employee" class="myPageForm">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<td>사원 번호</td>
						<td>${employee.emp_no }
							<form:hidden path="emp_no"/>
						</td>
						<td>ID</td>
						<td>${employee.emp_id }
							<form:hidden path="emp_id"/>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${employee.emp_name }
							<form:hidden path="emp_name"/>
						</td>
						<td>주민등록번호</td>
						<td>
							${employee.emp_regno1 } - ${employee.emp_regno2 }
							<form:hidden path="emp_regno1"/><form:hidden path="emp_regno2"/>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="3">
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
						<td>연봉</td>
						<td>
							${employee.emp_salary }
							<form:hidden path="emp_salary"/>
						</td>
					</tr>
					<tr>
						<td>은행명</td>
						<td>
							${employee.emp_bankname }
							<form:hidden path="emp_bankname"/>
						</td>
						<td>계좌번호</td>
						<td>
							${employee.emp_banknum }
							<form:hidden path="emp_banknum"/>
						</td>
					</tr>
					<tr>
						<td>부서</td>
						<td>
							${employee.emp_department }
							<form:hidden path="emp_department"/>
						</td>
						<td>직급</td>
						<td>
							${employee.emp_rank }
							<form:hidden path="emp_rank"/>
						</td>
					</tr>
					<tr>
						<td>입사일</td>
						<td colspan="3">
							${employee.emp_hiredate }
							<form:hidden path="emp_hiredate"/>
						</td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" value="수정"></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
<!-- 	<div class="container_footer"> -->
<%-- 		<%@include file="/WEB-INF/inc/now_footer.jsp"%> --%>
<!-- 	</div> -->
</body>
</html>
