<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 구글 css 폰트 숫자 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100&display=swap" rel="stylesheet">
<body>
<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div><!-- 호출 -->
		<span>연도별 지출액 :</span>
		<input type="text" id="year">
		<button id="totalOutByYear" type="button">Chart</button>
	</div>
	<div>
		<canvas id="chart"></canvas>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$('#totalOutByYear').click(
			function() {
				$.ajax({
					url : '/totalOutbyYear/' + $('#year').val(),
					type : 'get',
					success : function(data) {
						console.log(data);
						var ctx = document.getElementById('chart')
								.getContext('2d');
						var chart = new Chart(ctx, {
							// The type of chart we want to create
							type : 'bar', //chart 종류: 바,곡선...등

							// The data for our dataset
							data : {
								labels : [ 'January', 'February', 'March',
										'April', 'May', 'June', 'July',
										'August', 'September', 'October',
										'November', 'December' ],
								datasets : [ {
									label : $('#year').val()+'년 월별 지출',
									backgroundColor : [ 'rgb(255, 128, 128)',
											'rgb(255, 192, 128)',
											'rgb(255, 255, 128)',
											'rgb(192, 255, 128)',
											'rgb(128, 255, 128)',
											'rgb(128, 255, 192)',
											'rgb(128, 255, 255)',
											'rgb(128, 192, 255)',
											'rgb(128, 128, 255)',
											'rgb(192, 128, 255)',
											'rgb(255, 128, 255)',
											'rgb(255, 128, 192)'

									],
									borderColor : [ 'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(255, 159, 64, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(255, 159, 64, 1)' 
											],
									//data 속성의 배열값은 ajax호출 후 결과값으로 채워야 한다.
									data : [ data.january, data.february,
											data.march, data.april, data.may,
											data.june, data.july, data.august,
											data.september, data.october,
											data.november, data.december ],
									borderWidth : 1
								} ]
							},
							options : {}

						});
					}
				});
			});
</script>
</html>