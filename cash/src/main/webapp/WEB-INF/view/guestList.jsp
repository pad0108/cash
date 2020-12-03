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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100&display=swap"
	rel="stylesheet">
<style type="text/css">
td {
	font-family: 'Noto Sans JP', sans-serif;
}

tr {
	font-family: 'Noto Sans JP', sans-serif;
}

button {
	font-family: 'Noto Sans JP', sans-serif;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		if($('#contenttext').val().length < 1){
			alert('밤명록을 입력해주세요');
			return;
		} else {
			$('#addContentForm').submit();
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
		<table class="table" style="width: 100%; text-align: center;'">
			<c:forEach var="g" items="${guestList}">
				<c:if test="${!empty g.guestContent}">
					<tr>
						<td style="width: 5%;" class="table-info">${g.guestId}</td>
					</tr>
					<tr>
						<td style="width: 5%;">${g.guestWriter}</td>
						<td style="width: 78%;">${g.guestContent}</td>
						<td style="width: 10%;">${g.guestDate}</td>
						<td style="width: 7%;"><a
							href="${pageContext.request.contextPath}/removeGuest/${g.guestId}"
							class="btn btn-sm btn-outline-dark">삭제</a></td>
					</tr>
				</c:if>
				<c:if test="${empty g.guestContent}">
					<tr>
						<td>현재 방명록이 없습니다.</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<div>
			<h2>방명록 쓰기</h2>
			<hr class="my-hr3">
		</div>
		<form id="addContentForm" action="${pageContext.request.contextPath}/addGuestbook" method="post">
			<table style="width:100%;">
				<tr>
					<td style="width:10%;">			
						<input type="text" name="guestWriter" id="WriterTxt" class="form-control form-control-sm" placeholder="이름" style="margin-right:10px;">
					</td> 
					<td style="width:90%;"><textarea id="contenttext" name="guestContent" rows="7" cols="50"
							class="form-control" style="resize: none;" placeholder="타인의 권리를 침해하거나 명예를 훼손하는 글은 운영원칙 및 관련 법률에 제재를 받을 수 있습니다.">
						</textarea>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td style="float:right">
						<button id="addBtn" type="submit" class="btn btn-outline-primary">입력</button>
					</td>	
				</tr>
			</table>
		</form>
	</div>
</body>
</html>