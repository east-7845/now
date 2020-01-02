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
<style type="text/css">
.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

@keyframes blink {
	from {color: white;}
	30%{color:yellow;}
	to {
		color: red;
		font-weight: bold;
	}	
}
</style>
<script type="text/javascript">
	// 폼 서브밋
	var fn_search_submit = function() {
		var f = document.forms["frm_boardSearch"];
		f.submit();
	}
	
	var fn_submit_click = function(ev){
		ev.preventDefault(); // 이벤트 전파 방지
		
		var f = document.forms["frm_boardSearch"];
		f.curPage.value = 1;
		fn_search_submit();
	}
	
	// 페이지 변경 후 서브밋 호출
	var fn_go_page = function(p) {
		var f = document.forms["frm_boardSearch"];
		f.curPage.value = p;
		fn_search_submit();
	}
	
	// 목록 갯수 변경 후 선택버튼 클릭시 서브밋 호출
	var fn_screen_size_change = function(){
		var f = document.forms["frm_boardSearch"];
		var n = document.getElementById("searchNumber");
		f.setAttribute("action", value);
		
		f.screenListSize.value = n.value;
		fn_search_submit();
	}
	
	// 초기화
	var fn_search_reset=function(){
		var f = document.forms["frm_boardSearch"];
		f.curPage.value = 1;
		f.searchType.value = "";
		f.searchWord.value = "";
		f.searchClass.value = "";
	}
	
	
	/* $(document).ready(function(){
		// 전체 체크 박스 클릭
		$("#id_board_check_all").click(function (){
			$("input[type=checkbox][name=bo_nos]").prop("checked", $(this).prop("checked") );	// jquery에 this이다.$9소냐
		});// $("#id_board_check_all").click
		
		// 선택 글 삭제 버튼 클릭
		$("#id_check_delete").click(function(){
			f = document.forms["frm_board_list"];
			//f.action = "/admin/board/checkedDelete"
			f.action = "<c:url value='/admin/board/checkedDelete' />";
			// c:url 태그를 사용하면  "/study4/admin/board/checkedDelete";
			f.submit();
			
		});// 선택 글 삭제 버튼 클릭
		
	}); */
	
</script>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
	<div class="container_content" style="min-height: 34vw;">
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 10vw;">
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="10%">
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
			style="width: 60vw; margin-left: 10vw;">
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
	<script type="text/javascript">
		document.forms["frm_boardSearch"].addEventListener("submit",fn_submit_click );
	</script>
</body>
</html>
<!-- 페이징 처리 참고 https://freehoon.tistory.com/112 -->



