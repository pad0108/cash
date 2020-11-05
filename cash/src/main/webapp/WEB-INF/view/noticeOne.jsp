<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>noticeOne</h1>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>${notice.noticeId}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${notice.noticeContent}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${notice.noticeDate}</td>
		</tr>
	</table>
	<table>
		<tr>
			<td><a href="/admin/noticeList">돌아가기</a></td>
			<td><a href="/admin/modifyNotice?noticeId=${notice.noticeId}">수정</a></td>
			<td><a href="/admin/removeNotice?noticeId=${notice.noticeId}">삭제</a></td>
		</tr>
	</table>
</body>
</html>