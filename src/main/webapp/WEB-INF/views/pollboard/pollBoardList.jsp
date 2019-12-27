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
<title>자유게시판</title>

</head>
<body>
	<!-- header -->
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div> <!-- header end -->
	<div class="container_content"> <!-- 게시글 container  -->
			<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
		<table class="table table-striped table-bordered table-hover">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="15%">
				<col />
				<col width="15%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<tr class="text-center">
				<th class="text-center">
					<input type="checkbox" id="id_board_check_all">
				</th>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>상태</th>
				<th>조회수</th>
			</tr>
		<!-- pollBoardList(게시글)길이만큼 c:forEach로 반복해서 List 불러오기 -->
			<c:forEach var="board" items="${pollBoardList}">
				<tr class="text-center">
					<td>
						<input type="checkbox" name="bo_nos" value="${board.po_no}">
					</td>
					<td>${board.po_no}</td>
					<td>${board.po_topic}</td>
					<!-- a태그로 제목 클릭시 해당글로 이동 -->
					<td class="text-left"><a href="pollBoardView?po_no=${board.po_no}">${board.po_title}</a></td>
					<td>${board.po_writer}</td>
					<td>${board.po_comp_yn}</td>
					<td>${board.po_hit}</td>
				</tr>
			</c:forEach>

		</table>
		<div class="pull-right">
			<a href="pollBoardForm" class="btn btn-primary btn-sm"> <span
				class="glyphicon glyphicon-plus" aria-hidden="true"></span> 글 작성
			</a>
    	    <a href="#" onclick="deleteCheck(${board.po_no})"
				class="btn btn-sm btn-danger">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					&nbsp;&nbsp;선택 삭제
			</a>
		</div>
	</div> <!-- 게시글 container end -->
	<!-- 페이징  -->
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 페이지  -->
				<li><a href="?curPage=${searchVO.curPage-1 }"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<!-- 페이징  -->
				<c:forEach var="i" begin="${searchVO.startPage}"
					end="${searchVO.endPage}">
					<c:if test="${i ==  searchVO.curPage}">
						<li class="active"><a href="#">${i}</a></li>
					</c:if>
					<c:if test="${i !=  searchVO.curPage}">
						<li><a href="#" onclick="fn_go_page(${i})">${i}</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지  -->
				<li><a href="?curPage=${searchVO.curPage+1 }" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
		</div>
	<!-- footer -->
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div> <!-- footer end -->
	
</body>
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




