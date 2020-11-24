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
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
		<h1>noticeOne</h1>
		<div>
			<a href="/admin/modifyNotice/${notice.noticeId}" class="btn btn-outline-info"style="float: right;">수정</a>
			<a href="/admin/removeNotice/${notice.noticeId}" class="btn btn-dark"  style="float: right;margin-right:5px;">삭제</a>
		</div>
		<table class="table">
			<tr>
				<td>번호 : ${notice.noticeId} </td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td style="text-align:right;"colspan="2">${notice.noticeDate}	
				</td>
			</tr>
			<tr>
			<c:forEach var="nf" items="${notice.noticefileList}">
				<td colspan="2" style="text-align:right;">
					<a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a>
				</td>		
			</c:forEach>
		</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea class="form-control" rows="10" readonly="readonly" style="resize:none;">${notice.noticeContent}
					</textarea>
				</td>
			</tr>
		</table>
		<div>
			
			<a href="/admin/noticeList/1" class="btn btn-secondary" style="float: right;">돌아가기</a>
		</div>
	</div>
</body>
</html>