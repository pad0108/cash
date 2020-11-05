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
	<h1>addNotice</h1>
	<form method="post" action="addNotice">
		<table border="1">
			<tr>
				<td>notice_title</td>
				<td>
					<input type="text" name="noticeTitle">
				</td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><textarea name="noticeContent" cols="30" rows="10"></textarea></td>
			</tr>
		</table>
		<button type="submit">공지사항 입력</button>
	</form>
</body>
</html>