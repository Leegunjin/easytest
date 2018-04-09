<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>[ contents320.jsp ]</title>

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
  width: 7840px;
}



.slide {
  float: left;
  list-style-type: none;
}
.slide .sized-container {
  padding: 75px 0px;
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

[class^="answer"] {
      margin: 0; 
      padding: 0;
      background-color: #f3fafd; 
      border: solid 2px #217093; 
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
                url : "contents320",
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
   <h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
   <h2>int x = 5;</h2>
   <h2>int y = 2;</h2>
  <ul class="slide-container">
    <li class="slide" data-tag="Step1">
      <div class="sized-container">
        <h1>x &nbsp; <input type="text" class="answer0" id="answer01"> &nbsp; y &nbsp; = &nbsp; 7 &nbsp; <input type="text" class="answer0" id="answer02"> </h1>
      </div>
    </li>
    <li class="slide" data-tag="Step2">
      <div class="sized-container">
      <h1>x &nbsp; <input type="text" class="answer1" id="answer11"> &nbsp; y &nbsp; = &nbsp; 3 &nbsp; <input type="text" class="answer1" id="answer12"> </h1>
      </div>
    </li>
    <li class="slide" data-tag="Step3">
      <div class="sized-container">
        <h1>x &nbsp; <input type="text" class="answer2" id="answer21"> &nbsp; y &nbsp; = &nbsp; 10 &nbsp; <input type="text" class="answer2" id="answer22"> </h1>
      </div>
    </li>
    <li class="slide" data-tag="Step4">
      <div class="sized-container">
        <h1>x &nbsp; <input type="text" class="answer3" id="answer31"> &nbsp; y &nbsp; = &nbsp; 2 &nbsp; <input type="text" class="answer3" id="answer32"> </h1>
      </div>
    </li>
    <li class="slide" data-tag="Step5">
      <div class="sized-container">
        <h1>x &nbsp; <input type="text" class="answer4" id="answer41"> &nbsp; y &nbsp; = &nbsp; 1 &nbsp; <input type="text" class="answer4" id="answer42"> </h1>
      </div>
    </li>
    <li class="slide" data-tag="Step6">
      <div class="sized-container">
        <h1>x &nbsp; + &nbsp; y &nbsp; <input type="text" class="answer5" id="answer51"> &nbsp; 7 &nbsp; <input type="text" class="answer5" id="answer52"> </h1>
      </div>
    </li>
    <li class="slide" data-tag="Step7">
      <div class="sized-container">
        <h1>x &nbsp; * &nbsp; y &nbsp; <input type="text" class="answer6" id="answer61"> &nbsp; 20 &nbsp; <input type="text" class="answer6" id="answer62"> </h1>
      </div>
   </li>
        <li class="slide" data-tag="Step8">
      <div class="sized-container">
        
      </div>
    <!--  </li>
        <li class="slide" data-tag="Step9">
      <div class="sized-container">
        <h1>x &nbsp; <input type="text" class="answer8" id="answer81"> &nbsp; y &nbsp; = &nbsp; 1 &nbsp; <input type="text" class="answer8" id="answer82"> </h1>
      </div> 
    </li> -->
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