<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<style type="text/css">
.results>p{
    margin-left: 24px;
margin-top: 100px;
font-size: 30px;
font-family: 'Jua', sans-serif;
}

</style>
<script type="text/javascript">
function btnClick2(){
	resultStr = '<p class="ptag"> Double란 실수를 담을 수 있는 자료형 입니다. <br>실수란 소수점을 의미합니다 </p> </div>';
	$('#results').html(resultStr);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<div class="radio-tile-group">
			<h2 style="height: 20px;">자료형 Double란 ?</h2>
			<div class="imgdiv">
				<img alt="" src="../resources/img/doublebox.png" width="180px;"
					height="180px;" id="doubleimg"  onclick="btnClick2()" style="cursor: pointer;">
			</div>
			<div class="results" id="results"></div>
		</div>
	</div>
	
</body>
</html>