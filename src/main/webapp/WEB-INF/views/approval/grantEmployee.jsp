<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.grantEmployee {
		margin-left: auto;
		margin-right: auto;
	}
	.cursor {
		cursor: pointer;
	}
</style>
</head>
<body>

<div class="grantEmployee">
<c:forEach var="employeeVO" items="${employeeVO }" varStatus="num" step="1">
	<c:if test="${employeeVO.emp_rank != 'RANK000000'}">
		<c:forEach var="commonVO" items="${commonVO }">
			<c:if test="${employeeVO.emp_department ==  commonVO.com_cd}">
				<c:if test="${employeeVO.emp_department != 'DEPT000000' }">
					<div class="cursor" onclick="comNameClick('${num.index}')">${commonVO.com_name } </div>
				</c:if>
			</c:if>
			<c:if test="${employeeVO.emp_rank == commonVO.com_cd }">
				<c:if test="${employeeVO.emp_rank == 'RANK000001' }">
					<div class="cursor" onclick="grant('${employeeVO.emp_no}', '${employeeVO.emp_name }', '${commonVO.com_name }')">${employeeVO.emp_name } ${commonVO.com_name }</div>
				</c:if>
				<div class="cursor" id="${num.index }" onclick="grant('${employeeVO.emp_no}', '${employeeVO.emp_name }', '${commonVO.com_name }')" style="display: none;">&nbsp;&nbsp;&nbsp;${employeeVO.emp_name } ${commonVO.com_name } </div>
			</c:if>
		</c:forEach>
	</c:if>
</c:forEach>
</div>

</body>
<script type="text/javascript">
	function comNameClick(num) {
		if(document.getElementById(num).style.display == "none") {
// 			$("#"+num).prepend("&nbsp;&nbsp;&nbsp;");
			document.getElementById(num).style.display = "initial";
		} else {
			document.getElementById(num).style.display = "none";
		}
	}
	
	function grant(emp_no, emp_name, com_name) {
		opener.document.getElementById("grant").value = emp_name + " " + com_name;
	}
</script>
</html>