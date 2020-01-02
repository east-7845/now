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
	<div class="container_left">
		<%@include file="/WEB-INF/inc/now_left.jsp"%>
	</div>
	<div class="container_content">
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 10vw;     margin-top: 2vw;">
			<table class="table table-striped table-bordered table-ellipsis">
				<colgroup>
					<col width="10%%">
					<col width="50%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<tr class="text-center">
					<td>제목</td>
					<td colspan="3">${board.fr_title}</td>
				</tr>
				<tr class="text-center">
					<td>작성자</td>
					<td>${board.fr_parent_no}</td>
					<td>작성일</td>
					<td>${board.fr_reg_date}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<c:forEach var="f" items="${board.attaches}">
							<div>
								<a href="<c:url value='/attach/download/${f.fa_no}' />"
									target="_blank"> <span class="glyphicon glyphicon-save"
									aria-hidden="true"></span> ${f.fa_original_name}
								</a> Size : ${f.fa_fancy_size} Down : ${f.fa_down_cnt}
							</div>
						</c:forEach>
						<!-- <div class="form-inline">
							<input type="file" name="bo_files" class="form-control">
							<button type="button" class="btn_delete btn btn-sm">삭제</button>
						</div> -->
					</td>
				</tr>
				<tr class="text-center">
					<td>작성내용</td>
					<td colspan="3" class="text-left">${board.fr_content}</td>
				</tr>
			</table>
		</div>
		<div class="panel panel-default"
			style="width: 60vw; margin-left: 10vw;">
			<div class="panel-body form-horizontal">
				<div class="form-group">
					<a href="freeBoardList" class="btn btn-default btn-sm">회원 목록</a> <a
						href="freeBoardEdit?fr_no=${board.fr_no}"
						class="btn btn-primary btn-sm"> <span
						class="glyphicon glyphicon-plus" aria-hidden="true"> 수정</span>
					</a>
				</div>
			</div>
		</div>
		<div class="panel panel-default" style="width: 60vw; margin-left: 10vw;">
			<div class="panel-body form-horizontal">
				<div id="id_reply_list_area">
		
				</div>
			</div>
		</div>
		<div class="panel panel-default" style="width: 60vw; margin-left: 10vw;">
			<div class="panel-body form-horizontal">
				<form name="frm_reply" action="<c:url value='/reply/replyRegist'/>"
					method="post" onclick="return false;">
					<input type="hidden" name="re_parent_no" value="${board.fr_no}">
					<input type="hidden" name="re_mem_id" value="${board.fr_parent_no}">
					<input type="hidden" name="re_category" value="freeboard">
					<div class="form-group">
						<label class="col-sm-2 control-label">댓글</label>
						<div class="col-sm-8">
							<textarea rows="3" name="re_content" class="form-control"></textarea>
						</div>
						<div class="col-sm-2">
							<button type="button" id="btn_reply_regist"
								class="btn btn-sm btn-info">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%-- <div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div> --%>
	<script type="text/javascript">
		var parentTest ="";
		function updateBtn(re_no, fr_no){
			//parentTest = $(this);
			var replyParent = "";
			//var data_val = $("button[data-re-no]");
			//var data_val = $("button[data-re-no]").parent().parent();
			//alert("클릭이벤트");
			var reply = document.getElementsByName("btn_reply_delete");
			//var reply = $("button[name=btn_reply_delete]").parent().parent();
			for (var i = 0; i < reply.length; i++) {
				if(reply[i].getAttribute("data-re-no") == re_no){
				//if(reply[i].children[3].children[1].getAttribute("data-re-no") == re_no){
					
					//alert("i ="+i+ reply[i].parentNode.parentNode.children[1].children[0].value);
					replyParent = reply[i].parentNode.parentNode;
					//var replyParentText = reply[i].children[1].children[0].value;
					
				}
			}
			console.log("테스트");
			var text = $("textarea[name=re_contentCheck]").val();
			console.log(text);

// 			var replyParent = replyParent.children[1];
// 			var value5 = replyParent.children[1].children[0].value;
// 			var value1 = replyParent.children[1].children[0].innerText;
			//console.log("데이터  "+value5);
			$.ajax({
				type : "get", // 요청메소드
				data : {
					   "re_parent_no" : fr_no,
					   "re_no" : re_no ,
					   "re_content": text
					},
				url : "<c:url value='/reply/replyRegistUpdate'/>",
				dataType: "json",
				success:function(result){ // 성공
					//replyParent2.innerHTML = value5;
					replyParent.children[1].innerText = text;
					replyParent.children[3].children[0].removeAttribute("onclick");	// onclick 삭제.
					replyParent.children[3].children[0].setAttribute("name","btn_reply_edit");
					//replyParent.children[1].innerHTML = replyParent;
					
				},
				error:function(a,b,c){ // 통신 실패
					
				}
			});
		}
		var curPage = 1;
		var screenListSize = 10;
		// 페이지 로딩된 후
		$(document).ready(function(){
			var params = {};
			var p_parent = "";
			var edit_btn = "";
			
			
			// 댓글 리스트
			function fn_newReply(){
				params = {"curPage" : curPage,
						  "screentListSize" : screenListSize,
						  "re_category" : "freeboard",
						  "re_parent_no" : ${board.fr_no}
						 }
				var v_str =""
				params = $("form[name=frm_reply]").serialize();
				$.ajax({
					type : "GET", // 요청메소드
					data : params,
					url : "<c:url value='/reply/replyList'/>",
					dataType: "json",
					success:function(data){ // 성공
						
						if(data.result){
							
							$.each(data.data, function(index, item){
								v_str += "<div class='row'>";
								v_str += "<div class='col-sm-2'>"+ item.re_mem_name +"</div>"; 
								v_str += "<div class='col-sm-5'>"+ item.re_content +"</div>";
								v_str += "<div class='col-sm-2'>"+ item.re_reg_date+"</div>";
								v_str += "<div class='col-sm-3'>";
								//if(item.re_mem_id == '${sessionScope.LOGIN_INFO.mem_id}'){
									v_str += "<button name ='btn_reply_edit' type='button' class='btn btn-sm btn-info'>수정</button>";
									v_str += "<button name ='btn_reply_delete' type='button' data-re-no ='"+ item.re_no +"'  class='btn btn-sm btn-info'>삭제</button>";
								//}
								v_str += "</div>";
								v_str += "</div>";	
								
							});
							//$("#id_reply_list_area").append(v_str);
							$("#id_reply_list_area").html(v_str);
							
							// 댓글 수정 함수
							  $("button[name=btn_reply_edit]").click(function(){
								var parent0 = $(this).parent().parent(); // 현재 div class row 에 들어가 있는음
								var check = document.getElementsByName("re_contentCheck").length;
								if(check > 1){
									alert("다른 곳에 수정창이 열려있습니다.");
									return false;
								}else if( check == 1){
									
						        	return false;
								}
								var areatest = "<textarea rows='3' name='re_contentCheck' class='form-control'>"+ parent0.children()[1].innerText +"</textarea>";
						        parent0.children()[1].innerHTML = areatest;
						        p_parent = parent0;
						        console.log("댓글 텍스트" +parent0.children()[1].textContent );
						        
						        $(this).attr("onclick","updateBtn("+parseInt(parent0.children()[3].getElementsByTagName("button")[1].getAttribute("data-re-no"))+","+ ${board.fr_no} +")");
						        $(this).removeAttr("name");
						        //ajaxBtn(parent0,parseInt(parent0.children()[3].getElementsByTagName("button")[1].getAttribute("data-re-no")) );
							});  
						}
					},
					error:function(a,b,c){ // 통신 실패
						
					}
					
				});
			}
			
			// 댓글 등록
			$("#btn_reply_regist").click(function(){
				params = $("form[name=frm_reply]").serialize();
				$.ajax({
					type : "POST", // 요청메소드
					data : params,
					url : "<c:url value='/reply/replyRegist'/>",
					dataType: "json",
					success:function(result){ // 성공
						fn_newReply();
					},
					error:function(a,b,c){ // 통신 실패
						
					}
				});
			});
			
			fn_newReply();
		});
	</script>	
</body>

</html>




