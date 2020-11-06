<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
	<h1>modifyCashbook</h1>
	<form method="post" action="/admin/modifyCashbook">
		<table border="1">
			<tr>	
				<td>cashbook_id</td>
				<td><input type="text" name="cashbookId" value="${cashbook.cashbookId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>cashbook_date</td>
				<td>
					<input type="text" name="cashbookDate" value="${cashbook.cashbookDate}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
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
				<td>category_name</td>
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
				<td>cashbook_price</td>
				<td>
					<input type="text" name="cashbookPrice" value="${cashbook.cashbookPrice}">
				</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>
					<input type="text" name="cashbookContent" value="${cashbook.cashbookContent}">
				</td>
			</tr>
		</table>
		<div>
			<button type="submit">입력</button>
		</div>
	</form>
</body>
</html>