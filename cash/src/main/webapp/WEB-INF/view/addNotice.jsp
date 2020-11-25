<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 구글 css 폰트 숫자 -->
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
		let html = '<div><input type="file" name="noticefileList" class="noticefileList"></div>';
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	})

	$('#submitBtn').click(function(){
		let ck = true;
		$('.noticefile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 있습니다');
		} else {
			$('#addnoticeForm').submit();
		}
	});
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
		<h1>addNotice</h1>
		<form id="addnoticeForm"method="post" action="${pageContext.request.contextPath}/addNotice" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="noticeTitle" class="form-control">
					</td>
				</tr>
				<tr>
				<td>파일 첨부</td>
				<td>
					<div>
						<button type="button" id="addBtn" class="btn btn-outline-info">파일추가</button>
						<button type="button" id="delBtn" class="btn btn-outline-dark">파일삭제</button>
					</div>
					<div id="fileinput">
					</div>
				<tr>
					<td>내용</td>
					<td><textarea name="noticeContent" cols="50" rows="10" class="form-control"></textarea></td>
				</tr>
			</table>
			<button type="submit" id="submitBtn" style="float: right;" class ="btn btn-outline-primary">공지사항 입력</button>
		</form>
		<div>
			<a href="${pageContext.request.contextPath}/admin/noticeList/1" class="btn btn-secondary" style="float: right;">돌아가기</a>
		</div>
	</div>
</body>
</html>