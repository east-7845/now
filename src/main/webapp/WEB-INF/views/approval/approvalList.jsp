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

</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content" style="min-height: 34vw;">
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="10%%">
					<col width="50%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<tr class="text-center">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="board" items="${freeBoardList}">
					<tr class="text-center">
						<td>${board.fr_no}</td>
						<td><a href="freeBoardView?fr_no=${board.fr_no}">${board.fr_title}</a>
							<span class="hit">hit!</span></td>
						<td>${board.fr_parent_no}</td>
						<td>${board.fr_reg_date}</td>
						<td>${board.fr_hit}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
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
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 20vw;">
			<div class="panel-body form-horizontal">
				<form name="frm_boardSearch" action="freeBoardList"
					onsubmit="return false;" style="text-align: center;">
					<input type="hidden" name="curPage" value="${searchVO.curPage}">
					<input type="hidden" name="screenListSize"
						value="${searchVO.screenListSize}">

					<div class="form-group">
						<label class="col-sm-2 control-label" style="width: auto;">구분 : </label>
						<div class="col-sm-3">
							<select name="searchType" class="form-control">
								<option value="">-- 전체 --</option>
								<option value="T"
									${searchVO.searchType = 'T' ? 'selected = "selected"' : '' }>제목</option>
								<option value="W"
									${searchVO.searchType = 'W' ? 'selected = "selected"' : '' }>작성자</option>
								<option value="C"
									${searchVO.searchType = 'C' ? 'selected = "selected"' : '' }>내용</option>
							</select>
						</div>
						<label class="col-sm-2 control-label" style="width: auto;">검색어 : </label>

						<div class="col-sm-3">
							<input type="text" name="searchWord" class="form-control"
								value="${searchVO.searchWord}" style="">
						</div>
						<div style="display: inline-block;">
							<button type="button" class="btn btn-sm btn-primary"
								onclick="fn_search_reset()">초기화</button>
						</div>
						<div style="display: inline-block;">
							<button type="submit" class="btn btn-sm btn-primary">검색</button>
						</div>
						<div style="display: inline-block;">
							<a href="freeBoardForm" class="btn btn-primary btn-sm"> <span
								class="glyphicon glyphicon-plus" aria-hidden="true">글작성</span></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- container_content -->
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
	<script type="text/javascript">
		document.forms["frm_boardSearch"].addEventListener("submit",fn_submit_click );
	</script>
</body>
</html>
<!-- 페이징 처리 참고 https://freehoon.tistory.com/112 -->



