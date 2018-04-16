<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	box-sizing: border-box;
	font-family: 'Helvetica Neue', sans-serif;
}

body {
	background-color: white;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 200px;
	
}

.radio-tile-group {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	
}

.radio-tile-group .input-container {
	position: relative;
	height: 7rem;
	width: 7rem;
	margin: 4.0rem;
	
}

.radio-tile-group .input-container .radio-button {
	opacity: 0;
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	margin: 0;
	cursor: pointer;
}

.radio-tile-group .input-container .radio-tile {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 200px;
	height: 150px;
	border: 2px solid #079ad9;
	border-radius: 10px;
	padding: 1rem;
	transition: -webkit-transform 300ms ease;
	transition: transform 300ms ease;
	transition: transform 300ms ease, -webkit-transform 300ms ease;
	
}



.radio-tile-group .input-container .radio-tile-label {
	text-align: center;
	font-size: 0.75rem;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 1px;
	color: #079ad9;
}

.radio-tile-group .input-container .radio-button:checked+.radio-tile {
	background-color: #079ad9;
	border: 2px solid #079ad9;
	color: white;
	-webkit-transform: scale(1.1, 1.1);
	transform: scale(1.1, 1.1);
}



.radio-tile-group .input-container .radio-button:checked+.radio-tile .radio-tile-label
	{
	color: white;
	background-color: #079ad9;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="radio-tile-group">
			<h2>자료형에 알맞는 변수를 선택하세요</h2>
			<img alt="" src="../resources/img/intbox.png" width="200px;" height="200px;">
			<br> <br> <br>
			<div class="input-container">
				<input id="int" class="radio-button" type="radio" name="radio" />
				<div class="radio-tile">
					<div class="icon int-icon">
						<img alt="" src="../resources/img/int100.png" width="100px;"
							height="100px;">
					</div>
				</div>

				<div class="input-container">
					<input id="string" class="radio-button" type="radio" name="radio" />
					<div class="radio-tile">
						<div class="icon string-icon">
							<img alt="" src="../resources/img/intstring.png" width="100px;"
							height="100px;">
						</div>
					</div>
				</div>

				<div class="input-container">
					<input id="bouble" class="radio-button" type="radio" name="radio" />
					<div class="radio-tile">
						<div class="icon bouble-icon">
							<img alt="" src="../resources/img/intdouble.png" width="100px;"
							height="100px;">
						</div>
					</div>
				</div>

				<div class="input-container">
					<input id="boolean" class="radio-button" type="radio" name="radio" />
					<div class="radio-tile">
						<div class="icon boolean-icon">
							<img alt="" src="../resources/img/intboolean.png" width="100px;"
							height="100px;">
						</div>
					</div>
				</div>

			</div>
		</div>
</body>
</html>