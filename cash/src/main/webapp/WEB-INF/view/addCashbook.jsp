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
	<h2>내역 추가</h2>
	<form method="post" action="${pageContext.request.contextPath}/addCashbook">
		<table class="table">
			<tr>
				<td>날짜</td>
				<td>
					<input type="text" name="cashbookDate" value="${currentYear}-${currentMonth}-${currentDay}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>종류</td>
				<td><input type="radio" name="cashbookKind" value="수입">수입
					<input type="radio" name="cashbookKind" value="지출">지출</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>금액</td>
				<td>
					<input type="text" name="cashbookPrice">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<input type="text" name="cashbookContent">
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-outline-info" style="float:right;">수입/지출 입력</button>
	</form>
	</div>
</body>
</html>