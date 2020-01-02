<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전자결재</title>
<style type="text/css">
	.draft_div {
		height: 25px;
		font-size: 15px;
		margin-top: 10px;
	}
	.app_table {
		margin-left: auto;
		margin-right: auto;
	}
	th {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content" style="min-height: 34vw;" id="div_content">
	<table class="app_table">
		<tr>
			<td style="vertical-align: top;">
				<div style="background-color: silver; height: 60px; width: 200px; margin-right: 20px;" onclick="approval()">결재 양식</div>
				<div style="background-color: gray; height: 60px; width: 200px; margin-right: 20px;" onclick="myApproval()">나의 결재</div>
				<div style="background-color: red; height: 60px; width: 200px; margin-right: 20px;" onclick="grantApproval()">결재함</div>
			</td>
			<td>
				<div class="panel panel-default" style="width: 30vw; margin-left: 1vw;" id="list"></div>
				<div id="admin"></div>
				<nav class="text-center" id="paging"></nav>
<!-- 결재 양식 -->
<!-- 				<div id="approval"> -->
<!-- 					<div class="panel panel-default" style="width: 30vw; height: 33vw; margin-left: auto; margin-right: auto; overflow: auto;"> -->
<%-- 						<c:forEach var="draft" items="${draft}"> --%>
<%-- 							<div class="draft_div" id="draft" onclick="window.open('draftInfo?draft_no=${draft.draft_no}','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');"> --%>
<%-- 								<a href="#">${draft.draft_name}</a> --%>
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
<!-- 					</div> -->
<%-- 					<c:if test="${sessionEmp.emp_no == 'NOW0000001' }"> --%>
<!-- 						<div style="width: 30vw; margin-left: auto; margin-right: auto; text-align: center;"> -->
<!-- 							<input type="button" value="기안서 등록" id="draftFormInsert" onclick="draftFormInsert()"> -->
<!-- 						</div> -->
<%-- 					</c:if> --%>
<!-- 				</div> -->
<!-- <!-- 나의 결재 -->
<!-- 				<div id="myApproval"> -->
<!-- 					<div class="panel panel-default" style="width: 30vw; height: 33vw; margin-left: auto; margin-right: auto; overflow: auto;"> -->
<%-- 						<c:forEach var="approval" items="${approval}"> --%>
<%-- 							<div class="draft_div" id="approval" onclick="window.open('approval?app_no=${approval.app_no}','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');"> --%>
<%-- 								<a href="#">${approval.app_name}</a> --%>
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- <!-- 결재함 -->
<!-- 				<div id="grantApproval"> -->
<!-- 					<div class="panel panel-default" style="width: 30vw; height: 33vw; margin-left: auto; margin-right: auto; overflow: auto;"> -->
<%-- 						<c:forEach var="grant" items="${grant}"> --%>
<%-- 							<c:if test="${(grant.grant_state == '0' && grant.grant_emp_no1 == sessionEmp.emp_no) || (grant.grant_state == '1' && grant.grant_emp_no2 == sessionEmp.emp_no) || (grant.grant_state == '2' && grant.grant_emp_no3 == sessionEmp.emp_no) || (grant.grant_state == '3' && grant.grant_emp_no4 == sessionEmp.emp_no)}"> --%>
<%-- 								<div class="draft_div" id="grant" onclick="window.open('approval?app_no=${grant.app_no}','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');"> --%>
<%-- 									<a href="#">${grant.app_name}</a> --%>
<!-- 								</div> -->
<%-- 							</c:if> --%>
<%-- 						</c:forEach> --%>
<!-- 					</div> -->
<!-- 				</div> -->
			</td>
		</tr>
	</table>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	function draftFormInsert() {
		window.open('draftFormInsert','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');
	}
	
	approval();
	
	function approval() {
		$.ajax({
			type:"POST",
			url:"<c:url value='/approval/selectDraft'/>",
			dataType : "json",
			success: function(result){
				var str1 = "";
				var str2 = "";
				var str3 = "";
				
				str1 += "<table class='table table-striped table-bordered table-hover'>";
				str1 += "	<colgroup>";
				str1 += "		<col width='50%'>";
				str1 += "	</colgroup>";
				str1 += "	<tr class='text-center'>";
				str1 += "		<th>결재 양식</th>";
				str1 += "	</tr>";
				for(var i = 0; i < result.draftVO.length; i++) {
					str1 += "		<tr class='text-center'>";
					str1 += "			<td>";
					str1 += "				<a href='#'>";
					str1 += "					<span class='draft_div' id='draft' onclick=\"window.open('draftInfo?draft_no="+result.draftVO[i].draft_no+"','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');\">"+result.draftVO[i].draft_name+"</span>";
					str1 += "				</a>";
					str1 += "			</td>";
					str1 += "		</tr>";
				}
				str1 += "</table>";
				
				if("${sessionEmp.emp_no}" == 'NOW0000001') {
					str3 += "<div style='width: 30vw; margin-left: auto; margin-right: auto; text-align: center;'>";
					str3 += "	<input type='button' value='기안서 등록' id='draftFormInsert' onclick='draftFormInsert()'>";
					str3 += "</div>";
				}
				
				str2 += "<ul class='pagination'>";
				str2 += "<li><a href='?curPage="+(result.searchVO.curPage-1)+"'";
				str2 += "	aria-label='Previous'> <span aria-hidden='true'>&laquo;</span>";
				str2 += "</a></li>";
				
				for(var i = result.searchVO.startPage; i <= result.searchVO.endPage; i++) {
					if(i == result.searchVO.curPage) {
						str2 += "		<li class='active'><a href='#'>"+i+"</a></li>";
					}
					if(i != result.searchVO.curPage) {
						str2 += "		<li><a href='#' onclick='fn_go_page("+i+")'>"+i+"</a></li>";
					}
				}
				
				str2 += "<li><a href='?curPage="+(result.searchVO.curPage+1)+"' aria-label='Next'>";
				str2 += "		<span aria-hidden='true'>&raquo;</span>";
				str2 += "</a></li>";
				str2 += "</ul>";

				document.getElementById("list").innerHTML = str1;
				document.getElementById("paging").innerHTML = str2;
				document.getElementById("admin").innerHTML = str3;
			}
	    });
	}

	function myApproval() {
		$.ajax({
			type:"POST",
			url:"<c:url value='/approval/selectApproval'/>",
			dataType : "json",
			success: function(result){
				var str1 = "";
				var str2 = "";
				str1 += "<table class='table table-striped table-bordered table-hover'>";
				str1 += "	<colgroup>";
				str1 += "		<col width='50%'>";
				str1 += "		<col width='10%'>";
				str1 += "	</colgroup>";
				str1 += "	<tr class='text-center'>";
				str1 += "		<th>나의 결재</th>";
				str1 += "		<th>결재 상태</th>";
				str1 += "	</tr>";
				for(var i = 0; i < result.approvalVO.length; i++) {
					str1 += "		<tr class='text-center'>";
					str1 += "			<td>";
					str1 += "				<a href='#'>";
					str1 += "					<span class='draft_div' id='draft' onclick=\"window.open('approval?app_no="+result.approvalVO[i].app_no+"','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');\">"+result.approvalVO[i].app_name+"</span>";
					str1 += "				</a>";
					str1 += "			</td>";
					str1 += "			<td>";
					if(result.approvalVO[i].app_state == '1') str1 += "완료";
					else str1 += "진행중";
					str1 += "			</td>";
					str1 += "		</tr>";
				}
				str1 += "</table>";

				str2 += "<ul class='pagination'>";
				str2 += "<li><a href='?curPage="+(result.searchVO.curPage-1)+"'";
				str2 += "	aria-label='Previous'> <span aria-hidden='true'>&laquo;</span>";
				str2 += "</a></li>";
				
				for(var i = result.searchVO.startPage; i <= result.searchVO.endPage; i++) {
					if(i == result.searchVO.curPage) {
						str2 += "		<li class='active'><a href='#'>"+i+"</a></li>";
					}
					if(i != result.searchVO.curPage) {
						str2 += "		<li><a href='#' onclick='fn_go_page("+i+")'>"+i+"</a></li>";
					}
				}
				
				str2 += "<li><a href='?curPage="+(result.searchVO.curPage+1)+"' aria-label='Next'>";
				str2 += "		<span aria-hidden='true'>&raquo;</span>";
				str2 += "</a></li>";
				str2 += "</ul>";

				document.getElementById("list").innerHTML = str1;
				document.getElementById("paging").innerHTML = str2;
				document.getElementById("admin").innerHTML = "";
			}
	    });
	}

	function grantApproval() {
		$.ajax({
			type:"POST",
			url:"<c:url value='/approval/selectGrant'/>",
			dataType : "json",
			success: function(result){
				var str1 = "";
				var str2 = "";
				
				str1 += "<table class='table table-striped table-bordered table-hover'>";
				str1 += "	<colgroup>";
				str1 += "		<col width='50%'>";
				str1 += "	</colgroup>";
				str1 += "	<tr class='text-center'>";
				str1 += "		<th>결재함</th>";
				str1 += "	</tr>";
				for(var i = 0; i < result.grantVO.length; i++) {
					if((result.grantVO[i].grant_state == '0' && result.grantVO[i].grant_emp_no1 == "${sessionEmp.emp_no}") || (result.grantVO[i].grant_state == '1' && result.grantVO[i].grant_emp_no2 == "${sessionEmp.emp_no}") || (result.grantVO[i].grant_state == '2' && result.grantVO[i].grant_emp_no3 == "${sessionEmp.emp_no}") || (result.grantVO[i].grant_state == '3' && result.grantVO[i].grant_emp_no4 == "${sessionEmp.emp_no}")) {
					str1 += "		<tr class='text-center'>";
					str1 += "			<td>";
					str1 += "				<a href='#'>";
					str1 += "					<span class='draft_div' id='draft' onclick=\"window.open('approval?app_no="+result.grantVO[i].app_no+"','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');\">"+result.grantVO[i].app_name+"</span>";
					str1 += "				</a>";
					str1 += "			</td>";
					str1 += "		</tr>";
					}
				}
				str1 += "</table>";
				
				str2 += "<ul class='pagination'>";
				str2 += "<li><a href='?curPage="+(result.searchVO.curPage-1)+"'";
				str2 += "	aria-label='Previous'> <span aria-hidden='true'>&laquo;</span>";
				str2 += "</a></li>";
				
				for(var i = result.searchVO.startPage; i <= result.searchVO.endPage; i++) {
					if(i == result.searchVO.curPage) {
						str2 += "		<li class='active'><a href='#'>"+i+"</a></li>";
					}
					if(i != result.searchVO.curPage) {
						str2 += "		<li><a href='#' onclick='fn_go_page("+i+")'>"+i+"</a></li>";
					}
				}
				
				str2 += "<li><a href='?curPage="+(result.searchVO.curPage+1)+"' aria-label='Next'>";
				str2 += "		<span aria-hidden='true'>&raquo;</span>";
				str2 += "</a></li>";
				str2 += "</ul>";
				
				document.getElementById("list").innerHTML = str1;
				document.getElementById("paging").innerHTML = str2;
				document.getElementById("admin").innerHTML = "";
			}
	    });
	}
</script>
</html>
