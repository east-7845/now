<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>myPage</title>
<style type="text/css">
	.table-size {
		margin-left: auto;
		margin-right: auto;
		width: 50%;
	}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_roadAddress").value = roadAddr+extraRoadAddr;
							document.getElementById("sample4_detailAddress").value = '';
						} else {
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_detailAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} 
					}
				}).open();
	}
</script>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/now_top.jsp"%>
	</div>
	<div class="container_content">
		<form:form action="myPageModify" method="post" commandName="employee">
			<table class="table table-striped table-bordered table-ellipsis table-size">
				<tr>
					<td>사원 번호</td>
					<td>
						${employee.emp_no }
						<form:hidden path="emp_no"/>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						${employee.emp_name }
					</td>
				</tr>
				<tr>
					<td>ID</td>
					<td>
						<c:if test="${employee.emp_id == null }">
							<form:input path="emp_id"/>
						</c:if>
						<c:if test="${employee.emp_id != null }">
							${employee.emp_id }
						</c:if>
					</td>
				</tr>
				<tr>
					<td>주민등록번호</td>
					<td>
						<form:input path="emp_regno1"/> - <form:input path="emp_regno2"/>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="sample4_postcode" placeholder="우편번호" name="emp_zip" value="${employee.emp_zip }" readonly>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="emp_add1" value="${employee.emp_add1 }" readonly>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="emp_add2" value="${employee.emp_add2 }">
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<form:input path="emp_hp"/>
					</td>
				</tr>
				<tr>
					<td>비상연락망</td>
					<td>
						<form:input path="emp_hp_sub"/>
					</td>
				</tr>
				<tr>
					<td>메일</td>
					<td>
						<form:input path="emp_mail"/>
					</td>
				</tr>
				<tr>
					<td>은행명</td>
					<td>
						<form:input path="emp_bankname"/>
					</td>
				</tr>
				<tr>
					<td>계좌번호</td>
					<td>
						<form:input path="emp_banknum"/>
					</td>
				</tr>
				<tr>
					<td>연봉</td>
					<td>${employee.emp_salary }</td>
				</tr>
				<tr>
					<td>연차</td>
					<td>${employee.emp_vacation }</td>
				</tr>
				<tr>
					<td>직급</td>
					<td>${employee.emp_department }</td>
				</tr>
				<tr>
					<td>입사일</td>
					<td>${employee.emp_hiredate }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정완료"></td>
				</tr>
			</table>
		</form:form>
	</div>
	<div class="container_footer">
		<%@include file="/WEB-INF/inc/now_footer.jsp"%>
	</div>
</body>
</html>
