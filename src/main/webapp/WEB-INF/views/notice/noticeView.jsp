<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/inc/common_header.jsp"%>
	<title>공지사항</title>
</head>
	<body>
	<div>
	<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>

	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
		
	<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
					
		
		<table class="table table-striped">
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col />
			</colgroup>
				<tr>
					<th>제목</th>
					<td>${notice.nt_title}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${notice.nt_hit}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${notice.nt_writer}</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td colspan="3">${notice.nt_content}</td>
				</tr>
		</table>
			
				<div class="row" align="center">
					<c:if test="${notice != null }">
							<a href="noticeList" class="btn btn-default btn-sm">목록</a>
						</c:if>	
							
						<c:if test="${sessionEmp.emp_no == 'NOW0000001'}">
							<a href="noticeEdit?nt_no=${notice.nt_no}"class="btn btn-primary btn-sm"> 
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 수정 </a>
						 <button href="#" onclick="deleteCheck(${notice.nt_no})" class="btn btn-default btn-sm" /> 삭제 </button> 
					</c:if>
					</div>
	</div>
	
	</body>
	
	<script type="text/javascript">
	function deleteCheck(nt_no){
		if(confirm("삭제 하시겠습니까?")){
			alert("삭제가 완료되었습니다");
			return location.href="noticeDelete?nt_no=" + nt_no;
		}else{
			alert("삭제가 취소되었습니다");
			return;
		}
	}
</script>
	
</html>

