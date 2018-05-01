<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<title>Contents41</title>
<style type="text/css">
	@charset "UTF-8";
	*, html, body {
	  font-family: "TrebuchetMS", trebuchet, sans-serif;
	}
	
	* {
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
	  width: 100%;
	  margin: 0 auto;
	}
	
	.slide-container {
	  position: relative;
	  left: 0;
	  overflow: hidden;
	  width : 13720px;
	}
	
	.slide {
	  float: left;
	}
	.slide .sized-container {
	  padding: 65px 25px;
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
	  width: 4%;
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
	ul{
		list-style-type: none;
	}
	
	
	
	/* CONTAINERS */
		
		.container {max-width: 850px; width: 100%; margin: 0 auto;}
		.four { width: 90%; max-width: 100%;}
		
		
		/* COLUMNS */
		
		.col {
		  display: block;
		  /* float:left; */
		  margin-left: 6%;
		  margin-bottom: 2%;
		}
		
		.col:first-of-type { margin-left: 6%; }
		
		/* CLEARFIX */
		
		.cf:before,
		.cf:after {
		    content: " ";
		    display: table;
		}
		
		.cf:after {
		    clear: both;
		}
		
		.cf {
		    *zoom: 1;
		}
		
		/* FORM */
		
		.form .plan input, .form .payment-plan input, .form .payment-type input{
			display: none;
		}
		
		.form label{
			position: relative;
			/* margin-left: 5%; */
			color: #fff;
			background-color: #aaa;
			font-size: 26px;
			text-align: center;
			height: 80px;
			line-height: 80px;
			display: block;
			cursor: pointer;
			border: 3px solid transparent;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
		}
		
		.form .plan input:checked + label, .form .payment-plan input:checked + label, .form .payment-type input:checked + label{
			border: 3px solid #fff;
			background-color: #37B595;
		}
		
		.form .plan input:checked + label:after, form .payment-plan input:checked + label:after, .form .payment-type input:checked + label:after{
			content: "\2713";
			width: 40px;
			height: 40px;
			line-height: 40px;
			border-radius: 100%;
			border: 2px solid #fff;
			background-color: #37B595;
			z-index: 999;
			position: absolute;
			top: -10px;
			right: -10px;
		}
		
		.submit{
			padding: 15px 60px;
			display: inline-block;
			border: none;
			margin: 20px 0;
			background-color: #37B595;
			color: #fff;
			border: 2px solid #fff;
			font-size: 18px;
			-webkit-transition: transform 0.3s ease-in-out;
			-o-transition: transform 0.3s ease-in-out;
			transition: transform 0.3s ease-in-out;
		}
		
		.submit:hover{
			cursor: pointer;
			transform: rotateX(360deg);
		}
		
		.question{
			font-size: 30px;
			text-align: center;
			color: #232931;
		}
		
		#if1{
			margin-left: 8%;
		}
</style>
<script type="text/javascript">
	$(function() {
		var currentSlide = 0,
	    $slideContainer = $('.slide-container'),
	    $slide = $('.slide'),
	    slideCount = $slide.length,
	    animationTime = 300;

	function setSlideDimensions () {
	  var windowWidth = $(window).width();
	  $slideContainer.width(windowWidth * slideCount);
	  $slide.width(windowWidth);
	}

	function generatePagination () {
	  var $pagination = $('.pagination');
	  for(var i = 0; i < slideCount; i ++){
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

	function goToNextSlide () {
		$('#answerResultDiv').html("");
	  /* if(currentSlide >= slideCount - 1) return; */
	  if(currentSlide >= slideCount-1){
		  location.href = "clearChapter?c_num=411";
	  }
	  var windowWidth = $(window).width();
	  currentSlide++;
	  $slideContainer.animate({
	    left: -(windowWidth * currentSlide)
	  });
	  setActiveIndicator();
	  $('.progress-bar').eq(currentSlide - 1).animate({
	    width: '100%'
	  }, animationTime);
	}

	function goToPreviousSlide () {
	  if(currentSlide <= 0) return; 
	  var windowWidth = $(window).width();
	  currentSlide--;
	  $slideContainer.animate({
	    left: -(windowWidth * currentSlide)
	  }, animationTime);
	  setActiveIndicator();
	  $('.progress-bar').eq(currentSlide).animate({
	    width: '0%'
	  }, animationTime);
	}

	function postitionSlides () {
	  var windowWidth = $(window).width();
	  setSlideDimensions();
	  $slideContainer.css({
	    left: -(windowWidth * currentSlide)
	  }, animationTime);
	}

	function setActiveIndicator () {
	  var $indicator = $('.indicator');
	  $indicator.removeClass('active').removeClass('complete');
	  $indicator.eq(currentSlide).addClass('active');
	  for(var i = 0; i < currentSlide; i++){
	    $indicator.eq(i).addClass('complete');
	  }
	}

		setSlideDimensions();
		generatePagination();
		$(window).resize(postitionSlides);
		$('.next').on('click', goToNextSlide);
		$('.previous').on('click', goToPreviousSlide);
		
		
		var resultStr = '';
		$('input').on('click', function() {
			/* var clickBtn = $(this).val(); */
			var clickAns = $(this).attr('answer');
	        var slideAns = $(this).parent().attr('answer');
	        
	        if (clickAns == slideAns) {
	        	//alert("test");
	        	resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"> </div>';
	        	$('#answerResultDiv').html(resultStr);
			} else {
				resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
				$('#answerResultDiv').html(resultStr);
			}
		});
	});
</script>
</head>
<body style="overflow-x:hidden">
	
<div class="pagination-container full-width-container">
  <div class="sized-container">
    <div class="pagination"></div>
  </div>
</div>
<div class="viewport full-width-container">
  <ul class="slide-container">
    <li class="slide" data-tag="Step1">
      <div class="sized-container">
        <jsp:include page="contents411.jsp" flush="true" />
      </div>
    </li>
    <li class="slide" data-tag="Step2">
      <div class="sized-container">
      	<%-- <jsp:include page="contents411q.jsp" flush="true" /> --%>
      	<div>
			<p class="question">다음 중 정확한 if문을 고르세요.</p>
		</div>
		<br>
		<div class="container">
			<form class="form cf">
				<section class="plan cf" answer="if1">
					<input type="radio" name="radio1" id="if1" value="if1" answer="if1"><label class="free-label four col" for="if1">if(조건){ 실행문 }</label>
					<input type="radio" name="radio1" id="if2" value="if2" answer="if2"><label class="basic-label four col" for="if2">if(실행문){ 조건 }</label>
					<input type="radio" name="radio1" id="if3" value="if3" answer="if3"><label class="premium-label four col" for="if3">if{조건}( 실행문 )</label>
				</section>
			</form>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step3">
      <div class="sized-container">
      	<jsp:include page="contents412.jsp" flush="true" />
      </div>
    </li>
    <li class="slide" data-tag="Step4">
      <div class="sized-container">
      	<div>
			<p class="question">다음 중 정확한 if-else문을 고르세요.</p>
		</div>
		<br>
		<div class="container">
			<form class="form cf">
				<section class="plan cf" answer="else2">
					<input type="radio" name="radio1" id="else1" value="else1" answer="else1"><label class="free-label four col" for="else1">else{   }if(조건){ 실행문 }</label>
					<input type="radio" name="radio1" id="else2" value="else2" answer="else2"><label class="basic-label four col" for="else2">if(조건){ 실행문 }else{   }</label>
					<input type="radio" name="radio1" id="else3" value="else3" answer="else3"><label class="premium-label four col" for="else3">if{조건}( 실행문 )</label>
				</section>
			</form>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step5">
      <div class="sized-container">
      	<jsp:include page="contents417.jsp" flush="true" />
      </div>
    </li>
    <li class="slide" data-tag="Step6">
      <div class="sized-container">
      	<div>
			<p class="question">다음 중 정확한 else if문을 고르세요.</p>
		</div>
		<br>
		<div class="container">
			<form class="form cf">
				<section class="plan cf" answer="elseif3">
					<input type="radio" name="radio1" id="elseif1" value="elseif1" answer="elseif1"><label class="free-label four col" for="elseif1">else if(조건2){실행문2}if(조건1){실행문1}</label>
					<input type="radio" name="radio1" id="elseif2" value="elseif2" answer="elseif2"><label class="basic-label four col" for="elseif2">if(조건1){실행문1}else(조건2){실행문2}</label>
					<input type="radio" name="radio1" id="elseif3" value="elseif3" answer="elseif3"><label class="premium-label four col" for="elseif3">if(조건1){실행문1}else if(조건2){실행문2}</label>
				</section>
			</form>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step7">
      <div class="sized-container">
      	<jsp:include page="contents413.jsp" flush="true" />
      </div>
    </li>
    <li class="slide" data-tag="Step8">
      <div class="sized-container">
      	<div>
			<p class="question">다음 중 정확한 이중 if문을 고르세요.</p>
		</div>
		<br>
		<div class="container">
			<form class="form cf">
				<section class="plan cf" answer="ifif1">
					<input type="radio" name="radio1" id="ifif1" value="ifif1" answer="ifif1"><label class="free-label four col" for="ifif1">if(조건1) {if(조건2){실행문}}</label>
					<input type="radio" name="radio1" id="ifif2" value="ifif2" answer="ifif2"><label class="basic-label four col" for="ifif2">if(조건1) {실행문1} if{실행문2}</label>
					<input type="radio" name="radio1" id="ifif3" value="ifif3" answer="ifif3"><label class="premium-label four col" for="ifif3">if(조건1) {실행문1} else{실행문2}</label>
				</section>
			</form>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step9">
      <div class="sized-container">
      	<jsp:include page="contents414.jsp" flush="true" />
      </div>
    </li>
    <li class="slide" data-tag="Step10">
      <div class="sized-container">
      	<div>
			<p class="question">다음 중 정확한 연속 if문을 고르세요.</p>
		</div>
		<br>
		<div class="container">
			<form class="form cf">
				<section class="plan cf" answer="ifand1">
					<input type="radio" name="radio1" id="ifand1" value="ifand1" answer="ifand1"><label class="free-label four col" for="ifand1">if(조건1){실행문} if(조건2){실행문}</label>
					<input type="radio" name="radio1" id="ifand2" value="ifand2" answer="ifand2"><label class="basic-label four col" for="ifand2">if(조건1) else{실행문1}</label>
					<input type="radio" name="radio1" id="ifand3" value="ifand3" answer="ifand3"><label class="premium-label four col" for="ifand3">if(조건1){실행문1} else if{실행문2}</label>
				</section>
			</form>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step11">
      <div class="sized-container">
      	<jsp:include page="contents415.jsp" flush="true" />
      </div>
    </li>
    <li class="slide" data-tag="Step12">
      <div class="sized-container">
      	<div>
			<p class="question">다음 중 정확한 switch문을 고르세요.</p>
		</div>
		<br>
		<div class="container">
			<form class="form cf">
				<section class="plan cf" answer="switch2">
					<input type="radio" name="radio1" id="switch1" value="switch1" answer="switch1"><label class="free-label four col" for="switch1">switch(조건)</label>
					<input type="radio" name="radio1" id="switch2" value="switch2" answer="switch2"><label class="basic-label four col" for="switch2">switch(조건){case:"ex" break;}</label>
					<input type="radio" name="radio1" id="switch3" value="switch3" answer="switch3"><label class="premium-label four col" for="switch3">switch(case:"ex" break;){조건}</label>
				</section>
			</form>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step13">
      <div class="sized-container">
      	<jsp:include page="contents416.jsp" flush="true" />
      </div>
    </li>
    <li class="slide" data-tag="Step14">
      <div class="sized-container">
      	<div>
			<p class="question">다음 중 정확한 break을 고르세요.</p>
		</div>
		<br>
		<div class="container">
			<form class="form cf">
				<section class="plan cf" answer="break3">
					<input type="radio" name="radio1" id="break1" value="break1" answer="break1"><label class="free-label four col" for="break1">continue;</label>
					<input type="radio" name="radio1" id="break2" value="break2" answer="break2"><label class="basic-label four col" for="break2">stop;</label>
					<input type="radio" name="radio1" id="break3" value="break3" answer="break3"><label class="premium-label four col" for="break3">break;</label>
				</section>
			</form>
		</div>
      </div>
    </li>
  </ul>
</div>
<div class="full-width-container">
  <div class="button-container sized-container">
    <button class="next">next</button>
    <button class="previous">previous</button>
    <div id="answerResultDiv"></div>
  </div>
</div>
</body>
</html>