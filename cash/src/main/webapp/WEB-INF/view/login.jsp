<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="container">
		<h1 style="text-align:center;">공지사항</h1>
		<!-- 공지 -->
		<div>
			<table class="table table-hover" style="table-layout:fixed; width:100%;">
				<thead>
					<tr class="table-active">
						<th style="width:10%">번호</th>
						<th>제목</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td>${n.noticeId}</td>
							<td>${n.noticeTitle}</td>
							<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${n.noticeContent}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<h1 style="text-align:center;">로그인</h1>
		<form action="${pageContext.request.contextPath}/login" method="post">
			<table class="table table-borderless"style="width:100%;">
				<tr>
					<td>
						<div>
							<input type="text" name="id" class= "form-control"placeholder='아이디'>
						</div>	
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<input type="text" name="pw" class= "form-control" placeholder='비밀번호'>
						</div>	
					</td>
				</tr>
				<tr>
					<td><hr style="width:100%;"></td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<div>
							<button type="submit" class="btn btn-outline-success" style="width:200px; height:75px;" >로그인</button>
						</div>	
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>