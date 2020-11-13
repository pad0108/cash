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
<!-- 호출 -->
	<div>
		<canvas id="piechart"></canvas>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
$
	.ajax({
		url : '/totalIncomeCompare',
		type : 'get',
		success : function(data) {

			/*$(data).each(function(key, yearIncome) {
				chartData.data.labels.push(yearIncome.year);
				chartData.data.datasets[0].data.push(yearIncome.income);
			});*/
			
			let pieCtx = $('#pieChart');
			let pieChart = new Chart(pieCtx, {
				type: 'pie',
				data:{
					labels:['수입','지출'], // 항목
					datasets:[{
						backgroundColor:[
							'rgb(255, 128, 128)',
							 'rgb(128, 255, 255)'
						],
						borderColor:[
							'rgba(255, 99, 132, 1)',
							 'rgba(255, 99, 132, 1)'
						],
						data:[50, 100] // 데이터
					}],
					label:''
				},
				options:{}
				
					});
		}
	});
</script>
</html>