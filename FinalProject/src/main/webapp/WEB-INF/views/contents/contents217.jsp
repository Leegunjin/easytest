<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<style type="text/css">

.resulta>p{
margin-left: 16px;
margin-top: 100px;
font-size: 30px;
font-family: 'Jua', sans-serif;
}

</style>
<script type="text/javascript">
function btnClick3(){
	resultStr = '<p class="ptag"> String란 문자열을 담을 수 있는 자료형 입니다. <br>" " 를 이용하여 문자열을 넣습니다.</p> </div>';
	$('#resulta').html(resultStr);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<div class="radio-tile-group">
			<h2 style="height: 20px;">자료형 String란 ?</h2>
			<div class="imgdiv">
				<img alt="" src="../resources/img/stringbox.png" width="200px;"
					height="200px;" id="stringimg"  onclick="btnClick3()" style="cursor: pointer;">
			</div>
			<div class="resulta" id="resulta"></div>
		</div>
	</div>
	
</body>
</html>