<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<style type="text/css">
.home {
	margin-bottom: 10px;
	margin-left: 20px;
}

.javaCode {
	margin-left: 170px;
	margin-top: 10px;
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
	color: #353538;
	font-weight: 600;
	font-style: inherit;
}

@charset "UTF-8";

*, html, body {
	font-family: "TrebuchetMS", trebuchet, sans-serif;
}

* {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

h1, h2 {
	text-align: center;
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
	height:80px;
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
	padding: 10px 25px;
}

.button-container {
	border-top: 1px solid black;
	overflow: hidden;
	padding-top: 30px;
}

.button-container button {
	float: right;
	margin-left: 30px;
}

.pagination-container {
	margin-top: 120px;
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
}

.progress-bar-container {
	width: 10%;
	height: 4px;
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

.concept{
	background-color: yellow;
}

.example{
	/* background-color: green; */
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	height: 170px;
	margin-top: 50px;
	padding: 10px;
	border: 1px solid orange; 
	border-radius: 1em;
}

.buttonDiv{
	/* background-color: blue; */
	text-align: center;
}

.buttonDiv input{
	width:100px;
    background-color: #f1f1f1;
    border: thick;
    color:black;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}

.buttonDiv :HOVER {
	background-color: black;
	color: white;
}

.buttonDiv + div{
	/* background-color: green; */
	text-align: center;
	margin-top: 70px;
	margin-left: 130px;
	width: 500px;
	height: 50px;
	padding: 10px;
	border: 1px solid orange; 
	border-radius: 1em;
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
		$('.buttonDiv input').on('click', function(){
			var clickedVal = $(this).val();
			var clickedAns = $(this).attr('answer');
			var slideAns = $(this).parent().attr('answer');
			//alert(clickedAns);
			//alert(slideAns);
			if(clickedAns == slideAns){
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
	            $('#btnShowJava').show();
				//자바로 보기 누르면
	            $('#btnShowJava').on('click',function(){
	            	var testClass = '.divShowJava' + currentSlide;
	            	//alert(testClass);
	            	var javacode = clickedAns + ' 변수이름 = ' + clickedVal + ';';
	            	$(testClass).show();
					$(testClass).html(javacode);
					//$('.divShowJava0').show();
					//$('.divShowJava0').html(javacode);
	            });
                
			}else{
				//틀렸으면
				resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
	            resultStr += '<div> 틀렸습니다! 그건 '+ clickedAns +' 이예요 </div>';
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

		$('#next').on('click',goToNextSlide);
		function goToNextSlide() {
			$('#answerResultDiv').html("");
			if (currentSlide >= slideCount - 1) {
				location.href = "clearChapter?c_num=110";
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
			$('#next').attr('disabled',false);
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

	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>튜토리얼</title>
</head>
<body style="overflow-x: hidden">


	<div class="pagination-container full-width-container">
		<div class="sized-container">
			<div class="pagination"></div>
		</div>
	</div>
	<div class="viewport full-width-container" style="padding: 5px;">
		<ul class="slide-container">
			<li class="slide" data-tag="int">
				<div class="sized-container" >
					<div class="concept">
						<h1>
							int는 숫자를 표현할 수 있는 자료형 입니다!
						</h1>
					</div>
					<div class="example">
						<h2>
							Q. 다음 중 int로 표현할 수 있는 것은?
						</h2>
						<div class="buttonDiv" answer="int">
							<input type="button" value="10" answer="int">
							<input type="button" value="0.1" answer="double">
							<input type="button" value="true" answer="boolean">
							<input type="button" value="hello" answer="String">
						</div>
						<div class="divShowJava0"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="double">
				<div class="sized-container">
					<div class="concept">
						<h1>
							double은 소수를 표현할 수 있는 자료형 입니다!
						</h1>
					</div>
					<div class="example">
						<h2>
							Q. 다음 중 double로 표현할 수 있는 것은?
						</h2>
						<div class="buttonDiv" answer="double">
							<input type="button" value="10" answer="int">
							<input type="button" value="0.1" answer="double">
							<input type="button" value="true" answer="boolean">
							<input type="button" value="hello" answer="String">
						</div>
						<div class="divShowJava1"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="String">
				<div class="sized-container">
					<div class="concept">
						<h1>
							String은 문자열을 표현할 수 있는 자료형 입니다!
						</h1>
					</div>
					<div class="example">
						<h2>
							Q. 다음 중 String으로 표현할 수 있는 것은?
						</h2>
						<div class="buttonDiv" answer="String">
							<input type="button" value="10" answer="int">
							<input type="button" value="0.1" answer="double">
							<input type="button" value="true" answer="boolean">
							<input type="button" value="hello" answer="String">
						</div>
						<div class="divShowJava2"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="boolean">
				<div class="sized-container">
					<div class="concept">
						<h1>
							boolean은 Yes or No를 표현할 수 있는 자료형 입니다!
						</h1>
					</div>
					<div class="example">
						<h2>
							Q. 다음 중 boolean로 표현할 수 있는 것은?
						</h2>
						<div class="buttonDiv" answer="boolean">
							<input type="button" value="10" answer="int">
							<input type="button" value="0.1" answer="double">
							<input type="button" value="true" answer="boolean">
							<input type="button" value="hello" answer="String">
						</div>
						<div class="divShowJava3"></div>
					</div>
				</div>
			</li>

		</ul>
	</div>
	<div class="full-width-container">
		<div class="button-container sized-container">
			<div id="checkBtnDiv"></div>
			<div id="nextBtnDiv"></div>
			<button class="next" id="next">next</button>
			<button class="previous" id="previous">previous</button>
			<button class="next" id="btnShowJava">Java로 보기</button>
			<div id="answerResultDiv"></div>
		</div>
	</div>

</body>
</html>