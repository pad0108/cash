<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div class="container">
		<h1>noticeOne</h1>
		<table class="table">
			<tr>
				<td>번호 : ${notice.noticeId} </td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td style="text-align:right;"colspan="2">${notice.noticeDate}
					<br>
					<a href="/admin/modifyNotice/${notice.noticeId}" class="btn btn-outline-dark">수정</a>
					<a href="/admin/removeNotice/${notice.noticeId}" class="btn btn-outline-dark">삭제</a>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea class="form-control" rows="10" readonly="readonly">${notice.noticeContent}
					</textarea>
				</td>
			</tr>
		</table>
		<div>
			<a href="/admin/noticeList" class="btn btn-secondary" style="float: right;">돌아가기</a>
		</div>
	</div>
</body>
</html>