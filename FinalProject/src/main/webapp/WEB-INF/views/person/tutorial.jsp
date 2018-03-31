<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

  <head>
		<meta charset="UTF-8">
		<title> Tutorial Slider </title>
		<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" 
		rel="stylesheet">
				       
        <link rel="stylesheet" type="text/css" href="../resources/css/styleTutorial.css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<script>
		
		$(document).ready(function() {
			
			var $slider = $(".slider"),
				$slideBGs = $(".slide__bg"),
				diff = 0,
				curSlide = 0,
				numOfSlides = $(".slide").length-1,
				animating = false,
				animTime = 500,
				autoSlideTimeout,
				autoSlideDelay = 2600,
				$pagination = $(".slider-pagi");
				
		function createBullets() {
				for (var i = 0; i < numOfSlides+1; i++) {
					var $li = $("<li class='slider-pagi__elem'></li>");
						$li.addClass("slider-pagi__elem-"+i).data("page",i);
						if (!i) $li.addClass("active");
						$pagination.append($li);
				}
		};
		
		createBullets();
		
		function manageControls() {
			$(".slider-control").removeClass("inactive");
			if (!curSlide) $(".slider-control.left").addClass("inactive");
			if (curSlide === numOfSlides) $(".slider-control.right").addClass("inactive");
		};
		
		function autoSlide() {
			autoSlideTimeout = setTimeout(function() {
				curSlide++;
				if (curSlide > numOfSlides) curSlide = 0;
				changeSlides();
			}, autoSlideDelay);
		};
		
		autoSlide();
		
		function changeSlides(instant) {
			if (!instant) {
				animating = true;
				manageControls();
				$slider.addClass("animating");
				$slider.css("top");
				$(".slide").removeClass("active");
				$(".slide-"+curSlide).addClass("active");
				setTimeout(function() {
					$slider.removeClass("animating");
					animating = false;
				}, animTime);
			}
			
		 window.clearTimeout(autoSlideTimeout);
		 $(".slider-pagi__elem").removeClass("active");
		 $(".slider-pagi__elem-"+curSlide).addClass("active");
		 $slider.css("transform", "translate3d("+ -curSlide*100 +"%,0,0)");
		 $slideBGs.css("transform", "translate3d("+ curSlide*50 +"%,0,0)");
		 diff = 0;
		 autoSlide();
		}
		
		
		function navigateLeft() {
			if (animating) return;
			if (curSlide > 0) curSlide--;
			changeSlides();
		}
		
		function navigateRight() {
			if (animating) return;
			if (curSlide < numOfSlides) curSlide++;
			changeSlides();
		}
		
		
		$(document).on("mousedown touchstart", ".slider", function(e) {
			if (animating) return;
			window.clearTimeout(autoSlideTimeout);
			var startX = e.pageX || e.originalEvent.touches[0].pageX,
				winW = $(window).width();
			diff = 0;
			
		$(document).on("mousemove touchmove", function(e) {
			var x = e.pageX || e.originalEvent.touches[0].pageX;
			diff = (startX - x) / winW * 70;
			if ((!curSlide && diff < 0) || (curSlide === numOfSlides && diff > 0)) diff /= 2;
			$slider.css("transform", "translate3d("+ (-curSlide*100 - diff) +"%,0,0)");
			$slideBGs.css("transform", "translate3d("+ (curSlide*50 + diff/2) +"%,0,0)");
			});
		});
		
		$(document).on("mouseup touchend", function(e) {
			$(document).off("mousemove touchmove");
			if (animating) return;
			if (!diff) {
				changeSlides(true);
				return;
			}	
			if (diff > -8 && diff < 8) {
				changeSlides();
				return;
			}
			if (diff <= -8) {
				navigateLeft();
			}
			if (diff >= 8) {
				navigateRight();
			}
		});
		
		$(document).on("click", ".slider-control", function() {
			if ($(this).hasClass("left")) {
				navigateLeft();
			} else {
				navigateRight();
			}
		});
		
		$(document).on("click", ".slider-pagi__elem", function() {
			curSlide = $(this).data("page");
			changeSlides();
		});
	});
		</script>

  </head>

  <body>
   
 	<div class="slider-container">
 		<div class="slider-control left inactive"> </div> 
 		<div class="slider-control right"> </div>
 		<ul class="slider-pagi"> </ul>
 		<div class="slider">
 			<div class="slide slide-0 active">
 			<div class="slide__bg"> </div>
 			<div class="slide__content"> 
 				<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
 				 <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
 				</svg>    
 				<div class="slide__text">
 				<h2 class="slide__text-heading" style="font-family: 'Open Sans Condensed', sans-serif;">
 				This is Text Test.
 				</h2>
 				<p class="slide__text-desc" style="font-family: 'Open Sans Condensed', sans-serif;">
 				Final Project Group 3 Sosun Kim, Hansol Kim, Heejin Kim, Jiho Joo, Gunjin Lee </p>
 				<a class="slide__text-link" style="font-family: 'Open Sans Condensed', sans-serif;">
 				Learn More</a>
 				</div>
 			</div>
 		</div>
 	
 		<div class="slide slide-1 ">
 			<div class="slide__bg"> </div>
 			<div class="slide__content">
 				<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
 					<path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
 				</svg>
 				<div class="slide__text">
 					<h2 class="slide__text-heading" style="font-family: 'Open Sans Condensed', sans-serif;">
 					이것은 시험용 텍스트 입니다.
 					</h2>
 					<p class="slide__text-desc" style="font-family: 'Open Sans Condensed', sans-serif;">
 					최종 프로젝트 3조 김 소선, 김 한솔, 김 희진, 주 지호, 이 건진
 					</p>
 					<a class="slide__text-link" style="font-family: 'Open Sans Condensed', sans-serif;">
 					더 알고 싶어 </a>
 				</div>
 			</div>
 		</div> 
 		
 		<div class="slide slide-2 ">
 			<div class="slide__bg"> </div>
 			<div class="slide__content">
 				<svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
 					<path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
 				</svg>
 				<div class="slide__text">
 					<h2 class="slide__text-heading" style="font-family: 'Open Sans Condensed', sans-serif;">
 					자바를 무료로 배우세요. 영원히.
 					</h2>
 					<p class="slide__text-desc" style="font-family: 'Open Sans Condensed', sans-serif;">
 					習得した理論を効率よく整理して用いることができると評価を受けている。またそれらの技術を適切に相手に伝えることができる。
 					</p>
 					<a class="slide__text-link" style="font-family: 'Open Sans Condensed', sans-serif;">
 					ワーキング・ホリデー </a>
 				</div>
 			</div>
 		</div> 
 	</div>
 		 
 			<h1 style="text-align: center; font-size: 50px; cursor: pointer; height: 20vh; padding-top: 20px;"
 			onclick="location.href='../home'"> Return Main Page </h1>
 
  </body>

</html>