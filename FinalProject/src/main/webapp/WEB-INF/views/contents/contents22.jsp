<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasyCodingU</title>
<link rel="stylesheet" type="text/css" href="../resources/css/styleContents.css?ver=1">
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
	max-height: 450px;
}

.sized-container {
	max-width: 900px;
	height: 30px;
	width: 100%;
	margin: 0 auto;
}

.slide-container {
	position: relative;
	left: 0;
	overflow: hidden;
	height: 500px;
}

.slide {
	float: left;
	height: 50vh;
}

.slide .sized-container {
	padding: 10px 25px;
}

.button-container {
	border-top: 1px solid black;
	overflow: hidden;
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

<script type="text/javascript">
	$(function() {
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
				var $indicator = $('<div>').addClass('indicator'), 
				$progressBarContainer = $('<div>').addClass('progress-bar-container'),
				$progressBar = $('<div>').addClass('progress-bar'),
				indicatorTagText = $slide.eq(i).attr('data-tag'), 
				$tag = $('<div>').addClass('tag').text(indicatorTagText);
				$indicator.append($tag);
				$progressBarContainer.append($progressBar);
				$pagination.append($indicator).append($progressBarContainer);
			}
			$pagination.find('.indicator').eq(0).addClass('active');
		}
		function goToCheck() {
			var cNum = currentSlide + 1;
			var checkedValue = $('#checkedValue' + currentSlide).val();
			
		}
		function goToNextSlide() {
			$('#answerResultDiv').html("");
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
			$('#nextBtnDiv').html("");
			$('#javaCodeDiv').html("");
			
		
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
		
		
		
	
		
		$("#name1").on('change', function() {
			var name1 = document.getElementById('name1').value;
			var name11 = document.getElementById('names');
			name11.innerHTML = "int" + " " + name1 + " = ";
		
		});
		$("#name2").on('change', function() {
			var name2 = document.getElementById('name2').value;
			var name22 = document.getElementById('names');
			name22.innerHTML = "double" + " " + name2 + " = ";
		});
		$("#name3").on('change', function() {
			var name3 = document.getElementById('name3').value;
			var name33 = document.getElementById('names');
			name33.innerHTML = "String" + " " + name3 + " = ";
		});
		$("#name4").on('change', function() {
			var name4 = document.getElementById('name4').value;
			var name44 = document.getElementById('names');
			name44.innerHTML = "boolean" + " " + name4 + " = ";
		});

	
		$("#images div img").draggable({
			start : function(event, ui) {
				$(this).draggable("option", "revert", true);
				$("#images div img").css("zIndex", 10);
				$(this).css("zIndex", 100);
				
			}
		
		
		});
		var count = 0;
		$("#boards img").droppable({
			drop : function(event, ui) {
				var droptitle = ui.draggable.attr("title");
				var dragid = $(this).attr("id");
				//alert(droptitle); - 스티커
				//alert(dragid);- 박스
				var dropid = ui.draggable.attr("id");
				var resultStr = '';
				
				// div에 값 출력하기
				//alert(dragid+names+"="+dropid);
				//alert(dragid+"="+dropid);
				if (dragid == droptitle) {
					ui.draggable.hide();
					
					//'<div class="javaCodeDiv"></div>'
					$('#javaCodeDiv').html(dragid+"="+dropid);
					resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png"  width="200px"></div>';
					$('#answerResultDiv').html(resultStr);
					$('.next').removeAttr('disabled');
					$('.next').off().on('click', goToNextSlide);
					
					
					
					
					if (droptitle == "boolean") {
						document.getElementById('names').innerHTML = "Boolean"
								+ " "
								+ document.getElementById('name4').value
								+ " = "
								+ ui.draggable.attr("value");
					}

					if (droptitle == "string") {
						document.getElementById('names').innerHTML = "String"
								+ " "
								+ document.getElementById('name3').value
								+ " = "
								+ ui.draggable.attr("value");
					}
					if (droptitle == "double") {
						document.getElementById('names').innerHTML = "Double"
								+ " "
								+ document.getElementById('name2').value
								+ " = "
								+ ui.draggable.attr("value");
					}
					if (droptitle == "int") {
						document.getElementById('names').innerHTML = "Int"
								+ " "
								+ document.getElementById('name1').value
								+ " = "
								+ ui.draggable.attr("value");
					}
					
					ui.draggable.draggable("option", "revert", false);
					var droppableOffset = $(this).offset();
					var x = droppableOffset.left + 1;
					var y = droppableOffset.top + 1;
					ui.draggable.offset({
						top : y,
						left : x
					});
				}
			}
		});
	});
	
	$(document).ready(function() {
		$("#images div").sort(function() {
			return Math.random() * 10 > 5 ? 1 : -1;
		}).each(function() {
			$(this).appendTo($(this).parent());
		});
		$("#boards div").sort(function() {
			return Math.random() * 10 > 5 ? 1 : -1;
		}).each(function() {
			$(this).appendTo($(this).parent());
		});
		
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

			<li class="slide" data-tag="Quiz-1">
				<div class="sized-container">
					<div id="">
						<jsp:include page="contents221.jsp" flush="true" />
					</div>
				</div>
			</li>
			<li class="slide" data-tag="Quiz-2">
				<div class="sized-container">

					<div id="">
						<jsp:include page="contents222.jsp" flush="true" />
					</div>
				</div>
		</ul>
	</div>
        
        
        <div class="full-width-container">
		<div class="button-container sized-container">
			<div id="nextBtnDiv"></div>
			<button class="next">next</button>
			
			<div id="answerResultDiv"></div>
			<div id="javaCodeDiv" style="font-size: 30px; font-weight: bolder;" ></div>
			
		</div>
	</div>
</body>
</html>