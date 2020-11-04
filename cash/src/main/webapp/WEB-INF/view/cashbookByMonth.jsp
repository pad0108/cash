<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style type="text/css">
.sunday {
	color: #FF0000;
}
</style>
</head>
<body>
	<h1>index.jsp</h1>

	<h3>공지사항</h3>
	<table border="1">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${notice.noticeId}</td>
					<td>${notice.noticeTitle}</td>
					<td>${notice.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 다이어리 -->
	<div>${month}월 수입 합계 : ${sumIn}</div>
	<div>${month}월 지출 합계 : ${sumOut}</div>
	<h3>
		<a
			href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1}">[이전
			달]</a> ${currentYear}년 ${currentMonth}월 <a
			href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1}">[다음달
			달]</a>
	</h3>
	<div>
		<table border="1" width="100%">
			<thead>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}"
						step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0}">
							<td>
								<div>${i-(firstDayOfWeek-1)}</div> <!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<c:if test="${c.cashbookKind == '수입'}">
											<div>수입 : ${c.cashbookPrice}</div>
										</c:if>
										<c:if test="${c.cashbookKind == '지출'}">
											<div>지출 : ${c.cashbookPrice}</div>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
				</tr>
				<tr>
					</c:if>
					</c:forEach>

					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1"
							end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>