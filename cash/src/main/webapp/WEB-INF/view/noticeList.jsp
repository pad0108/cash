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
		<h1>공지사항</h1>
		<div>
			<a href="/admin/addNotice" class="btn btn-primary" style="float: right;">글쓰기</a>
		</div>
		<div>
			<table class="table table-hover" style="table-layout:fixed; width:100%;">
				<thead>
					<tr class="table-active">
						<th style="width:10%">번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td>
								<a href="/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeId}</a>
								</td>
							<td>${n.noticeTitle}</td>
							<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${n.noticeContent}</td>
							<td>${n.noticeDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="text-align:center;">
			<c:if test="${currentPage>1}">
				<a href="/admin/noticeList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<c:if test="${currentPage<lastPage}">
				<a href="/admin/noticeList?currentPage=${currentPage+1}">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>