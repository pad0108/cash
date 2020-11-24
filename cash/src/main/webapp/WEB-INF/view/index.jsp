<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
		<h1 style="text-align:center;">Home</h1>
		<!-- 공지 -->
		<div>
			<h3 style="text-align:center;">공지사항</h3> <a href="/admin/noticeList/1" class="btn btn-outline-primary btn-sm"style="float: right;">더보기</a>
		</div>
		<div>
			<table class="table table-hover" style="table-layout:fixed;  width:100%">
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
		<div>
			<h4 style="text-align:center;">최근 수입/지출 내역 요약</h4>
			<br>
			<br>
		</div>
		<!-- 수입 지출 카드 -->
		<div class="card-deck">
			<c:forEach var="io" items="${inOutList}">
				<div class="card bg-dark text-white">
					<div class="card-body text-center">
						<p class="card-text"style="font-weight:bold; font-size:20px;">날짜 : ${io["날짜"]}</p>
						<p class="card-text">수입 : ${io["수입"]}</p>
						<p class="card-text">지출 : ${io["지출"]}</p>
						<p class="card-text">합계 : ${io["합계"]}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>