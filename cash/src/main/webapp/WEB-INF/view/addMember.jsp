<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#id').focus();
	$('#id').blur(function(){
		//비동기요청으로 #id 값을 서버에 보내고 #id 값이 중복여부 확인
		if($('#id').val==''){
			$('#id').focus();
			return;
		}
		$.ajax({
			url:'/admin/idCheck',
			type:"post",
			data:{id:$('#id').val()},
			success:function(data){
				if(data == 'yes'){
					alert($('#id').val()+'는 사용 가능한 아이디입니다.');
					$('#pw').focus();
				}else{
					alert($('#id').val()+'는 중복된 아이디 입니다.');
					$('#id').select();
					$('#id').focus();
					}
				}
			});
		});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<form method="post" action="/admin/addMember">
		<div>
			ID:<input type="text" id="id" name="id">
		</div>
		<div>
			PW:<input type="password" id="pw" name="pw">
		</div>
		<button type="submit" id="addMember">추가</button>
	</form>
</body>
</html>