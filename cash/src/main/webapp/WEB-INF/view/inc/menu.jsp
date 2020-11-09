<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="#">Cashbook Project</a>
	<ul class="navbar-nav">
		<li class="nav-item active"><a class="nav-link"
			href="/admin/index">Home</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="/admin/cashbookByMonth/-1/-1">월별 수입/지출</a></li>
			<li class="nav-item active"><a class="nav-link"
			href="/admin/noticeList/1" >공지사항</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="/admin/logout" >로그아웃</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="http://localhost:8080/cashStats.html" >다운로드</a></li>
	</ul>
</nav>