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
			<form:form action="approvalInsert">
				<table border="1">
					<tr>
						<td colspan="2">${draft.draft_name }</td>
						<td colspan="2" rowspan="2">
							<table id="tableId" border="1" style="width: 100%;">
								<tr>
									<td class="draft"></td>
									<td class="draft"></td>
									<td class="draft"></td>
									<td class="draft"></td>
								</tr>
								<tr>
									<td><input type="hidden" id="emp_no0" name="grant_emp_no1"></td>
									<td><input type="hidden" id="emp_no1" name="grant_emp_no2"></td>
									<td><input type="hidden" id="emp_no2" name="grant_emp_no3"></td>
									<td><input type="hidden" id="emp_no3" name="grant_emp_no4"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>기안자 명</td>
						<td>${sessionEmp.emp_name }</td>
					</tr>
					<tr>
						<td>기안 제목</td>
						<td colspan="3"><input type="text" style="width: 100%;" name="app_name"></td>
					</tr>
					<tr>
						<td>결재자</td>
						<td colspan="3"><input type="text" id="grant" style="width: 88%;"><input type="button" value="버튼" onclick="window.open('grantEmployee','grantEmployee','width=500,height=450,location=no,status=no,scrollbars=yes')"></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="" cols="" class="form-control" id="id_content" name="app_content">${draft.draft_content }</textarea></td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="submit" value="결재" id="btnSubmit">
							<input type="hidden" name="app_draft_no" value="${draft.draft_no }">
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
	
	function textInput(emp_no, emp_name, com_name) {
		var grant = document.getElementById("grant");
		var draft = document.getElementsByClassName("draft");
		
		if(grant.value == "") grant.value += emp_name + " " + com_name;
		else grant.value += ", " + emp_name + " " + com_name;
		

		for(var i = 0; i < draft.length; i++) {
			if(draft[i].innerHTML == "") {
				draft[i].innerHTML = emp_name + " " + com_name;
				document.getElementById("emp_no"+i).value = emp_no;
				return;
			}
		}
	}
	
	var btnSubmit = document.getElementById("btnSubmit");
// 	btnSubmit.click(function() {
// 		alert("d");
// 		close;
// 	})
	
	

</script>
</html>

