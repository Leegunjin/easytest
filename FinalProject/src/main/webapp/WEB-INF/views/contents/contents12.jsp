<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script type="text/javascript">

$(function() {
	$('div[answer="no"] p:nth-child(2)').hide();
	
	$('div[sort="true"]').sort(function(){
		return Math.random()*10 > 5 ? 1 : -1;
	}).each(function(){
		$(this).appendTo( $(this).parent() );    
	});
	
	$('#draggable').draggable({
		start: function(event,ui) {
			$(this).draggable( "option", "revert", true );
		}
	});
	
	$('#next').attr('disabled', false);
	$('#previous').hide();
	$('#btnShowJava').hide();
	$('.buttonDiv + div').hide();
	$('#answerResultDiv').empty();
	
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
			resultStr = '<div class="resultMsg"><img src="../../resources/img/yesanswer.png" width="250px"> </div>';
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
			resultStr = '<div class="resultMsg"><img src="../../resources/img/noanswer.png" width="250px"> </div>';
            resultStr += '<div> 틀렸습니다! 그건 '+ clickedAns +' 이예요 </div>';
            $('#answerResultDiv').html(resultStr);
		}
	});
	
	var currentSlide = 0;
	
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

	var title1 = "마우스를 올려 자료형을 확인해 보세요";
	var title2 = "int 자료형을 골라보세요";
	var title3 = "double 자료형을 골라보세요";
	var title4 = "boolean 자료형을 골라보세요"
	var title5 = "String 자료형을 골라보세요"
	$('#next').on('click',goToNextSlide);
	function goToNextSlide() {
		//alert(currentSlide);
		switch(currentSlide){
			case 0:
				$('#contentsTitle').text(title2);
				break;
			case 1:
				$('#contentsTitle').text(title3);
				break;
			case 2:
				$('#contentsTitle').text(title4);
				break;
			case 3:
				$('#contentsTitle').text(title5);
				break;
		}
		/* if(currentSlide == 0){
			$('#contentsTitle').text(title2);
		} */
		$('#answerResultDiv').html("");
		if (currentSlide >= slideCount - 1) {
			location.href = "clearChapter?c_num=120";
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
		$('#answerResultDiv').empty();
		$('#previous').show();
	}
	
	function goToPreviousSlide() {
		if (currentSlide <= 0)
			return;
		if(currentSlide == 1){
			$('#contentsTitle').text(title1);
		}
		switch(currentSlide){
			case 1:
				$('#contentsTitle').text(title1);
				break;
			case 2:
				$('#contentsTitle').text(title2);
				break;
			case 3:
				$('#contentsTitle').text(title3);
				break;
			case 4:
				$('#contentsTitle').text(title4);
				break;
			case 5:
				$('#contentsTitle').text(title5);
				break;
		}
		
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
		/* $('#btnShowJava').show(); */
		$('#answerResultDiv').empty();
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
	
	$('li[data-tag="int"] div[slide="2"]').on('click', contentsCheck);
	$('li[data-tag="double"] div[slide="3"]').on('click', contentsCheck);
	$('li[data-tag="boolean"] div[slide="4"]').on('click', contentsCheck);
	$('li[data-tag="String"] div[slide="5"]').on('click', contentsCheck);
	
	var ansCount = 0;
	function contentsCheck(){
		var answer = $(this).attr('answer');
		if(answer == 'yes'){
			$(this).empty();
			$('#answerResultDiv').empty();
			ansCount++;
			//alert(ansCount);
			if($(this).attr('slide')=="4"){
				if(ansCount == 2){
					$('#next').attr('disabled',false);
					ansCount = 0;
				}
			}else{
				if(ansCount == 4){
					$('#next').attr('disabled',false);
					ansCount = 0;
				}	
			}
		}else{
			resultStr = '<div class="resultMsg"><img src="../../resources/img/noanswer.png" width="200px"></div>';
			$('#answerResultDiv').html(resultStr);
			$(this).addClass('wrongAns');
			
		}
	};

});

</script>
<style type="text/css">
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

.container, .containerDrop{
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
	min-height: 150px;
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

.container .back, .containerDrop .back{
    -webkit-transform: rotateY(180deg);
            transform: rotateY(180deg);
    -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
}

.container .front, .containerDrop .front{
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
  font-size: 20px;
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


/* 탬플릿 css */
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

.wrongAns{
	border: 3px solid red;
	border-radius: 10px;
}


</style>
<title>Insert title here</title>
</head>
<body style="overflow-x: hidden">

<div class="pagination-container full-width-container">
		<div class="sized-container">
			<div class="pagination"></div>
		</div>
	</div>
	<div class="viewport full-width-container" style="padding: 5px;">
	<h1 id="contentsTitle">마우스를 올려 자료형을 확인해보세요</h1>
		<ul class="slide-container">
			<li class="slide" data-tag="Step1">
				<div class="sized-container">
					<!-- <h1>마우스를 올려 자료형을 확인해보세요</h1> -->
					<div class="wrapper">
					  <div class="cols">
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
									<div class="inner">
										<p>4</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
									  <p>int</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="url(https://unsplash.it/506/506/)">
									<div class="inner">
										<p>254</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>int</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="background-image: url(https://unsplash.it/502/502/)">
									<div class="inner">
										<p>0.7</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>double</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="background-image: url(https://unsplash.it/503/503/)">
									<div class="inner">
										<p>19.47</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>double</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="background-image: url(https://unsplash.it/504/504/">
									<div class="inner">
										<p>true</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>boolean</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="background-image: url(https://unsplash.it/505/505/)">
									<div class="inner">
										<p>false</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>boolean</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="background-image: url(https://unsplash.it/506/506/)">
									<div class="inner">
										<p>"Hello"</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>String</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container">
								<div class="front" style="background-image: url(https://unsplash.it/508/508/)">
									<div class="inner">
										<p>"Java"</p>
					            <span>Check</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>String</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
		  		</div>
			</li>
			<li class="slide" data-tag="Step2">
				<div class="sized-container" >
					<div class="wrapper">
					  <div class="cols">
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="2" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
									<div class="inner">
										<p>28</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
									  <p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="2" answer="yes">
								<div class="front" style="url(https://unsplash.it/511/511/)">
									<div class="inner">
										<p>6428</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="2" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/502/502/)">
									<div class="inner">
										<p>0</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="2" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/503/503/)">
									<div class="inner">
										<p>-5</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="2" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/504/504/">
									<div class="inner">
										<p>"here"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>String</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="2" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/505/505/)">
									<div class="inner">
										<p>true</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>boolean</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="2" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/506/506/)">
									<div class="inner">
										<p>"37"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>String</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="containerDrop" slide="2" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/508/508/)">
									<div class="inner">
										<p>"easy"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p>String</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
		  		</div>
			</li>
			<li class="slide" data-tag="Step3">
				<div class="sized-container" >
					<div class="wrapper">
					  <div class="cols">
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="3" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
									<div class="inner">
										<p>28</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
									  <p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="3" answer="no">
								<div class="front" style="url(https://unsplash.it/511/511/)">
									<div class="inner">
										<p>6428</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="3" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/502/502/)">
									<div class="inner">
										<p>42.195</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="3" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/503/503/)">
									<div class="inner">
										<p>-3.0</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="3" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/504/504/">
									<div class="inner">
										<p>"hello"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="3" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/505/505/)">
									<div class="inner">
										<p>false</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="3" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/506/506/)">
									<div class="inner">
										<p>0.25</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="containerDrop" slide="3" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/508/508/)">
									<div class="inner">
										<p>4.27</p>
					            <span>Click me!</span>
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
		  		</div>
			</li>
			<li class="slide" data-tag="Step4">
				<div class="sized-container" >
					<div class="wrapper">
					  <div class="cols">
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="4" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
									<div class="inner">
										<p>31</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
									  <p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="4" answer="no">
								<div class="front" style="url(https://unsplash.it/511/511/)">
									<div class="inner">
										<p>62</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="4" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/502/502/)">
									<div class="inner">
										<p>0.52</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="4" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/503/503/)">
									<div class="inner">
										<p>true</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="4" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/504/504/">
									<div class="inner">
										<p>false</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="4" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/505/505/)">
									<div class="inner">
										<p>"false"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="4" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/506/506/)">
									<div class="inner">
										<p>"true"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="containerDrop" slide="4" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/508/508/)">
									<div class="inner">
										<p>"bye"</p>
					            <span>Click me!</span>
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
		  		</div>
			</li>
			<li class="slide" data-tag="Step5">
				<div class="sized-container" >
					<div class="wrapper">
					  <div class="cols">
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="5" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
									<div class="inner">
										<p>"hello"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
									  <p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="5" answer="yes">
								<div class="front" style="url(https://unsplash.it/511/511/)">
									<div class="inner">
										<p>"sum41"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="5" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/502/502/)">
									<div class="inner">
										<p>"one"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="5" answer="yes">
								<div class="front" style="background-image: url(https://unsplash.it/503/503/)">
									<div class="inner">
										<p>"true"</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="5" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/504/504/">
									<div class="inner">
										<p>false</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="5" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/505/505/)">
									<div class="inner">
										<p>524</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="container" slide="5" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/506/506/)">
									<div class="inner">
										<p>true</p>
					            <span>Click me!</span>
									</div>
								</div>
								<div class="back">
									<div class="inner">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col" sort="true" ontouchstart="this.classList.toggle('hover');">
							<div class="containerDrop" slide="5" answer="no">
								<div class="front" style="background-image: url(https://unsplash.it/508/508/)">
									<div class="inner">
										<p>0</p>
					            <span>Click me!</span>
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