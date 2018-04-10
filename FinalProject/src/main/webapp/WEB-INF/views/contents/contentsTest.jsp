<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TEST PAGE</title>
<style type="text/css">
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
	font-size: 15px;
	line-height: 25px;
	margin-top: 10px;
}

button {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 0;
	padding: 7px 25px;
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
	max-width: 1100px;
	width: 600px;
	margin: 0 auto;
	width: 80%;
}

.slide-container {
	position: relative;
	height: 500px;
	left: 0;
	overflow: hidden;
}

.slide {
	float: left;
}

.slide .sized-container {
	padding: 5px 10px;
}

.button-container {
	border-top: 1px solid black;
	overflow: hidden;
	padding-top: 15px;
}

.button-container button {
	float: right;
	margin-left: 30px;
}

.pagination-container {
	margin-top: 60px;
}

.pagination {
	width: 100%;
	text-align: center;
	padding: 45 25px;
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
</style>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		var currentSlide = 0, $slideContainer = $('.slide-container'), $slide = $('.slide'), slideCount = $slide.length, animationTime = 300;

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

		function goToNextSlide() {
			if (currentSlide >= slideCount - 1)
				return;
			var windowWidth = $(window).width();
			currentSlide++;
			$slideContainer.animate({
				left : -(windowWidth * currentSlide)
			});
			setActiveIndicator();
			$('.progress-bar').eq(currentSlide - 1).animate({
				width : '100%'
			}, animationTime);
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
		$('.next').on('click', goToNextSlide);
		$('.previous').on('click', goToPreviousSlide);
	});
</script>
</head>
<body>

	<div class="pagination-container full-width-container">
		<div class="sized-container">
			<div class="pagination"></div>
		</div>
	</div>
	<div class="viewport full-width-container" style="padding: 5px;">
		<ul class="slide-container">

			<li class="slide" data-tag="About Me">
				<div class="sized-container">
					<h1>더블설명</h1>
					<h2>Information about this section.</h2>

				</div>
			</li>
			<li class="slide" data-tag="Chapter Info">
				<div class="sized-container">
					<div id="">
						<jsp:include page="contents221.jsp" flush="true" />
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Concept">
				<div class="sized-container">

					<div id="">
						<jsp:include page="contents222.jsp" flush="true" />
					</div>
				</div>
		</ul>
	</div>
	<div class="full-width-container">

		<div class="button-container sized-container">
			<button class="javaCode">JAVACODE 보기</button>
			<button class="next">next</button>
			<button class="previous">previous</button>
		</div>
	</div>


</body>
</html>