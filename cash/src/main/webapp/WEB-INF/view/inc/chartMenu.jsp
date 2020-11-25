<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav  class="navbar navbar-expand-sm bg-secondary navbar-dark">
<a class="navbar-brand" href="#">연도별</a>
	<ul class="navbar-nav">
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/totalOutbyYear.jsp">지출 합계</a></li>
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/totalComebyYear.jsp">수입 합계</a></li>
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/avgOutbyYear.jsp">지출 평균</a></li>
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/avgComebyYear.jsp">수입 평균</a></li>
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/totalIncomeCompare.jsp">수입 비교</a></li>
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/minMaxIncome.jsp">최대 최소 수입액</a></li>
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/minMaxOut.jsp">최대 최소 지출액</a></li>
		<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/totalOutCompare.jsp">지출 비교</a></li>
	</ul>
</nav>