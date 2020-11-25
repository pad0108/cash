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
<div class="container">
	<div><!-- 호출 -->
		<span>연도별 최대, 최소 수입액 :</span>
		<input type="text" id="year">
		<button id="MinMaxIncome" type="button">확인</button>
	</div>
	<div>
		<canvas id="pieChart"></canvas>
	</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$('#MinMaxIncome').click(
		function() {
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/minMaxIncome/'+$('#year').val(),
			type:'get',
			success:function(data) {
				console.log(data);
				let pieCtx = $('#pieChart');
				let pieChart = new Chart(pieCtx,{
					type: 'pie',
					data:{
						labels:['최대','최소'], // 항목
						datasets:[{
							backgroundColor:[
								'rgba(255, 128, 255,0.5)',
		                        'rgba(255, 128, 192,0.5)'
							],
							borderColor:[
								'rgba(153, 102, 255, 0.5)',
			                    'rgba(255, 159, 64, 0.5)'
							],
							data:[data.maxIncome, data.minIncome] // 데이터
						}],
						label:''
					},
					options:{}
					
				});
			}
		});
	});
</script>
</html>