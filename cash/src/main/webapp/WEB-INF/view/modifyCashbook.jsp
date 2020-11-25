<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 구글 css 폰트 -->
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
	<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
	<div class="container">
	<form method="post" action="${pageContext.request.contextPath}/admin/modifyCashbook">
		<table class="table">
			<tr>	
				<td>번호</td>
				<td><input type="text" name="cashbookId" value="${cashbook.cashbookId}" readonly="readonly" class="form-control-plaintext"></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>
					<input type="text" name="cashbookDate" value="${cashbook.cashbookDate}" readonly="readonly" class="form-control-plaintext">
				</td>
			</tr>
			<tr>
				<td>분류</td>
				<td>
					<c:if test="${cashbook.cashbookKind == '수입'}">
						<input type="radio" name="cashbookKind" value="수입" checked="checked">수입
						<input type="radio" name="cashbookKind" value="지출">지출
					</c:if>
					<c:if test="${cashbook.cashbookKind == '지출'}">
						<input type="radio" name="cashbookKind" value="수입">수입
						<input type="radio" name="cashbookKind" value="지출" checked="checked">지출
					</c:if>
				</td>
			</tr>
			<tr>
				<td>태그</td>
				<td>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<c:if test="${c.categoryName == cashbook.categoryName}">
								<option value="${c.categoryName}" selected="selected">${c.categoryName}</option>
							</c:if>
							<c:if test="${c.categoryName != cashbook.categoryName}">
								<option value="${c.categoryName}">${c.categoryName}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<input type="text" name="cashbookPrice" value="${cashbook.cashbookPrice}">
				</td>
			</tr>
			<tr>
				<td>내역</td>
				<td>
					<input type="text" name="cashbookContent" value="${cashbook.cashbookContent}">
				</td>
			</tr>
		</table>
		<div>
			<button type="submit" class="btn btn-primary" style="float: right;">입력</button>
		</div>
	</form>
	</div>
</body>
</html>