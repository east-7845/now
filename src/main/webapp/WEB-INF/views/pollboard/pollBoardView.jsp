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
<title>부트스트랩 101 템플릿</title>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">
			<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
		<table class="table table-bordered">
			<colgroup>
				<col width="15%" />
				<col />
				<col width="15%" />
				<col />
			</colgroup>
			<tr>
				<th>분류</th>
				<td>${pollBoard.po_topic}</td>
				<th>그룹</th>
				<td>${pollBoard.po_group}</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<!-- PollBoard : Controller에서 준 이름 -->
				<td colspan="3">${pollBoard.po_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${pollBoard.po_writer}</td>
				<th>등록일</th>
				<td>${pollBoard.po_reg_date}</td>
			</tr>
			<tr>
				<th>만료일</th>
				<td>${pollBoard.po_due_date}</td>
				<th>만료여부</th>
				<td>${pollBoard.po_vaild_yn}</td>
			</tr>
			<tr>
				<th>글내용</th>
				<pre>
					<td colspan="3">${pollBoard.po_content}</td>
				</pre>
			</tr>
			<tr>
				<th>투표 결과</th>
				<td>${pollBoard.po_result}</td>
			</tr>
		</table>
		<div class="row">
			<a href="pollBoardList" class="btn btn-default btn-sm">글 목록</a> 
			 <a href="pollBoardEdit?po_no=${pollBoard.po_no}"
				class="btn btn-sm btn-info"> <span
					class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					&nbsp;&nbsp;수 정
			</a>
    	    <a href="#" onclick="deleteCheck(${pollBoard.po_no})"
				class="btn btn-sm btn-danger">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					&nbsp;&nbsp;삭제
			</a>
		</div>
		</div>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
<!-- 글삭제 check 부분 -->
<script type="text/javascript">
	function deleteCheck(po_no){
		if(confirm("삭제 하시겠습니까?")){
			alert("삭제가 완료되었습니다");
			return location.href="pollBoardDelete?po_no=" + po_no;
		}else{
			alert("삭제가 취소되었습니다");
			return;
		}
	}
</script>
</html>




