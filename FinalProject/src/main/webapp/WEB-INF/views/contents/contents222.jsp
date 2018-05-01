<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>EasyCodingU</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/styleContents22.css?ver=1"> 

</head> 
<body>

	<div id="images">
		<div>
			<img src="../resources/img/true.png" title="boolean" value="True" id="True">
		</div>
		<div>
			<img src="../resources/img/false.png" title="boolean" value="False" id="False">
		</div>
		<div>
			<img src="../resources/img/num2.png" title="int" value="2" id="2">
		</div>
		
		<div>
			<img src="../resources/img/num9.png" title="int" value="9" id="9">
		</div>
		<div>
			<img src="../resources/img/Stringa.png" title="string" value="A" id="A">
		</div>
		<div>
			<img src="../resources/img/Strings.png" title="string" value="S" id="S">
		</div>
		<div>
			<img src="../resources/img/double1.png" title="double" value="1.25" id="1.25">
		</div>
		<div>
			<img src="../resources/img/double2.png" title="double" value="9.9" id="9.9">
		</div>
	</div>
	<div id="boards">
		<div title="int">

			<img src="../resources/img/basket.png" id="int">
			<p>int</p>
			<div>
				<input type="text" id="name1" size="30" maxlength="5" placeholder="입력하세요">
			</div>
			<!--  <div id="name11" class="co"></div>-->
		</div>
		<div title="double">
			<img src="../resources/img/basket.png" id="double">
			<p>Double</p>
			<div>
				<input type="text" id="name2" size="30" maxlength="5" placeholder="입력하세요">
			</div>
		<!--	<div id="name22" class="co"></div>-->
		</div>
		<div title="string">
			<img src="../resources/img/basket.png" id="string">
			<p>String</p>
			<div>
				<input type="text" id="name3" size="30" maxlength="5" placeholder="입력하세요">
			</div>
		<!--	<div id="name33" class="co"></div>-->
		</div>
		<div title="boolean">
			<img src="../resources/img/basket.png" id="boolean">
			<p>Boolean</p>
			<div>
				<input type="text" id="name4" size="15" maxlength="5" placeholder="입력하세요">
			</div>
		</div>
			</div>
			<div id="names" class="co"></div>
</body>
</html>