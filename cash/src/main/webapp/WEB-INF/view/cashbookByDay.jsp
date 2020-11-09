<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>cashbookListByDay</h1>
	<div>
		<a href="/admin/cashbookByDay?target=pre&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">이전</a>
		${currentYear}년 ${currentMonth}월 ${currentDay}일
		<a href="/admin/cashbookByDay?target=next&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">다음</a>
	</div>
	<a href="/admin/addCashbook?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">수입/지출 입력</a>
	<table border="1">
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
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
						<td><a href="/admin/modifyCashbook?cashbookId=${c.cashbookId}">수정</a></td>
						<td><a href="/admin/removeCashbook?cashbookId=${c.cashbookId}">삭제</a></td>
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
</body>
</html>