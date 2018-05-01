<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INT</title>
</head>
<body> 

	<div class="container">
		<div class="radio-tile-group">
			<h2 style="height: 20px;">자료형에 알맞는 변수를 선택하세요</h2>
			<div class="imgdiv">
				<img alt="" src="../resources/img/intbox.png" width="200px;"
					height="200px;" id="intimg">
			</div>
			<div class="input-container">
				<input class="radio-button" type="radio" name="radioBtn" value="int"
					id="100"/>
				<div class="radio-tile">
					<div class="icon int-icon">
						<img alt="" src="../resources/img/int100.png" width="100px;"
							height="100px;">
					</div>
				</div>
			</div>

			<div class="input-container">
				<input value="string" class="radio-button" type="radio"
					name="radioBtn" id="Easy"/>
				<div class="radio-tile">
					<div class="icon string-icon">
						<img alt="" src="../resources/img/intstring.png" width="100px;"
							height="100px;">
					</div>
				</div>
			</div>

			<div class="input-container">
				<input value="double" class="radio-button" type="radio"
					name="radioBtn" id="0.5"/>
				<div class="radio-tile">
					<div class="icon double-icon">
						<img alt="" src="../resources/img/intdouble.png" width="100px;"
							height="100px;">
					</div>
				</div>
			</div>

			<div class="input-container">
				<input value="boolean" class="radio-button" type="radio"
					name="radioBtn" id="True" />
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