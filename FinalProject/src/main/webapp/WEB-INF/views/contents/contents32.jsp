<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>[ contents32.jsp ]</title>

 <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<!-- CSS -->
<style type="text/css">
      @charset "UTF-8";
*, html, body {
	font-family: 'Jua', sans-serif;
}
 
* {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

h1, h2 {
	text-align: center;
	font-family: 'Jua', sans-serif;
}

h1 {
	font-size: 29px;
	line-height: 30px;
	margin-top: 40px;
	margin-bottom: 20px;
}

h2 {
	font-size: 28px;
	line-height: 25px;
	margin-top: 0px;
	margin-bottom: 30px;
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
	width: 11760px;
	height: 200px;
}

.slide {
	float: left;
	list-style-type: none;
}
.slide .sized-container {
 	padding: 10px 0px;
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
	margin-top: 80px;
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
	width: 5%;
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
	border: solid 2px #4ECCA3; 
	border-radius: 4px; 
	box-sizing: border-box;
	width: 50px; 
	height: 50px;
	text-align: center;
	font-size: 20pt; 
	color: #353538; 
	font-weight: 600;
	font-style: inherit;
}

ul{
   list-style:none;
   padding-left:0px;
}

#question_box {
	font-family: 'Jua', sans-serif;
	font-size: 30pt;
	border: solid 4px #4ECCA3;
	border-radius: 5px;
	width: 400px;
	height: auto;
	padding: 5px;
	margin-top : 50px;
	margin-left: 560px;
	text-align: center;
	background-color: #f3fafd;
}

[id^="question_p"] {
	font-family: 'Jua', sans-serif;
	font-size: 30pt;
	margin: 20px;
}

#question_p1 {
	color: #e21b96;
}

#question_p2 {
	color: #3f48cc;
}


/* Error Button */
a.btn{
     width:150px;
     height:50px;
     display:block;
     margin:-5px 0 0 -75px;
     position:absolute;
     top:86.5%; left:42%;
     font:'Jua', sans-serif;
     font-weight:700;
     text-align:center;
     text-decoration:none;
     color:#fff;
     border-radius:5px;
     background:rgba(217,67,86,1);
     font-size: 20px;
     padding-top: 10px;
   }
   
.modal-wrapper{
     width:100%;
     height:100%;
     position:fixed;
     top:0; left:0;
     /* background:rgba(255,257,153,0.75); */
     visibility:hidden;
     opacity:0;
     -webkit-transition: all 0.25s ease-in-out;
     -moz-transition: all 0.25s ease-in-out;
     -o-transition: all 0.25s ease-in-out;
     transition: all 0.25s ease-in-out;
   }

.modal-wrapper.open{
     opacity:1;
     visibility:visible;
   }
   
.modal{
     width:600px;
     height:400px;
     display:block;
     margin:50% 0 0 -300px;
     position:relative;
     top:50%; left:50%;
     background:#f4f5f7;
     opacity:0;
     -webkit-transition: all 0.5s ease-in-out;
     -moz-transition: all 0.5s ease-in-out;
     -o-transition: all 0.5s ease-in-out;
     transition: all 0.5s ease-in-out;
   }
   
.modal-wrapper.open .modal{
     margin-top:-200px;
     opacity:1;
   }
   
.head1{
     width:100%;
     height:40px;
     padding:1.5em 5%;
     overflow:hidden;
     /* background:#01bce5; */
     background-color: rgba(217,67,86,1);
     font-size: 40px;
     font-family:  'Jua', sans-serif;
     color: white;
   }
   
.btn-close{
     width:32px;
     height:32px;
     display:block;
     float:right;
   }
   
.btn-close::before, .btn-close::after{
     content:'';
     width:32px;
     height:6px;
     display:block;
     background:#fff;
   }
   
.btn-close::before{
     margin-top:12px;
     -webkit-transform:rotate(45deg);
     -moz-transform:rotate(45deg);
     -o-transform:rotate(45deg);
     transform:rotate(45deg);
   }
   
.btn-close::after{
     margin-top:-6px;
     -webkit-transform:rotate(-45deg);
     -moz-transform:rotate(-45deg);
     -o-transform:rotate(-45deg);
     transform:rotate(-45deg);
   }
   
#contentErrDiv{
      font-family: 'Jua', sans-serif;
      font-size: 20px;
      color: #393E46;
      padding-left: 5%;
      padding-top: 5%;
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
             url : "contents6",
             type : "POST",
             contentType : "application/json; charset=utf-8",
             dataType : "json",
             data : JSON.stringify ({
                cNum : cNum
                ,answerArr : answerArr
             }),
             success : function(blankMap) {
                  answerArr = [];
                var resultStr = '';
                 
                if (blankMap.result == false) {
                  resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"></div><br>';
                  resultStr += '<div class="page-wrapper"><a class="btn trigger" href="javascript:;">Error</a></div>';
                  
               	var wrongAnswer = blankMap.wrongAnswerArr;
           	   	var rightAnswer = blankMap.rightAnswerArr;
				var errorReason = blankMap.errorReasonArr;
                  
                  /* resultStr += '사용자가 입력한 답 : ' + blankMap.wrongAnswerArr+'<br>'; 
                  resultStr += '정답 : ' + blankMap.rightAnswerArr+'<br>';
                  resultStr += '틀린 이유 : ' + blankMap.errorReasonArr+'<br>';
					*/
                  //resultStr += '<div class="resultMsg">정답입니다.</div>';
                  /* alert("blankMap.rightAnswer : "+blankMap.rightAnswer);
                  alert("blankMap.wrongAnswer : "+blankMap.wrongAnswer); */
                  $('#answerResultDiv').html(resultStr);
                 
                } else if (blankMap.result == true) {
             	   resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"></div>';
                      $('#answerResultDiv').html(resultStr);
                   }
                
             	$('.trigger').click(function() {
           	     $('.modal-wrapper').toggleClass('open');
           	    $('.page-wrapper').toggleClass('blur');
           	     return false;
           	  });
            /*   	var userAnswerFull = resultMap.userAnswerFull;*/
               var errTxt = '';
               $.each(errorReason , function( i, val ) {
               	errTxt += '?  '+ val + '<br>'; 
       	   });
               
            /*    $('.head1').html('입력한 답 : '+userAnswerFull);
               $('.head1').val('입력한 답 : '+userAnswerFull); */
               $('.content').html(errTxt);
               $('.content').val(errTxt);
                
                    //if (result) {
                    $('#checkBtnDiv').html("");
                      var str = '<button class="next">next</button>';
                     $('#nextBtnDiv').html(str);
                     $('.next').on('click', goToNextSlide);
             },
             error : function(err) {
                console.log(err);
                answerArr = [];
             }
             
          });
         
     }
     
     // 다음 슬라이드로 이동
      function goToNextSlide () {
       $('#answerResultDiv').html("");
        // 현재 슬라이드가 슬라이드 카운트 -1보다 작거나 같으면 Return  
      if(currentSlide >= slideCount - 1) {
         location.href = "clearChapter?c_num=3212";
         return
         }; 
      
      if(currentSlide == 8) {
        var pStr = '<p id="question_p3">int c = 7;</p>'; 
        	$('#question_box').append(pStr); 
        	$('[id^="question_p"]').attr('style', 'margin-top : 10px; margin-bottom : 10px;');       
         }
        	 
      // 현재 윈도우 창의 가로 길이
        var windowWidth = $(window).width();
   
      // 현재 슬라이드 숫자를 하나씩 증가시킴
        currentSlide++;
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
   <h1>빈 칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
<!--    <img alt="operator_quiz_01" src="../resources/img/operator_quiz_10.png" style="height: 150px; width: auto;"> -->
	<div id="question_box">
		<p id="question_p1">int a = 2;</p>
		<p id="question_p2">int b = 5;</p>
	</div>
  <ul class="slide-container">
    <li class="slide" data-tag="Step1">
      <div class="sized-container">
      <h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; + , - , * , / , % , ; </h2>
        <h1>a &nbsp; <input type="text" class="answer0" id="answer01" maxlength="1"> &nbsp; b &nbsp; = &nbsp; 7 &nbsp; <input type="text" class="answer0" id="answer02" maxlength="1"> &nbsp; </h1>
		<!-- Error Message -->
		<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          		<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step2">
      <div class="sized-container">
      <h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; + , - , * , / , % , ; </h2>
		<h1>a &nbsp; <input type="text" class="answer1" id="answer11" maxlength="1"> &nbsp; b &nbsp; = &nbsp; 3 &nbsp; <input type="text" class="answer1" id="answer12" maxlength="1"> &nbsp; </h1>
      	<!-- Error Message -->
		<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          		<div class="content" id="contentErrDiv">
          	</div>
		</div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step3">
      <div class="sized-container">
      <h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; + , - , * , / , % , ; </h2>
        <h1>a &nbsp; <input type="text" class="answer2" id="answer21" maxlength="1"> &nbsp; b &nbsp; = &nbsp; 10 &nbsp; <input type="text" class="answer2" id="answer22" maxlength="1"> &nbsp; </h1>
      	<!-- Error Message -->
		<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step4">
      <div class="sized-container">
      <h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; + , - , * , / , % , ; </h2>
        <h1>a &nbsp; <input type="text" class="answer3" id="answer31" maxlength="1"> &nbsp; b &nbsp; = &nbsp; 2 &nbsp; <input type="text" class="answer3" id="answer32" maxlength="1"> &nbsp; </h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step5">
      <div class="sized-container">
      <h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; + , - , * , / , % , ; </h2>
        <h1>a &nbsp; <input type="text" class="answer4" id="answer41" maxlength="1"> &nbsp; b &nbsp; = &nbsp; 1 &nbsp; <input type="text" class="answer4" id="answer42" maxlength="1"> &nbsp; </h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step6">
      <div class="sized-container">
        <h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; == , != , &lt; , &gt; , ; </h2>
      
        <h1>a &nbsp; + &nbsp; b &nbsp; <input type="text" class="answer5" id="answer51" maxlength="2" style="width: 75px"> &nbsp; 7 &nbsp; <input type="text" class="answer5" id="answer52" maxlength="2"> &nbsp; </h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step7">
      <div class="sized-container">
      <h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; == , != , &lt; , &gt; , ; </h2>
        <h1>a &nbsp; * &nbsp; b &nbsp; <input type="text" class="answer6" id="answer61" maxlength="2" style="width: 75px"> &nbsp; 20 &nbsp; <input type="text" class="answer6" id="answer62" maxlength="2"> &nbsp; </h1>
      </div>
      <!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
   </li>
     <li class="slide" data-tag="Step8">
      <div class="sized-container">
		<h2 style="font-size: 20pt; padding-top:15px; margin: 0px; color: #393E46"> &lt; 보기 &gt; == , != , &lt; , &gt; , ; </h2>
	 	<h1 style="padding:10px; margin: 0px;">a &nbsp; <input type="text" class="answer7" id="answer72" maxlength="2" style="width: 75px"> &nbsp; 3 ; &nbsp; </h1>
	 	<h1 style="padding:10px; margin: 0px;">b &nbsp; <input type="text" class="answer7" id="answer72" maxlength="2" style="width: 75px"> &nbsp; 3 ; &nbsp; </h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
   </li>
   </li>
     <li class="slide" data-tag="Step9">
      <div class="sized-container">
        <h1 style="font-size: 16pt; padding:5px; margin: 0px;"> 각각 공통으로 들어갈 연산자를 입력해주세요. </h1>
        <h1 style="padding:10px; margin: 0px;">
        	① &nbsp; a &nbsp; <input type="text" class="answer8" id="answer81" maxlength="2" style="width: 75px"> &nbsp; 2 ; &nbsp;
        	또는 &nbsp; a &nbsp; <input type="text" class="answer8" id="answer82" maxlength="2" style="width: 75px"> &nbsp;5 ; 
        </h1>
	 	<h1 style="padding:10px; margin: 0px;">
	 		② &nbsp; b &nbsp; <input type="text" class="answer8" id="answer83" maxlength="2" style="width: 75px"> &nbsp; 2 ; &nbsp;
	 		또는 &nbsp; b &nbsp; <input type="text" class="answer8" id="answer84" maxlength="2" style="width: 75px"> &nbsp;5 ; 
	 	</h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
   </li>
    <li class="slide" data-tag="Step10">
      <div class="sized-container">
        <h1 style="padding:10px; margin: 0px;">
        	a &nbsp; <input type="text" class="answer9" id="answer91" maxlength="1"> &nbsp; b &nbsp; == &nbsp; c &nbsp; ;  
        </h1>
	 	<h1 style="padding:10px; margin: 0px;">
	 		 b &nbsp; - &nbsp; a &nbsp; <input type="text" class="answer9" id="answer92" maxlength="1"> &nbsp; c &nbsp; ; 
	 	</h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
   </li>
   <li class="slide" data-tag="Step11">
      <div class="sized-container">
        <h1 style="padding:10px; margin: 0px;">
        	a &nbsp; <input type="text" class="answer10" id="answer101" maxlength="1"> &nbsp; b &nbsp; > &nbsp; c &nbsp; ;  
        </h1>
	 	<h1 style="padding:10px; margin: 0px;">
	 		 b &nbsp; % &nbsp; a &nbsp; <input type="text" class="answer10" id="answer102" maxlength="1"> &nbsp; c &nbsp; ; 
	 	</h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
          		</div>
			</div>
		</div>
      </div>
   </li>
   <li class="slide" data-tag="Step12">
      <div class="sized-container">
        <h1 style="padding:10px; margin: 0px;">
        	( &nbsp; a &nbsp; * &nbsp; b &nbsp; ) &nbsp; + &nbsp; c &nbsp;
        		<input type="text" class="answer11" id="answer111" maxlength="1"> &nbsp; 15 &nbsp; ;  
        </h1>
	 	<h1 style="padding:10px; margin: 0px;">
	 		 ( &nbsp; a &nbsp; * &nbsp; b &nbsp; ) &nbsp; *  &nbsp; c &nbsp;
	 		 	<input type="text" class="answer11" id="answer112" maxlength="2" style="width: 75px"> &nbsp; 70 &nbsp; ;  
	 	</h1>
      	<!-- Error Message -->
      	<div class="modal-wrapper">
      		<div class="modal">
				<div class="head1" style="font-size: 40px">
					Error Check
					<a class="btn-close trigger" href="javascript:;"></a>
          		</div>
          			<div class="content" id="contentErrDiv">
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
  <!--   <button class="check">check</button>  -->    
  <button class="previous">previous</button>
    <div id="answerResultDiv"></div>
  </div>
</div>


</body>
</html>