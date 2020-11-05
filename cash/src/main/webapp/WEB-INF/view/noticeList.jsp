<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항</h1>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_content</th>
					<th>notice_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>
							<a href="/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeId}</a>
							</td>
						<td>${n.noticeTitle}</td>
						<td>${n.noticeContent}</td>
						<td>${n.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/admin/addNotice">글 쓰기</a>
	</div>
	<div>
		<c:if test="${currentPage>1}">
			<a href="/admin/noticeList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:if test="${currentPage<lastPage}">
			<a href="/admin/noticeList?currentPage=${currentPage+1}">다음</a>
		</c:if>
	</div>
</body>
</html>