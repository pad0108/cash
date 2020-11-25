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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		f($('#commenttext').val().length < 1){
			alert('댓글을 입력해주세요');
			return;
		} else {
			$('#addCommentForm').submit();
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
		<h1>상세보기</h1>
		<div>
			<a href="${pageContext.request.contextPath}/admin/noticeList/1" class="btn btn-dark" style="float:left;">뒤로가기</a>
			<a href="${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}" class="btn btn-outline-info"style="float: right;">수정</a>
			<a href="${pageContext.request.contextPath}/admin/removeNotice/${notice.noticeId}" class="btn btn-dark"  style="float: right;margin-right:5px;">삭제</a>
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
				<td colspan="2" style="text-align:right;">
				<c:forEach var="nf" items="${notice.noticefileList}">
					<a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a><br>
				</c:forEach>
				</td>			
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
		<h2>댓글</h2>
		<hr class="my-hr3">
	</div>
	<form id="addCommentForm" action="${pageContext.request.contextPath}/addComment/${noticeId}" method="post">
		<input type="hidden" name="noticeId" value="${notice.noticeId}">
		<textarea id="commenttext" name="commentContent" rows="7" cols="50"class="form-control" style="resize: none;"></textarea>
		<div style="text-align:right; margin-top:10px; margin-bottom:10px;">
		<button id="addBtn"type="submit" class="btn btn-outline-primary">댓글 입력</button>
		</div>
	</form>
	<table class="table" style="width:100%; text-align:center;'">
		<c:forEach var="c" items="${notice.commentList}">
			<c:if test="${!empty c.commentContent}">
				<tr>
					<td style="width:5%;">
						${c.commentId}
					</td>
					<td style="width:78%;">
						${c.commentContent}
					</td>
					<td style="width:10%;">
						${c.commentDate}
					</td>
					<td style="width:7%;">
						<a href="${pageContext.request.contextPath}/removeComment/${c.commentId}/${c.noticeId}"class="btn btn-sm btn-outline-dark">삭제</a>
					</td>			
				</tr>
			</c:if>
			<c:if test="${empty c.commentContent}">
				<tr>
					<td>
						현재 댓글이 없습니다.
					</td>		
				</tr>
			</c:if>
		</c:forEach>
	</table>
	</div>
</body>
</html>