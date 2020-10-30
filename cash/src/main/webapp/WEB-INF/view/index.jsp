<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>index.jsp</title>
	</head>
	<body>
		<h1>index.jsp</h1>
		
		<h3>공지사항</h3>
		<table border="1">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${list}">
					<tr>
						<td>${notice.noticeId}</td>
						<td>${notice.noticeTitle}</td>
						<td>${notice.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>