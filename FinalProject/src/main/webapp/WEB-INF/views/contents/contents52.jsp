<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>[ contents52.jsp ]</title>

<!-- CSS -->
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
	font-family: NanumSquareRound Extrabold;
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
  width: 100%;
  margin: 0 auto;
}
.slide-container {
  margin: 0; 
  padding: 0 1em 0;
  padding-left: 0px;
  position: relative;
  left: 0;
  overflow: hidden;
  width: 6860px;
  height: 575px;
}

.slide {
  float: left;
  list-style-type: none;
}
.slide .sized-container {
  padding: 20px 0px;
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
  margin-top: 50px;
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
  content: "?";
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

[class^="answer"] {
      margin: 0; 
      padding: 0;
      background-color: #f3fafd; 
      border: solid 2px #217093; 
      border-radius: 4px; 
      box-sizing: border-box;
      width: 45px; 
      height: 45px;
      text-align: center;
      font-size: 18pt; 
      color: #353538; 
      font-weight: 600;
      font-style: inherit;
}

ul{
   list-style:none;
   padding-left:0px;
}

.question_div {
	max-width: 800px;
}

.forToWhile_td {
	border: solid 4px #00a8f3;
	border-radius: 5px;
	margin: 10px;
	padding: 20px;
	width: 430px;
}


/* Select Box - 몇 단인지 선택하는 셀렉트 박스 */
[include*="form-input-select()"] {
  display: block;
  padding: 0;
  position: relative;
  /* Set options to normal weight */
  /* ------------------------------------  */
  /* START OF UGLY BROWSER-SPECIFIC HACKS */
  /* ----------------------------------  */
  /* FIREFOX won't let us hide the native select arrow, so we have to make it wider than needed and clip it via overflow on the parent container.
     The percentage width is a fallback since FF 4+ supports calc() so we can just add a fixed amount of extra width to push the native arrow out of view. We're applying this hack across all FF versions because all the previous hacks were too fragile and complex.
     You might want to consider not using this hack and using the native select arrow in FF. Note this makes the menus wider than the select button because they display at the specified width and aren't clipped. Targeting hack via http://browserhacks.com/#hack-758bff81c5c32351b02e10480b5ed48e */
  /* Show only the native arrow */
  color: #005BA6;
  display: inline-block;
  border-radius: 0;
  box-shadow: none;
  font-size: 16px;
  margin-top: 0px;
  margin-bottom: 0px;
  width: 150px;
}
[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
  content: '';
  display: block;
  position: absolute;
  pointer-events: none;
  z-index: 2;
}
[include*="form-input-select()"] select {
  -webkit-appearance: none;
  -moz-appearance: none;
       appearance: none;
  background: none;
  box-sizing: border-box;
  width: 100%;
  margin: 0;
  border: 1px solid transparent;
  font-size: 16px;
  outline: none;
  /* Focus style */
}
[include*="form-input-select()"] select:focus {
  background-color: transparent;
  outline: none;
}
[include*="form-input-select()"] option {
  font-weight: normal;
}
[include*="form-input-select()"] x:-o-prefocus, [include*="form-input-select()"]::after {
  display: none;
}
@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
  [include*="form-input-select()"] select::-ms-expand {
    display: none;
  }
  [include*="form-input-select()"] select:focus::-ms-value {
    background: transparent;
    color: #000;
  }
}
@-moz-document url-prefix() {
	[include*="form-input-select()"] {
		overflow: hidden;
	}
	[include*="form-input-select()"] select {
		width: 120%;
		width: calc(100% + 3em);
    /* Firefox focus has odd artifacts around the text, this kills that. See https://developer.mozilla.org/en-US/docs/Web/CSS/:-moz-focusring */
  }
  @supports (-moz-appearance: none) {
    [include*="form-input-select()"] select {
      width: 100%;
    }
  }
  [include*="form-input-select()"] select:-moz-focusring {
    color: transparent;
    text-shadow: 0 0 0 #000;
  }
}
@supports (-moz-appearance: none) {
  [include*="form-input-select()"] {
    width: 100%;
  }
}
[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
  content: '';
  display: block;
  position: absolute;
  pointer-events: none;
  border: 1px solid transparent;
  width: 0;
  height: 0;
  right: 16px;
}
[include*="form-input-select()"]::before {
  bottom: 55%;
  border-width: 0 6.5px 8px 6.5px;
  border-bottom-color: #D6D6D6;
}
[include*="form-input-select()"]::after {
  border-width: 8px 6.5px 0 6.5px;
  border-top-color: #D6D6D6;
  top: 55%;
}
@-moz-document url-prefix() {
  [include*="form-input-select()"] {
    border-right: 3px solid #E6E6E6;
  }
  [include*="form-input-select()"]:hover {
    border-right: 3px solid #005BA6;
  }
}
[include*="form-input-select()"]:hover select {
  box-shadow: 0 2px 3px rgba(0, 91, 166, 0.1) inset;
  border-color: #005BA6;
}
[include*="form-input-select()"]:hover select:focus {
  outline-color: transparent;
}
[include*="form-input-select()"]:hover::before {
  border-bottom-color: #005BA6;
}
[include*="form-input-select()"]:hover::after {
  border-top-color: #005BA6;
}
[include*="form-input-select()"] select {
  border: 3px solid #E6E6E6;
  border-radius: 0;
  font-weight: 400;
  color: inherit;
  padding: 10px 10px;
  line-height: normal;
  transition: border-color 0.2s ease, outline 0.2s ease;
}
[include*="form-input-select()"] select:focus {
  box-shadow: 0 3px 4px rgba(0, 91, 166, 0.3) inset;
  outline: 3px solid #005BA6;
  outline-offset: -3px;
}
[include*="form-input-select()"] select[disabled], [include*="form-input-select()"] select:disabled {
  opacity: 0.4;
  cursor: not-allowed;
}
[include*="form-input-select()"] select:invalid {
  color: #C7C7C7;
}


/* PRINT - 출력화면 보여주기 */
.print {
	position: absolute;
	height: 160px;
	overflow: hidden;
	font-family: 'Lato', sans-serif;
	font-size: 35px;
	line-height: 40px;
	color: #353538;
}

.print__container {
	font-weight: 600;
 	overflow: hidden;
	height: 50px;
	padding: 0 40px;
}

.print__container:before {
	content: '[';
	left: 0;
}

.print__container:after {
	content: ']';
	position: absolute;
	right: 0;
}

.print__container:after, .print__container:before {
	position: absolute;
	top: 0;
	color: #16a085;
	font-size: 42px;
  	line-height: 50px;
	-webkit-animation-name: opacity;
	-webkit-animation-duration: 2s;
	-webkit-animation-iteration-count: infinite;
	animation-name: opacity;
	animation-duration: 2s;
	animation-iteration-count: infinite;
}

.print__container__text {
	display: inline;
	float: left;
	margin-top: 5px;
}

.print__container__list {
	margin-top: 0;
	padding-left: 50px;
	text-align: left;
	list-style: none;
	-webkit-animation-name: change;
	-webkit-animation-duration: 15s;
	-webkit-animation-iteration-count: infinite;
	animation-name: change;
	animation-duration: 15s;
	animation-iteration-count: infinite;
}

.print__container__list__item {
	line-height: 40px;
	margin: 0;
}

/* @-webkit-keyframes opacity {
	0%, 100% {
		opacity: 0;
	}
	50% {
		opacity: 1;
	}
}

@-webkit-keyframes change {
	0%, 12.66%, 100% {
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
	16.66%, 29.32% {
		-webkit-transform: translate3d(0, -25%, 0);
		transform: translate3d(0, -25%, 0);
  	}
	33.32%, 45.98% {
		-webkit-transform: translate3d(0, -50%, 0);
		transform: translate3d(0, -50%, 0);
  	}
	49.98%, 62.64% {
		-webkit-transform: translate3d(0, -75%, 0);
		transform: translate3d(0, -75%, 0);
  	}
	66.64%, 79.3% {
		-webkit-transform: translate3d(0, -50%, 0);
		transform: translate3d(0, -50%, 0);
	}
	83.3%, 95.96% {
		-webkit-transform: translate3d(0, -25%, 0);
		transform: translate3d(0, -25%, 0);
	}
} */

@keyframes opacity {
	0%, 100% {
		opacity: 0;
	}
	50% {
		opacity: 1;
	}
}

@keyframes change {
	0%, 10.00%{
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
	15.00%, 20.00% {
		-webkit-transform: translate3d(0, -11%, 0);
		transform: translate3d(0, -11%, 0);
	}
	25.00%, 30.00% {
		-webkit-transform: translate3d(0, -22%, 0);
		transform: translate3d(0, -22%, 0);
	}
	35.00%, 40.00% {
		-webkit-transform: translate3d(0, -33%, 0);
		transform: translate3d(0, -33%, 0);
	}
 	45.00%, 50.00% {
		-webkit-transform: translate3d(0, -44%, 0);
		transform: translate3d(0, -44%, 0);
	}
	55.00%, 60.00% {
		-webkit-transform: translate3d(0, -55%, 0);
		transform: translate3d(0, -55%, 0);
	} 
	65.00%, 70.00% {
		-webkit-transform: translate3d(0, -66%, 0);
		transform: translate3d(0, -66%, 0);
	} 
	75.00%, 80.00% {
		-webkit-transform: translate3d(0, -77%, 0);
		transform: translate3d(0, -77%, 0);
	} 
	85.00%, 90.00% {
		-webkit-transform: translate3d(0, -88%, 0);
		transform: translate3d(0, -88%, 0);
	} 
	95.00%, 100.00% {
		-webkit-transform: translate3d(0, -99%, 0);
		transform: translate3d(0, -99%, 0);
	} 
}    
</style>

<!-- JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script type="text/javascript">
   
   $(function() {
     /* 변수 선언 */
     // 현재 슬라이드 숫자
      var currentSlide = 0;
      
      // 체크 버튼 생성
      var checkStr = '<button class="check">CHECK</button>';
      $('#checkBtnDiv').html(checkStr);
      
       // ul 태그
      var $slideContainer = $('.slide-container'),
       // li 태그
       $slide = $('.slide'),
       // 슬라이드 개수 = li 태그의 개수
       slideCount = $slide.length,
       // array
       answerArr = [],
       // 애니메이션 시간 = 0.3초
       animationTime = 300;
       var selectNum = 0;
       
       $("#selectNum").on("change", function(){
           selectNum = $(this).val();
           $('.print__container__text').html(selectNum);
        /*    for (var int = 1; int < 10; int++) {
        	   var result = int * selectNum;
 			   var liStr = "<li class='print__container__list__item'> * &nbsp; " + int +  " &nbsp; = &nbsp;" + result + "</li>";
 			   $('.print__container__list').append(liStr);
           } */
       });

     // 슬라이드 크기(면적) Set
      function setSlideDimensions () {
        // 현재 윈도우 창의 가로 길이
      var windowWidth = $(window).width();
        // 슬라이드 컨테이너(ul)의 가로 길이를 (현재 윈도우 창 가로 길이 * 슬라이드의 개수)
        $slideContainer.width(windowWidth * slideCount);
          // 슬라이드(li)의 가로 길이는 윈도우창 가로 길이 
        $slide.width(windowWidth);
      }
   
     // 상단 페이징처리 Set
      function generatePagination () {
      // pagination 클래스의 태그를 가져옴
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
     
     $('.check').on('click', goToCheck);
     
     // 정답 체크
     function goToCheck() {
      // answer+각 슬라이드 숫자 로 지정된 클래스를 가져온다 
             alert(selectNum);
         var $answerClass = $('.answer' + currentSlide);
         // $answerClass에 저장된 클래스 개수를 가져온다.
         var answerCount = $answerClass.length;

         for(var i = 1; i <= answerCount; i++) {
            // answer01, answer02
            var answer = $('#answer' + currentSlide + i).val();
            answerArr.push(answer);
         }
         
         var cNum = currentSlide + 1;
         
          $.ajax({
                url : "contents10",
                type : "POST",
                contentType : "application/json; charset=utf-8",
                dataType : "json",
                data : JSON.stringify ({
                   cNum : cNum
                   , answerArr : answerArr
                }),
                success : function(result) {
                     alert('success');
                     answerArr = [];
                   alert(result);
                   var resultStr = '';
                    
                   if (result == false) {
                     resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
                     //resultStr += '<div class="resultMsg">정답입니다.</div>';
                     $('#answerResultDiv').html(resultStr);
                    
                   } else if (result == true) {
                       resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"> </div>';
                       //resultStr += '<div class="resultMsg">오답입니다.</div>';
                         $('#answerResultDiv').html(resultStr);
                      }
                   
                   for (var int = 1; int < 10; int++) {
                	   var result = int * selectNum;
         			   var liStr = "<li class='print__container__list__item'> * &nbsp; " + int +  " &nbsp; = &nbsp;" + result + "</li>";
         			   $('.print__container__list').append(liStr);
                   }
                   
                       $('#checkBtnDiv').html("");
                         var str = '<button class="next">next</button>';
                        $('#nextBtnDiv').html(str);
                        $('.next').on('click', goToNextSlide);
                },
                error : function(err) {
                   console.log(err);
                   answerArr = [];
                   alert("fail");
                }
                
             });
         
     }
     
     // 다음 슬라이드로 이동
      function goToNextSlide () {
       $('#answerResultDiv').html("");
        // 현재 슬라이드가 슬라이드 카운트 -1보다 작거나 같으면 Return  
      if(currentSlide >= slideCount - 1) {
         location.href = "contentsHome";
         return
         }; 
         
      // 현재 윈도우 창의 가로 길이
        var windowWidth = $(window).width();

      // 현재 슬라이드 숫자를 하나씩 증가시킴
        currentSlide++;
      
      // 출력 div를 비워준담!
      $('.print__container__text').html("");
      
      //ul 태그에 효과를 준닷!
        $slideContainer.animate({
          // 왼쪽으로 (윈도우 창의 가로길이 * 현재 슬라이드)의 숫자만큼 이동시킴
          left: -(windowWidth * currentSlide)
        });
      
        setActiveIndicator();
        $('.progress-bar').eq(currentSlide - 1).animate({
          width: '100%'
        }, animationTime);
        
        $('#checkBtnDiv').html(checkStr);
        $('#nextBtnDiv').html("");
        $('.check').on('click', goToCheck);
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
      // $('.check').on('click', goToNextSlide);
      $('.previous').on('click', goToPreviousSlide);
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
			
				<h1> while문을 사용해서 구구단을 출력해보아요! </h1>
				<h2> int &nbsp; left &nbsp; = &nbsp;
				<div include="form-input-select()" style="display: inline-block;">
					<select id="selectNum">
						<!-- This is how we can do "placeholder" options. note: "required" attribute is on the select -->
						<option value="" hidden="" >몇 단?</option>
						<c:forEach var="num" begin="2" end="9">
							<!-- normal options -->
							<option value="${num}">${num}</option>
						</c:forEach>
  					</select>
        		</div>
     			; 
     			</h2>
     			<h2> int &nbsp; right &nbsp; = &nbsp; <input type="text" class="answer0" id="answer01" maxlength="1"> &nbsp; ; </h2>
        		<h2> int &nbsp; result &nbsp; = &nbsp; 0 &nbsp; ; </h2>
        		<div class="question_div">
        			<h2 style="text-align: left;">
        			<!-- Step1 문제 시작 -->
        				while &nbsp; ( right &nbsp; <input type="text" class="answer0" id="answer02" maxlength="2" style="width:75px"> &nbsp; 9 &nbsp; ) &nbsp; { 
        					<br><br>
        					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        					result &nbsp; = &nbsp; <input type="text" class="answer0" id="answer03" maxlength="7" style="width: 100px"> &nbsp; * &nbsp;
        					right &nbsp; ;
        					<br><br>
        					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        					system.out.println &nbsp; ( 
        					&nbsp; left &nbsp; + &nbsp; "*" &nbsp; + &nbsp; right &nbsp; + &nbsp; "=" &nbsp; + &nbsp; result &nbsp; 
        					) &nbsp; ; 
        					<br><br>
        					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        					right &nbsp; <input type="text" class="answer0" id="answer04" maxlength="2" style="width: 75px;"> &nbsp;;
        					<br><br>
        				}
        			<!-- 문제 END -->
        			</h2>
				</div>
        
        		<!-- 출력화면 -->
				<div class="print" style="display: block;">
  					<div class="print__container">
    					<p class="print__container__text"></p>
						<ul class="print__container__list"></ul>
  					</div>	
				</div>
		
			</div>
    	</li>
    	
		<li class="slide" data-tag="Step2">
			<div class="sized-container">
				<h1> for문을 사용해서 구구단을 출력해 보아요! </h1>
				<h2> int &nbsp; left &nbsp; = &nbsp;
				<div include="form-input-select()" style="display: inline-block;">
					<select id="selectNum">
						<!-- This is how we can do "placeholder" options. note: "required" attribute is on the select -->
						<option value="" hidden="" >몇 단?</option>
						<c:forEach var="num" begin="2" end="9">
							<!-- normal options -->
							<option value="${num}">${num}</option>
						</c:forEach>
  					</select>
        		</div>
     			; 
     			</h2>
     	
        		<h2> int &nbsp; result &nbsp; = &nbsp; 0 &nbsp; ; </h2>
        		<br>
        		<div class="question_div">
        			<h2 style="text-align: left;">
        				for (
        					int right = &nbsp; <input type="text" class="answer1" id="answer11" maxlength="1"> &nbsp; ; 
        					right &nbsp; <input type="text" class="answer1" id="answer12" maxlength="2" style="width: 75px"> &nbsp; 9 &nbsp; ; &nbsp;
							right &nbsp; <input type="text" class="answer1" id="answer13" maxlength="2" style="width: 75px">       		
        					) { 
        						<br><br>
        						result &nbsp; = &nbsp;
        						<input type="text" class="answer1" id="answer14" maxlength="6" style="width: 100px"> &nbsp;
        						 * &nbsp;
        						right &nbsp; ;
        						<br><br>
        						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        						system.out.println &nbsp; ( 
        						&nbsp; left &nbsp; + &nbsp; "*" &nbsp; + &nbsp; right &nbsp; + &nbsp; "=" &nbsp; + &nbsp; result &nbsp; 
        						) &nbsp; ; 
        						<br><br>
        					}
        			</h2>
				</div>
        
        		<!-- 출력화면 -->
				<div class="print" style="display: block;">
  					<div class="print__container">
    					<p class="print__container__text"></p>
						<ul class="print__container__list"></ul>
  					</div>	
				</div>
		
			</div>
    	</li>
    	
    	
    	
		<li class="slide" data-tag="Step3">
			<div class="sized-container">
				<h1> for문을 while문으로 바꿔볼까요? </h1>
				<h1> 1부터 5까지 숫자를 더해봅시다!</h1>
				<table class="forToWhile_table">
					<tr>
						<td class="forToWhile_td">
							<div class="forToWhile_question">
								<h2 style="text-align: left;">
									int sum = 0;<br>
									for (int num = 1; num &lt;= 5; num++) { <br>
										<br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										sum = sum + num ; <br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										system.out.println(sum);<br>
										<br>
									}
								</h2>
							</div>
						</td>
						<td class="forToWhile_td">
							<div class="forToWhile_answer" >
								<h2 style="text-align: left;">
									int sum = 0;<br>
									int num = <input type="text" class="answer2" id="answer21" maxlength="1">; <br>
									
									while ( <input type="text" class="answer2" id="answer22" maxlength="7"> &lt;= <input type="text" class="answer2" id="answer23" maxlength="1"> ) { <br>
										<br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										sum = sum + <input type="text" class="answer2" id="answer24" maxlength="7">; <br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										num <input type="text" class="answer2" id="answer25" maxlength="7">;<br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										system.out.println(sum);
									}
								</h2>
							</div>
						</td>
					</tr>
				</table>
	
			</div>
		</li>
		<li class="slide" data-tag="Step4">
			<div class="sized-container">
				<h1> 이번엔 while문을 for문으로 바꿔볼까요? </h1>
				<h1> 5부터 1까지의 숫자를 곱해봅시다!</h1>
				<table class="forToWhile_table">
					<tr>
						<td class="forToWhile_td">
							<div class="forToWhile_div">
								<h2 style="text-align: left;">
									int multiply = 1;<br>
									int num = 5; <br>
								 	while ( num >= 1 ) {
								 		<br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										multiply = multiply * num; <br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										num--; <br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										system.out.println(multiply); <br> 
						
									}
								</h2>
							</div>
						</td>
						<td class="forToWhile_td">
							<div class="forToWhile_answer" >
								<h2 style="text-align: left;">
									int multiply = <input type="text" class="answer3" id="answer31" maxlength="1">;<br>
									
									for (int num = <input type="text" class="answer3" id="answer32" maxlength="1">; num &gt;= <input type="text" class="answer3" id="answer33" maxlength="1">; num<input type="text" class="answer3" id="answer34" maxlength="2">) { <br>
										<br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										multiply = <input type="text" class="answer3" id="answer35" maxlength="10"> * num ; <br>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										system.out.println(multiply);<br>
										<br>
									}
								</h2>
							</div>
						</td>
					</tr>
				</table>
	
			</div>
		</li>
	<!-- 	<li class="slide" data-tag="Step5">
			<div class="sized-container">
			</div>
		</li>
		<li class="slide" data-tag="Step6">
			<div class="sized-container">
			</div>
		</li>
		<li class="slide" data-tag="Step7">
			<div class="sized-container">
			</div>
		</li> -->
	</ul>
</div>

<div class="full-width-container">
	<div class="button-container sized-container">
		<div id="checkBtnDiv"></div>
		<div id="nextBtnDiv"></div>
		<button class="previous">previous</button>
		<div id="answerResultDiv"></div>
	</div>
</div>

</body>
</html>