<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="ko">
<head>
<title>전자결재</title>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<style type="text/css">
	td {
		height: 40px;
	}
</style>
<script src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
</head>
<body>

	<div class="container_content" style="min-height: 34vw;">
		<div class="panel panel-default" style="width: 60vw; height: 88vw; margin-left: auto; margin-right: auto; overflow: auto;">
			<form:form action="grantUpdate">
				<table border="1">
					<tr>
						<td colspan="2">${approval.draft_name }</td>
						<td colspan="2" rowspan="2">
							<table id="tableId" border="1" style="width: 100%;">
								<tr>
									<td class="draft">${approval.grant_emp_name1 }</td>
									<td class="draft">${approval.grant_emp_name2 }</td>
									<td class="draft">${approval.grant_emp_name3 }</td>
									<td class="draft">${approval.grant_emp_name4 }</td>
								</tr>
								<tr>
									<td><input type="hidden" id="emp_no0" name="grant_emp_no1" value="${approval.grant_emp_no1 }"></td>
									<td><input type="hidden" id="emp_no1" name="grant_emp_no2" value="${approval.grant_emp_no2 }"></td>
									<td><input type="hidden" id="emp_no2" name="grant_emp_no3" value="${approval.grant_emp_no3 }"></td>
									<td><input type="hidden" id="emp_no3" name="grant_emp_no4" value="${approval.grant_emp_no4 }"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>기안자 명</td>
						<td>${approval.emp_name }</td>
					</tr>
					<tr>
						<td>기안 제목</td>
						<td colspan="3"><input type="text" style="width: 100%;" value="${approval.app_name }"></td>
					</tr>
					<tr>
						<td>결재자</td>
						<td colspan="3"><input type="text" id="grant" style="width: 88%;"></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="" cols="" class="form-control" id="id_content">${approval.app_content }</textarea></td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="submit" value="승인" id="btnSubmit">
							<input type="button" value="반려" onclick="btnButton()">
							<input type="hidden" name="grant_app_no" value="${approval.grant_app_no }">
							<input type="hidden" name="grant_state" value="${approval.grant_state }">
						</td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>

</body>
<script type="text/javascript">
	CKEDITOR.replace('id_content', {
	    height: 500
	});
// 	var td = $("td");
// 	var a = $("#tableId").find(td);
// 	alert(a);
	var draft = document.getElementsByClassName("draft");
	var grant = document.getElementById("grant");
	for(var i = 0; i < draft.length; i++) {
		if(draft[i].innerHTML != "") {
			if(i == 0) grant.value = draft[i].innerHTML;
			if(i != 0) grant.value += ", "+draft[i].innerHTML;
// 			draft[i].innerHTML = emp_name + " " + com_name;
// 			document.getElementById("emp_no"+i).value = emp_no;
// 			return;
		}
	}
// 	function textInput(emp_no, emp_name, com_name) {sdn13
// 		var grant = document.getElementById("grant");
// 		var draft = document.getElementsByClassName("draft");
		
// 		if(grant.value == "") grant.value += emp_name + " " + com_name;
// 		else grant.value += ", " + emp_name + " " + com_name;
		

// 		for(var i = 0; i < draft.length; i++) {
// 			if(draft[i].innerHTML == "") {
// 				draft[i].innerHTML = emp_name + " " + com_name;
// 				document.getElementById("emp_no"+i).value = emp_no;
// 				return;
// 			}
// 		}
// 	}
	
// 	var btnSubmit = document.getElementById("btnSubmit");
// 	btnSubmit.click(function() {
// 		alert("d");
// 		close;
// 	})

	function btnButton() {
		alert("반려  컨트롤러 타서 업데이트 후 창 닫기");
	}
	
	

</script>
</html>

