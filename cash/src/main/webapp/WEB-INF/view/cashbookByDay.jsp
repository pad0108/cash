<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 구글 css 폰트 숫자 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100&display=swap" rel="stylesheet">
<style type="text/css">
td{
	font-family: 'Noto Sans JP', sans-serif;
}
tr{
	font-family: 'Noto Sans JP', sans-serif;
}
button{
	font-family: 'Noto Sans JP', sans-serif;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
	<div style="text-align:center; margin-top:20px;">
		<!--  <a href="/admin/cashbookByDay?target=pre&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">이전</a>-->
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}" class="btn btn-outline-info">이전</a>
		${currentYear}년 ${currentMonth}월 ${currentDay}일
		<!--<a href="/admin/cashbookByDay?target=next&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">다음</a> -->
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}" class="btn btn-outline-info">이후</a>
	</div>
	<a href="${pageContext.request.contextPath}/admin/addCashbook/now/${currentYear}/${currentMonth}/${currentDay}" class="btn btn-primary" style="float: right; margin-bottom:10px; margin-right:10px;">추가</a>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>태그</th>
				<th>가격</th>
				<th>내역</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty cashbookList != null}">
				<c:forEach var="c" items="${cashbookList}">
					<tr>
						<td>${c.cashbookId}</td>
						<td>${c.cashbookKind}</td>
						<td>${c.categoryName}</td>
						<td>${c.cashbookPrice}</td>
						<td>${c.cashbookContent}</td>
						<td><a href="${pageContext.request.contextPath}/admin/modifyCashbook/${c.cashbookId}">수정</a></td>
						<td><a href="${pageContext.request.contextPath}/admin/removeCashbook/${c.cashbookId}">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty cashbookList}">
				<tr>
					<td colspan="7" style="text-align:center;">등록된 수입/지출이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	</div>
</body>
</html>