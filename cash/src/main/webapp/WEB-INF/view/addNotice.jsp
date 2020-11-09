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
	<div class="container">
		<h1>addNotice</h1>
		<form method="post" action="addNotice">
			<table class="table">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="noticeTitle" class="form-control">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="noticeContent" cols="50" rows="10" class="form-control"></textarea></td>
				</tr>
			</table>
			<button type="submit" style="float: right;" class ="btn btn-outline-primary">공지사항 입력</button>
		</form>
		<div>
			<a href="/admin/noticeList" class="btn btn-secondary" style="float: right;">돌아가기</a>
		</div>
	</div>
</body>
</html>