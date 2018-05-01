<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<style type="text/css">
 
.resultb>p{
margin-left: 120px;
margin-top: 100px;
font-size: 30px;
font-family: 'Jua', sans-serif;
}

</style>
<script type="text/javascript">
function btnClick4(){
	resultStr = '<p class="ptag"> boolean란  논리값 입니다. <br>True 혹은 False로 구분 됩니다.</p> </div>';
	$('#resultb').html(resultStr);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<div class="radio-tile-group">
			<h2 style="height: 20px;">자료형 Boolean란 ?</h2>
			<div class="imgdiv">
				<img alt="" src="../resources/img/booleanbox.png" width="200px;"
					height="200px;" id="booleanimg"  onclick="btnClick4()" style="cursor: pointer;">
			</div>
			<div class="resultb" id="resultb"></div>
		</div>
	</div>
	
</body>
</html>