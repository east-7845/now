<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<head>

<style type="text/css">
.table.table-ellipsis tbody td 
{
	max-width :100px;
	overflow : hidden;
	text-overflow : ellipsis;
	white-space : nowrap;
}
</style>

<script type="text/javascript">

var fn_search_submit = function() {
	var f = document.forms["frm_noticeSearch"];
	f.submit();
}

var fn_submit_click = function(){	
	event.preventDefault(); // 이벤트 전파 방지
	var f = document.forms["frm_noticeSearch"];
	f.curPage.value = 1;
	fn_search_submit();
}

// 페이지 변경 후 서브밋 호출
var fn_go_page = function(p) {
	var f = document.forms["frm_noticeSearch"];
	f.curPage.value = p;
	fn_search_submit();
}

// 목록 갯수 변경 후 선택버튼 클릭 시 서브밋 호출
var fn_screen_size_change = function(){
	var f = document.forms["frm_notice_list"];
	var n = document.getElementById("searchNumber");
	f.setAttribute("action", value)
	f.screenListSize.value = n.value;
	fn_search_submit();
}

// 초기화 시 검색창 공백, 페이지 1로 되돌림
	var fn_search_reset=function(){
		var f = document.forms["frm_noticeSearch"];
		f.curPage.value = 1;
		f.searchType.value = "";
		f.searchWord.value = "";
	}

</script>

</head>
	<div>
	<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>

	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
	
	<body>
			<div class="panel panel-default"
			style="width: 60vw; margin-left:20vw;">

				<form name="frm_notice_list" action="" method="post" >
						<table class="table table-striped table-bordered table-ellipsis">
									<colgroup>
										<col width="5%" />
										<col width="60%" />
										<col width="30%" />
										<col width="20%" />
									</colgroup>
								
								<tr class="text-center">
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
								
								<c:forEach var="notice" items="${noticeList}">
									<tr class="text-center">
										<td>${notice.nt_no}</td>
										<td class="text-left">
												<a href="noticeView?nt_no=${notice.nt_no}">
															${notice.nt_title}
												</a>
										</td>
										<td>${notice.nt_writer}</td>
										<td>${notice.nt_reg_date}</td>
									</tr>
								</c:forEach>
						</table>
				</form>
					
			<div class="form-horizontal">
					<form name="frm_noticeSearch" action="noticeList">
							<input type="hidden" name="curPage" value="${searchVO.curPage}">		
							<input type="hidden" name="screenListSize" value="${searchVO.screenListSize}">	
									 <label class="col-sm-2 control-label">구분 </label> 
										 <div class="col-sm-2">
													<select name="searchType" class="form-control input-sm" >
															<option value=""> -- 전체 - - </option>
															<option value="T" ${searchVO.searchType=='T' ? 'selected="selected"' : '' }> 제목 </option>
															<option value="C" ${searchVO.searchType=='C' ? 'selected="selected"' : '' }> 내용 </option>
													</select>
											</div>
		
										<label class="col-sm-2 control-label"> 검색어 </label> 
											<div class="col-sm-3">
												<input type="text" name="searchWord" class="form-control input-sm" value="${searchVO.searchWord}">
											</div>
								
									 <div class="pull-left">
											<button type="button" class="btn btn-sm btn-default" onclick="fn_search_reset()">
											<span class="glyphicon glyphicon-refresh" aria-hidden="true"> </span> &nbsp;초기화 </button>
								
											<button type="button" class="btn btn-sm btn-primary" onclick="fn_submit_click()"> 
											<span class="glyphicon glyphicon-search" aria-hidden="true"> </span> &nbsp; 검색  </button>
					      	</div>
								  <c:if test="${sessionEmp.emp_no == 'NOW0000001'}">
										<div class="pull-right">
												<a href="noticeForm" class="btn btn-primary btn-sm"> 
														<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 글 작성
												</a>
										</div>
									</c:if>
					</form>
			</div>
	
					<nav class="text-center" >
					  <ul class="pagination">
					<!--  이전 페이지 -->
					    <li>
					    <a href="#" onclick="fn_go_page(${searchVO.startPage - 1})" aria-label="Previous">
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
						      <a href="#" onclick="fn_go_page(${searchVO.endPage + 1})" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
					    </li>
					  </ul>
					</nav>	
		</div>		
	</body>
</html>
