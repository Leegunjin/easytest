<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<style type="text/css">

/* 카드 */
*{
  margin: 0;
  padding: 0;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

h1{
  font-size: 2.5rem;
  font-family: 'Montserrat';
  font-weight: normal;
  color: #444;
  text-align: center;
  margin: 2rem 0;
}

.wrapper{
  width: 90%;
  margin: 0 auto;
  max-width: 80rem;
}

.cols{
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
      flex-wrap: wrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.col{
  width: calc(25% - 2rem);
  margin: 1rem;
  cursor: pointer;
}

.container{
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
	-webkit-perspective: 1000px;
	        perspective: 1000px;
}

.front,
.back{
  background-size: cover;
	background-position: center;
	-webkit-transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
	transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
	-o-transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
	transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
	transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1), -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
	-webkit-backface-visibility: hidden;
	        backface-visibility: hidden;
	text-align: center;
	min-height: 300px;
	height: auto;
	border-radius: 10px;
	color: #fff;
	font-size: 1.5rem;
}

.back{
  background: #cedce7;
  background: -webkit-linear-gradient(45deg,  #cedce7 0%,#596a72 100%);
  background: -o-linear-gradient(45deg,  #cedce7 0%,#596a72 100%);
  background: linear-gradient(45deg,  #cedce7 0%,#596a72 100%);
}

.front:after{
	position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 100%;
    content: '';
    display: block;
    opacity: .6;
    background-color: #000;
    -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
    border-radius: 10px;
}
.container:hover .front,
.container:hover .back{
    -webkit-transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    -o-transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
    transition: transform .7s cubic-bezier(0.4, 0.2, 0.2, 1), -webkit-transform .7s cubic-bezier(0.4, 0.2, 0.2, 1);
}

.back{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
}

.inner{
    -webkit-transform: translateY(-50%) translateZ(60px) scale(0.94);
            transform: translateY(-50%) translateZ(60px) scale(0.94);
    top: 50%;
    position: absolute;
    left: 0;
    width: 100%;
    padding: 2rem;
    -webkit-box-sizing: border-box;
            box-sizing: border-box;
    outline: 1px solid transparent;
    -webkit-perspective: inherit;
            perspective: inherit;
    z-index: 2;
}

.container .back{
    -webkit-transform: rotateY(180deg);
            transform: rotateY(180deg);
    -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
}

.container .front{
    -webkit-transform: rotateY(0deg);
            transform: rotateY(0deg);
    -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
}

.container:hover .back{
  -webkit-transform: rotateY(0deg);
          transform: rotateY(0deg);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
}

.container:hover .front{
  -webkit-transform: rotateY(-180deg);
          transform: rotateY(-180deg);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
}

.front .inner p{
  font-size: 2rem;
  margin-bottom: 2rem;
  position: relative;
}

.front .inner p:after{
  content: '';
  width: 4rem;
  height: 2px;
  position: absolute;
  background: #C6D4DF;
  display: block;
  left: 0;
  right: 0;
  margin: 0 auto;
  bottom: -.75rem;
}

.front .inner span{
  color: rgba(255,255,255,0.7);
  font-family: 'Montserrat';
  font-weight: 300;
}

@media screen and (max-width: 64rem){
  .col{
    width: calc(33.333333% - 2rem);
  }
}

@media screen and (max-width: 48rem){
  .col{
    width: calc(50% - 2rem);
  }
}

@media screen and (max-width: 32rem){
  .col{
    width: 100%;
    margin: 0 0 2rem 0;
  }
}

/* 원래꺼 */

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
	text-align: center;
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
	/* background-color: yellow; */
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
	/* background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none; */

	width:100px;
    background-color: #37B595;
    border: thick;
    color:white;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    margin-top: 30px;
    cursor: pointer;
    transition:800ms ease all;
    border-radius: 1em;
}
.buttonDiv input:hover{
  background:#fff;
  color:#1AAB8A;
}
.buttonDiv input:before,.buttonDiv input:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.buttonDiv input:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.buttonDiv input:hover:before,.buttonDiv input:hover:after{
  width:100%;
  transition:800ms ease all;
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

#typeDetail{
	width: 500px;
	height: 200px;
	display: inline-block;
}









</style>
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/styleContents.css"> -->
<script type="text/javascript">
	$(function() {
		var currentSlide = 0;
		var testCount = 0;
		
		var count1 = 0;
		$('.col').on('click',function(){
			var data_type = $(this).attr('data-type');
			switch(data_type){
				case 'int':
					$('#typeDetail').html("int는 소수가 아닌 숫자를 표현합니다");
					break;
				case 'double':
					$('#typeDetail').html("double는 소수를 표현합니다");
					break;
				case 'boolean':
					$('#typeDetail').html("boolean은 참 또는 거짓을 표현합니다");
					break;
				case 'String':
					$('#typeDetail').html('String은 " " 안에 넣을 수 있는 문자열을 표현합니다');
					break;
			}
			count1++;
			if(count1 == 4){
				$('#next').attr('disabled',false);
			}
		});
		
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
			<li class="slide" data-tag="Step1">
				<div class="sized-container" >
					<div class="wrapper">
				  		<div class="cols">
							<div class="col" data-type="int" ontouchstart="this.classList.toggle('hover');">
								<div class="container">
									<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
										<div class="inner">
											<p>int</p>
				              <span>check!</span>
										</div>
									</div>
									<div class="back">
										<div class="inner">
										  <p></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col" data-type="double" ontouchstart="this.classList.toggle('hover');">
								<div class="container">
									<div class="front" style="url(https://unsplash.it/511/511/)">
										<div class="inner">
											<p>double</p>
				              <span>check!</span>
										</div>
									</div>
									<div class="back">
										<div class="inner">
											<p></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col" data-type="boolean" ontouchstart="this.classList.toggle('hover');">
								<div class="container">
									<div class="front" style="background-image: url(https://unsplash.it/502/502/)">
										<div class="inner">
											<p>boolean</p>
				              <span>check!</span>
										</div>
									</div>
									<div class="back">
										<div class="inner">
											<p></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col" data-type="String" ontouchstart="this.classList.toggle('hover');">
								<div class="container">
									<div class="front" style="background-image: url(https://unsplash.it/508/508/)">
										<div class="inner">
											<p>String</p>
				              <span>check!</span>
										</div>
									</div>
									<div class="back">
										<div class="inner">
											<p></p>
										</div>
									</div>
								</div>
							</div>
						</div>
				 	</div>
				 	<div id="typeDetail">
				 	
				 	</div>
				</div>
			</li>
			<li class="slide" data-tag="Step2">
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
							<input type="button" value="&quot;hello&quot;" answer="String">
						</div>
						<div class="divShowJava1"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Step3">
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
							<input type="button" value="&quot;hello&quot;" answer="String">
						</div>
						<div class="divShowJava2"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Step4">
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
							<input type="button" value="&quot;hello&quot;" answer="String">
						</div>
						<div class="divShowJava3"></div>
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Step5">
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
							<input type="button" value="&quot;hello&quot;" answer="String">
						</div>
						<div class="divShowJava4"></div>
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