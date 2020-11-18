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
		<canvas id="doughnutChart"></canvas>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
$.ajax({
		url : '/totalOutCompare',
		type : 'get',
		success : function(data) {
			console.log(data);
			let chartData = {
				type: 'doughnut',
				data:{
					labels:['2018년 지출','2019년 지출','2020년 지출'], // 항목
					datasets:[{
						backgroundColor:[
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(75, 192, 192, 0.2)'
							 
						],
						borderColor:[
							'rgb(255, 99, 132)',
							'rgb(255, 159, 64)',
							'rgb(75, 192, 192)'
							 
						],
						data:[data["2018year"],data["2019year"], data["2020year"]] // 데이터
					}],
					label:''
				},
				options:{}
			};

			/*chartData.data.labels.push("지출");
			console.log(chartData.data.labels);

			chartData.data.datasets[0].data.push(100);
			console.log(chartData.data.datasets[0].data);*/
			
			let doughnutCtx = $('#doughnutChart');
			let doughnuteChart = new Chart(doughnutCtx, chartData);
		}
	});
</script>
</html>