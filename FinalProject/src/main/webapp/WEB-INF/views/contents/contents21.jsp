<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
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


</style>
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/styleContents.css"> -->
<script type="text/javascript">
	$(function() {

		var currentSlide = 0;
		var testCount = 0;

		var checkStr = '<button class="check">CHECK</button>';
		$('#checkBtnDiv').html(checkStr);

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

		$('.check').on('click', goToCheck);
		function goToCheck() {
			//alert(currentSlide);
			//if (currentSlide == 0) {
			//var slideNumber = "71"+currentSlide+1;
			var cNum = currentSlide + 1;
			//alert("cNum : "+cNum);
			var answer = $('#answer' + currentSlide).val();
			//alert(answer);
			$
					.ajax({
						url : "contents211",
						type : "POST",
						//contentType : "application/json; charset=utf-8",
						//dataType : "json",
						data : {
							cNum : cNum,
							answer : answer
						},
						success : function(result) {
							//alert('success');
							//alert(result);
							var resultStr = '';
							if (result == false) {
								resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="50px"> 오답입니다.</div>';
								//resultStr += '<div class="resultMsg">정답입니다.</div>';
								$('#answerResultDiv').html(resultStr);
							} else if (result == true) {
								resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="50px"> 정답입니다.</div>';
								//resultStr += '<div class="resultMsg">오답입니다.</div>';
								$('#answerResultDiv').html(resultStr);
							}
							//if (result) {
							$('#checkBtnDiv').html("");
							var str = '<button class="next">next</button>';
							$('#nextBtnDiv').html(str);
							$('.next').on('click', goToNextSlide);
							//}
						},
						error : function(err) {
							console.log(err);
							alert("fail");
						}
					});
			//} 
		}

		function goToNextSlide() {
			$('#answerResultDiv').html("");
			//if(currentSlide >= slideCount - 1) return; 
			if (currentSlide >= slideCount - 1) {
				location.href = "contentsHome";
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
			$('#checkBtnDiv').html(checkStr);
			$('#nextBtnDiv').html("");
			$('.check').on('click', goToCheck);
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
		//$('.check').on('click', goToCheck);
		//$('.next').on('click', goToNextSlide);
		$('.previous').on('click', goToPreviousSlide);

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
			<li class="slide" data-tag="INT">
				<div class="sized-container" >
						<jsp:include page="contents211.jsp" flush="true" />
				</div>
			</li>
			<li class="slide" data-tag="DOUBLE">
				<div class="sized-container">
					<!-- <h1></h1> -->
					<h2>자료형에 맞는 변수를 골라주세요!</h2>
					
				</div>
			</li>
			<li class="slide" data-tag="STRING">
				<div class="sized-container">
					<!-- <h1></h1> -->
					<h2>자료형에 맞는 변수를 골라주세요!</h2>
					
				</div>
			</li>
			<li class="slide" data-tag="BOOLEAN">
				<div class="sized-container">
				
				</div>
			</li>

		</ul>
	</div>
	<div class="full-width-container">
		<div class="button-container sized-container">
			<div id="checkBtnDiv"></div>
			<div id="nextBtnDiv"></div>
			<!-- <button class="next">next</button> -->
			<button class="previous">previous</button>
			<div id="answerResultDiv"></div>
		</div>
	</div>

</body>
</html>