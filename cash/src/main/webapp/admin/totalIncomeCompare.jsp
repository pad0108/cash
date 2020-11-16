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
$.ajax({
		url : '/totalIncomeCompare',
		type : 'get',
		success : function(data) {
			let chartData = {
				type: 'pie',
				data:{
					labels:['2018년 수입','2019년 수입','2020년 수입'], // 항목
					datasets:[{
						backgroundColor:[
							'rgb(255, 128, 128)',
							'rgb(128, 255, 128)',
                            'rgb(128, 255, 192)'
							 
						],
						borderColor:[
							'rgba(255, 99, 132, 1)',
							 'rgba(153, 102, 255, 1)',
	                          'rgba(255, 159, 64, 1)'
							 
						],
						data:[736717030,685539880,1574781287] // 데이터
					}],
					label:''
				},
				options:{}
			};

			/*chartData.data.labels.push("지출");
			console.log(chartData.data.labels);

			chartData.data.datasets[0].data.push(100);
			console.log(chartData.data.datasets[0].data);*/
			
			let pieCtx = $('#piechart');
			let pieChart = new Chart(pieCtx, chartData);
		}
	});
</script>
</html>