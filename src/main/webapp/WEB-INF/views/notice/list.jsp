<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>타이틀 입력</title>
<script type="text/javascript">

	//  폼 서브밋
	var fn_search_submit = function() {
		 	var f = document.forms["frm_boardSearch"];
		 	f.submit();
	}
	
	// 페이지 변 경 후 서브밋 호출
	var fn_go_page = function(p){
	 	var f = document.forms["frm_boardSearch"];
	 	f.curPage.value= p;
	 	// fn_search_submit();
	}
	
	// 목록 갯수 변경 후 선택버튼 클릭 시  서브밋 호출
	var fn_screen_size_change = function() {
		var f = document.forms["frm_boardSearch"];
		//  값 설정을 알아서 
		// f.screenListSize.value="";
	 	// fn_search_submit();
	}
	
	// 초기화
	var fn_search_reset = function() {
	 	var f = document.forms["frm_boardSearch"];
	 	f.curPage = 1; 
	 	f.searchType.value = "";
	 	f.searchWord.value = "";
	 	f.searchClass.value= "";
	}

	$(document).ready(function(){
		//  전체 체크박스 클릭
		$("#id_board_check_all").click(function(){
			$("input[type=checkbox][name=bo_nos]").prop("checked", $(this).prop("checked"));
				});	// $("id_check_delete").click
			
				// 선택 글 삭제 버튼 클릭
			$("#id_check_delete").click(function(){
				f= document.forms["frm_board_list"];
				f.action = "<c:url value='/admin/board/checkedDelete' />";
				f.submit();
			
				});	// 선택 글 삭제 버튼 클릭
			
	});
	

</script>
<style type="text/css">
.table.table-ellipsis tbody td 
{
	max-width :100px;
	overflow : hidden;
	text-overflow : ellipsis;
	white-space : nowrap;
}

</style>


</head>

<body>
	<div class="container">
<%-- 		<%@include file="/WEB-INF/inc/top_menu.jsp"%> --%>
		<div class="page-header">
			<h3>자유 게시판 목록</h3>
		</div>

		<div class="panel panel-default">

					
					<form name="frm_board_list" action="" method="post">
						<table class="table table-striped table-bordered table-ellipsis">
							<colgroup>
									<col width="5%" />
									<col width="7%" />
									<col />
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
							</colgroup>
							<tr>
							<tr class="text-center">
							  <th class="text-center"><input type="checkbox" id="id_board_check_all"> </th>
								<th>no</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
							<c:forEach var="notice" items="${noticeList}">
								<tr class="text-center">
										<td><input type="checkbox" name="bo_nos" value="${notice.nt_no}"> </td>
										<td>${notice.nt_no}</td>
											<td class="text-left"><a href="boardView.do?bo_no=${notice.nt_no}">
													${notice.nt_title}
												</a>
											</td>

											<td>${notice.nt_writer}</td>
											<td>${notice.nt_reg_date}</td>
											<td>${notice.nt_hit}</td>
								</tr>
							</c:forEach>
						</table>
						</form>
		</div>
		<nav class="text-center">
		  <ul class="pagination">
		<!--  이전 페이지 -->
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		<!--  페이징 처리  -->
				<c:forEach var="i" begin="${searchVO.startPage}" end="${searchVO.endPage}">
						<c:if test="${i == searchVO.curPage}">
							<li class="active"><a href="#">${i}</a></li>
						</c:if>
						
						<c:if test="${i != searchVO.curPage}">
							<li><a href="#" onclick="fn_go_page(${i})">${i}</a></li>
						</c:if>
				</c:forEach>
				
				
		    
		<!-- 다음 페이지  -->
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>	
		
	</div>
</body>
</html>
