<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="#">Cashbook Project</a>
	<ul class="navbar-nav">
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/index">Home</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1">월별 수입/지출</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/noticeList/1" >공지사항</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/cashbookList/1" >수집/지출표</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/logout" >로그아웃</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/totalOutbyYear.jsp" >chart</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/addMember" >사용자 추가</a></li>
		
	</ul>
</nav>