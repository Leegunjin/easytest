<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<style type="text/css">

.result>p{
 margin-left: 33px;
margin-top: 100px;
font-size: 30px;
font-family: 'Jua', sans-serif;
}

</style>
<script type="text/javascript">
function btnClick1(){
	resultStr = '<p class="ptag1"> int란 정수를 담을 수 있는 자료형 입니다. <br>범위는 -2147483648 부터 2147483647 입니다. </p> </div>';
	$('#result').html(resultStr);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<div class="radio-tile-group">
			<h2 style="height: 20px;">자료형 INT란 ?</h2>
			<div class="imgdiv">
				<img alt="" src="../resources/img/intbox.png" width="200px;"
					height="200px;" id="intimg"  onclick="btnClick1()" style="cursor: pointer;">
			</div>
			<div class="result" id="result"></div>
		</div>
	</div>
	
</body>
</html>