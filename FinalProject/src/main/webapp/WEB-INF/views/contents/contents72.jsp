<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://ss.googleapis.com/css?family=Jua" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<style type="text/css">
.codeEditor {
	background-color: black;
	color: #8bf95c;
	margin: 0;
	font-family: 'Jua', sans-serif;
	width: 400px;
	height: 505px;
}

.shortCodeEditor {
	background-color: black;
	font-family: 'Jua', sans-serif;
	color: #8bf95c;
	margin: 0;
	width: 400px;
	height: 50px;
}
/* Show tooltip content on hover */
[data-tooltip]:hover:before, [data-tooltip]:hover:after {
	visibility: visible;
	bottom: 90%;
}

.home {
	margin-bottom: 10px;
	margin-left: 20px;
	font-family: 'Jua', sans-serif;
}

.javaCode {
	margin-left: 170px;
	margin-top: 10px;
	font-family: 'Jua', sans-serif;
}

.error {
	margin-left: 20px;
	margin-bottom: 30px;
}

.next {
	margin-left: 170px;
	margin-bottom: 30px;
}

.answer {
	margin: 0;
	padding: 0;
	background-color: #f3fafd;
	border: solid 2px #217093;
	border-radius: 4px;
	box-sizing: border-box;
	width: 600px;
	height: 50px;
	text-align: center;
	font-size: 20pt;
	font-family: 'Jua', sans-serif;
	color: #353538;
	font-weight: 600;
	font-style: inherit;
}

@charset "UTF-8";

*, html, body {
font-family: 'Jua', sans-serif;
}

* {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

h1, h2 {
	text-align: center;
	font-family: 'Jua', sans-serif;
}

h1 {
	font-size: 24px;
	line-height: 30px;
	font-weight: bold;
}

h2 {
	font-size: 18px;
	line-height: 25px;
	margin-top: 20px;
	font-family: 'Jua', sans-serif;
}

button {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 0;
	padding: 14px 50px;
	border-radius: 4px;
	background-color: #37B595;
	color: #FFFFFF;
	text-transform: capitalize;
	font-size: 18px;
	font-family: 'Jua', sans-serif;
	line-height: 22px;
	outline: none;
	cursor: pointer;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}

button:hover {
	background-color: #1A7F75;
}

button.previous {
	background-color: #A2ACAF;
}

button.previous:hover {
	background-color: #5A5F61;
}

.full-width-container {
	width: 100%;
	min-width: 320px;
}

.sized-container {
	max-width: 900px;
	height: 40px;
	width: 100%;
	margin: 0 auto;
}

.slide-container {
	position: relative;
	left: 0;
	overflow: hidden;
	height: 400px;
}

.slide {
	float: left;
}

.slide .sized-container {
	padding: 10px 0px;
}

.button-container {
	border-top: 1px solid black;
	overflow: hidden;
	padding-top: 30px;
	height: 80px;
}

.button-container button {
	float: right;
	margin-left: 30px;
}

.pagination-container {
	margin-top: 70px;
}

.pagination {
	width: 100%;
	text-align: center;
	padding: 0 25px;
}

.indicator {
	width: 25px;
	height: 25px;
	border: 4px solid lightgray;
	border-radius: 50%;
	display: inline-block;
	-webkit-transition: all 0.3s;
	transition: all 0.3s;
	position: relative;
}

.indicator .tag {
	position: absolute;
	top: -30px;
	left: 50%;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%);
	color: lightgray;
	white-space: nowrap;
}

.indicator.active, .indicator.complete {
	border-color: #37B595;
}

.indicator.active .tag, .indicator.complete .tag {
	color: #37B595;
}

.indicator.complete:after {
	content: "✓";
	position: absolute;
	color: #37B595;
	left: 4px;
	top: 3px;
	font-size: 14px;
	font-family: 'Jua', sans-serif;
}

.progress-bar-container {
	width: 6%;
	height: 4px;
	font-family: 'Jua', sans-serif;
	display: inline-block;
	background-color: lightgray;
	position: relative;
	top: -10px;
}

.progress-bar-container:last-of-type {
	display: none;
}

.progress-bar-container .progress-bar {
	width: 0;
	height: 100%;
	background-color: #37B595;
}

ul {
	list-style: none;
	padding-left: 0px;
}

.concept {
	/* background-color: yellow; */
	
}

.example {
	/* background-color: green; */
	margin-left: auto;
	margin-right: auto;
	    background-color: cadetblue;
	width: 905px;
	font-family: 'Jua', sans-serif;
	height: 60px;
	margin-top: 50px;
	padding: 0px;
	border: 1px solid #37B595;
	border-radius: 1em;
}

.buttonDiv {
	/* background-color: blue; */
	text-align: center;
}

.buttonDiv input {
	width: 500px;
	background-color: #f1f1f1;
	border: thick;
	color: black;
	padding: 15px 0;
	font-family: 'Jua', sans-serif;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-family: 'Jua', sans-serif;
	margin: 4px;
	cursor: pointer;
}

.buttonDiv :HOVER {
	background-color: black;
	color: white;
}

.buttonDiv+div {
	/* background-color: green; */
	text-align: center;
	margin-top: 70px;
	margin-left: 130px;
	width: 500px;
	font-family: 'Jua', sans-serif;
	height: 50px;
	padding: 10px;
	border: 1px solid orange;
	border-radius: 1em;
}
#resultDiv img {
	width: 300px;
	height: 274px;
	margin-top: 50px;
	margin-left: 700px;
}
#resultDiv2 img{
width: 300px;
	height: 274px;
	margin-top: 50px;
	margin-left: 700px;
}
</style>


<!-- <link rel="stylesheet" type="text/css" href="../resources/css/styleContents.css"> -->
<script type="text/javascript">
	$(function() {
		var currentSlide = 0;
		var testCount = 0;

		$('#next').attr('disabled', true);
		$('#btnShowJava').hide();
		$('.buttonDiv + div').hide();

		var resultStr = '';
		
		$("#printBtn1").on("click",function(){
			$('#next').attr('disabled', false);
		});
		
		$('.buttonDiv input').on('click',function() {
							var clickedVal = $(this).val();
							var clickedAns = $(this).attr('answer');
							var slideAns = $(this).parent().attr('answer');
							//alert(clickedAns);
							//alert(slideAns);
							if (clickedAns == slideAns) {
								//클릭한 답이 맞으면
								//next버튼 눌리게 하고
								$('#next').attr('disabled', false);
								//정답 이미지 넣고
								resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"> </div>';
								//메세지 컨캣
								//resultStr += '<div> 정답입니다! </div>';
								//정답메세지 삽입
								$('#answerResultDiv').html(resultStr);
								//자바로 보기 버튼 나타내기
								//$('#btnShowJava').show();
								//자바로 보기 누르면
								$('#btnShowJava').on(
										'click',
										function() {
											var testClass = '.divShowJava'
													+ currentSlide;
											//alert(testClass);
											var javacode = clickedAns
													+ ' 변수이름 = ' + clickedVal
													+ ';';
											$(testClass).show();
											$(testClass).html(javacode);
											//$('.divShowJava0').show();
											//$('.divShowJava0').html(javacode);
										});
							} else {
								//틀렸으면
								resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
								resultStr += '<div> 틀렸습니다! 그건 ' + clickedAns
										+ ' 이예요 </div>';
								$('#answerResultDiv').html(resultStr);
							}
						});

		$slideContainer = $('.slide-container'), $slide = $('.slide'),
				slideCount = $slide.length, animationTime = 300;

		function setSlideDimensions() {
			var windowWidth = $(window).width();
			$slideContainer.width(windowWidth * slideCount);
			$slide.width(windowWidth);
		}

		function generatePagination() {
			var $pagination = $('.pagination');
			for (var i = 0; i < slideCount; i++) {
				var $indicator = $('<div>').addClass('indicator'), $progressBarContainer = $(
						'<div>').addClass('progress-bar-container'), $progressBar = $(
						'<div>').addClass('progress-bar'), indicatorTagText = $slide
						.eq(i).attr('data-tag'), $tag = $('<div>').addClass(
						'tag').text(indicatorTagText);
				$indicator.append($tag);
				$progressBarContainer.append($progressBar);
				$pagination.append($indicator).append($progressBarContainer);
			}
			$pagination.find('.indicator').eq(0).addClass('active');
		}

		$('#next').on('click', goToNextSlide);
		function goToNextSlide() {

			$('#answerResultDiv').html("");
			if (currentSlide >= slideCount - 1) {
				location.href = "clearChapter?c_num=729";
			}
			var windowWidth = $(window).width();
			currentSlide++;
			$slideContainer.animate({
				left : -(windowWidth * currentSlide)
			});
			setActiveIndicator();
			$('.progress-bar').eq(currentSlide - 1).animate({
				width : '100%'
			}, animationTime);
			$('#btnShowJava').hide();
			$('#next').attr('disabled', true);
		}

		function goToPreviousSlide() {
			if (currentSlide <= 0)
				return;
			var windowWidth = $(window).width();
			currentSlide--;
			$slideContainer.animate({
				left : -(windowWidth * currentSlide)
			}, animationTime);
			setActiveIndicator();
			$('.progress-bar').eq(currentSlide).animate({
				width : '0%'
			}, animationTime);
			$('#next').attr('disabled', false);
			$('#btnShowJava').show();
		}

		function postitionSlides() {
			var windowWidth = $(window).width();
			setSlideDimensions();
			$slideContainer.css({
				left : -(windowWidth * currentSlide)
			}, animationTime);
		}

		function setActiveIndicator() {
			var $indicator = $('.indicator');
			$indicator.removeClass('active').removeClass('complete');
			$indicator.eq(currentSlide).addClass('active');
			for (var i = 0; i < currentSlide; i++) {
				$indicator.eq(i).addClass('complete');
			}
		}

		setSlideDimensions();
		generatePagination();
		$(window).resize(postitionSlides);
		$('#previous').on('click', goToPreviousSlide);

		$('#printBtn1').on('click', function() {
			var str = ' <img alt="" src="../resources/img/star3.png">';
			$('#resultDiv').html(str);
		});
		
		$('#printBtn2').on('click', function() {
			//alert("printBtn2 Click!");
			var str = ' <img alt="" src="../resources/img/star4.png">';
			$('#resultDiv2').html(str);
		});
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>contents72</title>
</head>
<body style="overflow-x: hidden">
	<div class="pagination-container full-width-container">
		<div class="sized-container">
			<div class="pagination"></div>
		</div>
	</div>
	<div class="viewport full-width-container" style="padding: 5px;">
		<ul class="slide-container">
			<li class="slide" data-tag="Star">
				<div class="sized-container">
					<div class="concept">
						<h1>3줄 4개의 별을 만들어 보아요.</h1>
					</div>
					<div class="example">
						<h2>Q) 3줄에 4개씩 들어가는 별을 만들기위해 필요한 줄반복 변수(i)가 있습니다 .i의 시작값을
							골라주세요.</h2>
						<div class="buttonDiv" answer="0">
							<input type="button" value="0" answer="0"> <input
								type="button" value="1" answer="1"> <input type="button"
								value="2" answer="2"> <input type="button" value="3"
								answer="3">
						</div>
						<div class="divShowJava0"></div>
					</div>
				</div>
			</li>

			<li class="slide" data-tag="Star1">
				<div class="sized-container">
					<div class="concept">
						<h1>다음 칸에 필요한 숫자를 선택해 주세요.</h1>
					</div>
					<div class="example">
						<h2>Q) 3줄을 만들기 위해 줄의 반복 변수(i)의 반복 횟수를 선택하세요.</h2>
						<div class="buttonDiv" answer="3">
							<input type="button" value="1" answer="1"> <input
								type="button" value="2" answer="2"> <input type="button"
								value="3" answer="3"> <input type="button" value="4"
								answer="4">
						</div>
						<div class="divShowJava1"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Star1-2">
				<div class="sized-container">
					<div class="concept">
						<h1>3줄의 별을 만들기 위한 for문을 선택해 주세요.</h1>
					</div>
					<div class="example">
						<h2>Q) 3줄의 별을 찍기 위하여 알맞은 for문을 선택해 주세요.</h2>
						<div class="buttonDiv"
							answer="for (int i = 0; i &lt;= 3; i++) { };">
							<input type="button"
								value="for (int i = 1; i &lt;= 1; i++) {  };"
								answer="for (int i = 1; i &lt;= 1; i++) {  };"> <input
								type="button" value="for (int i = 0; i &lt;= 3; i--) {  }"
								answer="for (int i = 0; i &lt;= 3; i--) {  }"> <input
								type="button" value="for (int i = 0; i &lt;= 3; i++) { };"
								answer="for (int i = 0; i &lt;= 3; i++) { };"> <input
								type="button" value="for (int i = 0; i &lt;= 1; i--) { }"
								answer="for (int i = 0; i &lt;= 1; i--) { }">
						</div>
						<div class="divShowJava2"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Star1-3">
				<div class="sized-container">
					<div class="concept">
						<h1>한 줄의 4개의 별을 찍기 위한 for문을 골라주세요.</h1>
					</div>
					<div class="example">
						<h2>Q) 4개의 별을 찍기 위해 알맞은 for문을 선택해 주세요</h2>
						<div class="buttonDiv"
							answer="for (int j = 0; j &lt;= 4; i++) { };">
							<input type="button" value="for (int j = 1; j &lt;= 3; i++) { }"
								answer="for (int j = 1; j &lt;= 3; i++) { }"> <input
								type="button" value="for (int j = 0; j &lt;= 4; i--) { };"
								answer="for (int j = 0; j &lt;= 4; i--) { };"> <input
								type="button" value="for (int j = 0; j &lt;= 3; i++) { }"
								answer="for (int j = 0; j &lt;= 3; i++) { }"> <input
								type="button" value="for (int j = 0; j &lt;= 4; i++) { };"
								answer="for (int j = 0; j &lt;= 4; i++) { };">
						</div>
						<div class="divShowJava3"></div>
					</div>
				</div>
			</li>

			<!-- 이미지 띄우기 1번 -->
			<li class="slide" data-tag="Star1-4">
				<div class="sized-container">
					<div class="concept">
						<h1>3줄 4개의 별이 완성 되었습니다.</h1>
						<pre class="codeEditor">
	                <br>  for (int i = 0; j &lt;= 3; i++) {  	
	               	<br>  for (int j = 0; i &lt;= 4; j++) {  
	               	<br>  System.out.print("*");
	               	<br>}
	      			<br>  System.out.println("");
	               	<br>}
	         		 <br> <input type="button" value="PRINT"
									id="printBtn1" name="printBtn1">
                  </pre>
						
					</div>
				</div>
					<div id="resultDiv"></div>
			</li>

			<!--  두번쨰 별찍기 -->
			<li class="slide" data-tag="Star2">
				<div class="sized-container">
					<div class="concept">
						<h1>4줄의 삼각형모양의 별을 만들어 보아요.</h1>
					</div>
					<div class="example">
						<h2>Q) 4줄의 삼각형 모양의 별을 만들기위해 필요한 줄반복 변수(i)가 있습니다 .i의 시작값을
							골라주세요.</h2>
						<div class="buttonDiv" answer="1">
							<input type="button" value="0" answer="0"> <input
								type="button" value="1" answer="1"> <input type="button"
								value="2" answer="2"> <input type="button" value="3"
								answer="3">
						</div>
						<div class="divShowJava4"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Star2-1">
				<div class="sized-container">
					<div class="concept">
						<h1>다음 칸에 필요한 숫자를 선택해 주세요.</h1>
					</div>
					<div class="example">
						<h2>Q) 4줄을 만들기 위해 줄의 반복 변수 (i)의 반복 횟수를 선택해 주세요 단,현재 i는 1부터
							시작입니다.</h2>
						<div class="buttonDiv" answer="5">
							<input type="button" value="2" answer="2"> <input
								type="button" value="3" answer="3"> <input type="button"
								value="4" answer="4"> <input type="button" value="5"
								answer="5">
						</div>
						<div class="divShowJava5"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Star2-2">
				<div class="sized-container">
					<div class="concept">
						<h1>4줄의 삼각별을 만들기 위한 공백에 대한 for문을 선택해 주세요 .</h1>
					</div>
					<div class="example">
						<h2>Q) 공백이 있는 4줄을 찍기 위해 알맞은 for문을 선택해 주세요.</h2>
						<div class="buttonDiv"
							answer="for (int i = 1; i &lt;= 5; i++) { };">
							<input type="button" value="for (int i = 1; i &lt;= 5; i++) { };"
								answer="for (int i = 1; i &lt;= 5; i++) { };"> <input
								type="button" value="for (int i = 1; i &lt;= 4; i--) { }"
								answer="for (int i = 1; i &lt;= 4; i--) { }"> <input
								type="button" value="for (int i = 0; i &lt;= 5; i++) { };"
								answer="for (int i = 0; i &lt;= 5; i++) { };"> <input
								type="button" value="for (int i = 0; i &lt;= 6; i--) { }"
								answer="for (int i = 0; i &lt;= 6; i--) { }">
						</div>
						<div class="divShowJava6"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Star2-3">
				<div class="sized-container">
					<div class="concept">
						<h1>한 줄마다 증가하는 별을 찍기 위한 별 반복용 변수(j)를 골라 주세요.</h1>
					</div>
					<div class="example">
						<h2>Q) 한 줄마다 증가하는 별을 찍기 위한 별 반복용 변수(j)를 골라 주세요 ,단 j는 줄의 크기까지
							증가합니다.</h2>
						<div class="buttonDiv"
							answer="for (int j = 0; j &lt; j; i++) { };">
							<input type="button" value="for (int j = 1; j &lt; i; i++) { }"
								answer="for (int j = 1; j &lt; i; i++) { }"> <input
								type="button" value="for (int j = 0; j &lt; i; i--) { };"
								answer="for (int j = 0; j &lt; i; i--) { };"> <input
								type="button" value="for (int j = 1; j &lt;j; i++) { }"
								answer="for (int j = 1; j &lt;j; i++) { }"> <input
								type="button" value="for (int j = 0; j &lt; j; i++) { };"
								answer="for (int j = 0; j &lt; j; i++) { };">
						</div>
						<div class="divShowJava7"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Star1-4">
				<div class="sized-container">
					<div class="concept">
						<h1>4줄의 삼각형모양의 별이 완성 되었어요.</h1>
						<pre class="codeEditor">
	                <br>for (int i = 1; j &lt; 5; i++) {  	
	               	<br>for (int j = 0; i &lt;i; j++) {  
	               	<br> System.out.print("*");
	               	<br>}
	      			<br>System.out.println("");
	      			}
	               <input type="button" value="PRINT" id="printBtn2" name="printBtn2">
                  </pre>
					</div>
				</div> 
					<div id="resultDiv2"></div>
			</li>
		</ul>
	</div>

	<div class="full-width-container">
		<div class="button-container sized-container">
			<div id="checkBtnDiv"></div>
			<div id="nextBtnDiv"></div>
			<button class="next" id="next">next</button>
			<button class="previous" id="previous">previous</button>
			<!-- <button class="next" id="btnShowJava">Java로 보기</button> -->
			<div id="answerResultDiv"></div>
		</div>
	</div>
	</div>
</body>
</html>