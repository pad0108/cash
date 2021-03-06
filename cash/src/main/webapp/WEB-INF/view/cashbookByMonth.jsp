<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 구글 css 폰트 숫자 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.sunday {
	color: #FF0000;
}
.saturday{
	color: #0000FF;
}

th{
	width:${100/7}%;
}
td{
	height: 80px;
	vertical-align:top;
}
.nTable td{
	vertical-align:middle;
}
td{
	font-family: 'Noto Sans JP', sans-serif;
}
tr{
	font-family: 'Noto Sans JP', sans-serif;
}
</style>

</head>
<script>
	var memberCountConTxt1= ${sumIn};
	
	$({ val : 0 }).animate({ val : memberCountConTxt1 }, {
	 duration: 2000,
	step: function() {
	  var num = numberWithCommas(Math.floor(this.val));
	  $(".memberCountCon1").text(num);
	},
	complete: function() {
	  var num = numberWithCommas(Math.floor(this.val));
	  $(".memberCountCon1").text(num);
	}
	});

var memberCountConTxt2= ${sumOut};
	
	$({ val : 0 }).animate({ val : memberCountConTxt2 }, {
	 duration: 2000,
	step: function() {
	  var num = numberWithCommas(Math.floor(this.val));
	  $(".memberCountCon2").text(num);
	},
	complete: function() {
	  var num = numberWithCommas(Math.floor(this.val));
	  $(".memberCountCon2").text(num);
	}
	});
	
	function numberWithCommas(x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
		<table style="text-align:center; width:100%; margin-top:10px;">
			<tr>
				<td style="width:20%;">
					<table class="table nTable" border="1" style="width:100%;">
						<tr>
							<td class="table-active" style="height:10px;">이번달 수입</td>
						</tr>
						<tr>						
							<td style="height:200px;"><div class="memberCountCon1"></div>원</td>
						</tr>
					</table>
				</td>
				<td style="width:60%;">
					<table class="table table-borderless nTable">
						<tr>
							<td style="height:10px;"><h4>가계부</h4></td>
						</tr>
						<tr>
							<td style="height:200px;">
								<h4>${currentYear}</h4>
								<h1>${currentMonth}</h1>
								<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth - 1}" class="btn btn-secondary"> ＜＜ </a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth + 1}" class="btn btn-secondary"> ＞＞ </a>
							</td>
						</tr>
					</table>
				</td>
				<td style="width:20%;">
					<table class="table nTable" border="1">
						<tr>
							<td class="table-active" style="height:10px;">이번달 지출</td>
						</tr>
						<tr>
							<td style="height:200px;"><div class="memberCountCon2"></div>원</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- 다이어리 -->
		
		<div>
			<table border="1" width="100%">
				<thead>
					<tr class="table-active">
						<th><div class="sunday">일</div></th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th><div class="saturday">토</div></th>
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
									<div>
										<a href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a>
									</div> <!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->
									<c:forEach var="c" items="${cashList}">
										<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
											<c:if test="${c.cashbookKind == '수입'}">
												<div><font color="#52E252">수입 : ${c.cashbookPrice}</font></div>
											</c:if>
											<c:if test="${c.cashbookKind == '지출'}">
												<div><font color="#EB0000">지출 : ${c.cashbookPrice}</font></div>
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
	</div>
</body>
</html>