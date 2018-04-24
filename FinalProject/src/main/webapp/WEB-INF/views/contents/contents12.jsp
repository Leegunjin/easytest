<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Drag & Drop</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
	$(function(){
		var currentSlide = 0;
		var testCount = 0;
		
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
		
		var a = $('#textTest').val();
		$('#textTest').keyup(function(){
			alert(a);
		});
		$("#images div img").draggable({
			start: function(event,ui) {
				$(this).draggable( "option", "revert", true );
				$("#images div img").css("zIndex",10);
				$(this).css("zIndex",100);
			}
		});
		var count = 0;
		$("#boards div").droppable({
			drop: function(event,ui) {
				var dropanswer = $(this).attr("answer");
				var drophtml = $(this).html();
				var draganswer = ui.draggable.attr("answer");
				if( draganswer == dropanswer ) {
					//$('#ansDiv').append("<img src='resources/img/number3.png'>");
					//$('#ansDiv').append();
					$(this).remove();
					
					count++;
					if(count == 3){
						//alert(count);
						$('#showJava').show();
						$('#goNext').show();
					}
					$(this).html('');
					ui.draggable.draggable( "option", "revert", false );
					var droppableOffset = $(this).offset();
					var x = droppableOffset.left + 1;
					var y = droppableOffset.top + 1;
					ui.draggable.offset({ top: y, left: x });
				}
			}
		});
	});
	$(document).ready(function(){
		$("#images div").sort(function(){
			return Math.random()*10 > 5 ? 1 : -1;
		}).each(function(){
			$(this).appendTo( $(this).parent() );    
		});
		$("#boards div").sort(function(){
			return Math.random()*10 > 5 ? 1 : -1;
		}).each(function(){
			$(this).appendTo( $(this).parent() );    
		});
	});
</script>
<style>
	*{
		border: none;
	}
	
	
	
	#images > div, #boards > div {
		float:left;
		width:100px;
		height:100px;
		/* border:1px solid #000; */
		margin:5px;
	}
	#images div img {
		width:100px;
		height:100px;
		margin-left: 10px;
	}
	#boards {
		clear:both;
	}
	#boards > div {
		font-size:2em;
		line-height:100px;
		text-align:center;
		margin: 5px;
	}
	.ansDiv{
		background-color: yellow;
	}
	
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

li {
	text-align: center;
}

li div{
	display: inline-block;
	text-align: center;
}

/* #images{
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	height: 170px;
	margin-top: 20px;
	padding: 10px;
	border: 1px solid orange; 
	border-radius: 1em;
	text-align: center;
}

#boards{
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	height: 170px;
	padding: 10px; 
	border: 1px solid orange; 
	border-radius: 1em;
	/* text-align: center; */
} */

#images div div, #boards div div{
	display: inline-block;
}

#images > div, #board > div{
	text-align: center;
	margin: 10px;
}
</style>
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
				<div id="images">
						<div><img src="../resources/img/number1.png" answer="int" id="int"></div>
						<div><img src="../resources/img/double2.png" answer="double" id="double"></div>
						<div><img src="../resources/img/true.png" answer="boolean" id="boolean"></div>
						<div><img src="../resources/img/name.png" answer="String" id="String"></div>
				</div>
				<div id="boards">
						<div answer="int" id="test1">
							<img src="../resources/img/basket.png" answer="int">
						</div>
						<div answer="double" id="test2">
							<img src="../resources/img/basket.png" answer="double">
						</div>
						<div answer="boolean" id="test3">
							<img src="../resources/img/basket.png" answer="boolean">
						</div>
						<div answer="String">
							<img src="../resources/img/basket.png" answer="String">
						</div>
				</div>
			</div>
		</li>
		<li class="slide" data-tag="int">
			<div class="sized-container" >
				<div id="images">
					<div><img src="resources/img/number1.png" title="int" id="int"></div>
					<div><img src="resources/img/number2.png" title="int" id="double"></div>
					<div><img src="resources/img/basket.png" title="boolean" id="boolean"></div>
					<div><img src="resources/img/basket.png" title="String" id="String"></div>
				</div>
				<div id="boards">
					<div title="int" id="test1">
						<img src="resources/img/basket.png" title="int">
					</div>
					<div title="double" id="test2">
						<img src="resources/img/basket.png" title="double">
					</div>
					<div title="boolean" id="test3">
						<img src="resources/img/basket.png" title="boolean">
					</div>
					<div title="String">
						<img src="resources/img/basket.png" title="String">
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