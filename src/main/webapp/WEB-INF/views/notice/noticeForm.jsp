<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
	<%@include file="/WEB-INF/inc/now_top.jsp"%>
<head>

</head>
<body>
<div class="page-header">
<h3>글작성</h3>
</div>
<form action="boardRegist.do" method="post">
		<table class="table">
				<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col  />
				</colgroup>
		<tr>
			<th>글제목</th>
			<td colspan="3"><input type="text" name="nt_title" value="${notice.nt_title}">
			<span>${errors.nt_title}</span>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="nt_writer" value="${notice.nt_writer}">
				<span>${errors.nt_writer}</span>
			</td>
			<th>패스워드 </th>
			<td><input type="password" name="nt_pass" value=""
			           placeholder="수정 및 삭제시 필요">
			    <span>${errors.bo_pass}</span>
			</td>
		</tr>
		<tr>
			<th>분류</th>
			<td colspan="3">
				<select name="bo_class">
					<option value="" >게시물 분류를 선택해 주세요 </option>
						<c:forEach var="code" items="${bcList}">
							<option value="${code.com_cd}">${code.com_nm}</option>
						</c:forEach>	
				</select>
				<span>${errors.bo_class}</span>
			</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">
				<textarea rows="10" cols="60" name="bo_content">${notice.nt_content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<a href="noticeList.jsp" class="btn btn-sm btn-default">글목록</a>
				<button type="submit" class="btn btn-sm btn-success">등록</button>
		</td>
		</tr>
	</table>
</form>

		<div class="container_footer">
				<%@include file="/WEB-INF/inc/now_footer.jsp"%>
		</div>
</body>
</html>
