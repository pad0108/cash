<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>modifyNotice</h1>
	<form method="post" action="/admin/modifyNotice">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="noticeId" value="${param.noticeId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="noticeContent" cols="30" rows="10" >${notice.noticeContent}</textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>