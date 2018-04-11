<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
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
      
      h1, h2, h4 {
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
      
      ul{
         list-style:none;
         padding-left:0px;
      }
      
      
      /* 돌아가는박스 */
      .box_wrapper {
        position: absolute;
        top: 50%;
        left: 93%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
      }
      .box {
        margin: auto;
        position: relative;
        height: 200px;
        width: 200px;
        -webkit-transform-style: preserve-3d;
        -moz-transform-style: preserve-3d;
        -o-transform-style: preserve-3d;
        -ms-transform-style: preserve-3d;
        transform-style: preserve-3d;
        -webkit-animation: rotate 20s infinite linear;
        -moz-animation: rotate 20s infinite linear;
        -o-animation: rotate 20s infinite linear;
        -ms-animation: rotate 20s infinite linear;
        animation: rotate 20s infinite linear;
      }
      .box > div {
        position: absolute;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        height: 100%;
        width: 100%;
        opacity: 0.8;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=80)";
        filter: alpha(opacity=80);
        background-color: #9baec8;
        border: solid 1px #eee;
        -webkit-transition: -webkit-transform 0.2s ease-in;
        -moz-transition: -moz-transform 0.2s ease-in;
        -o-transition: -o-transform 0.2s ease-in;
        -ms-transition: -ms-transform 0.2s ease-in;
        transition: transform 0.2s ease-in;
      }
      .front {
        -webkit-transform: translateZ(100px);
        -moz-transform: translateZ(100px);
        -o-transform: translateZ(100px);
        -ms-transform: translateZ(100px);
        transform: translateZ(100px);
      }
      .back {
        -webkit-transform: translateZ(-100px) rotateY(180deg);
        -moz-transform: translateZ(-100px) rotateY(180deg);
        -o-transform: translateZ(-100px) rotateY(180deg);
        -ms-transform: translateZ(-100px) rotateY(180deg);
        transform: translateZ(-100px) rotateY(180deg);
      }
      .right {
        -webkit-transform: rotateY(-270deg) translateX(100px);
        -moz-transform: rotateY(-270deg) translateX(100px);
        -o-transform: rotateY(-270deg) translateX(100px);
        -ms-transform: rotateY(-270deg) translateX(100px);
        transform: rotateY(-270deg) translateX(100px);
        -webkit-transform-origin: top right;
        -moz-transform-origin: top right;
        -o-transform-origin: top right;
        -ms-transform-origin: top right;
        transform-origin: top right;
      }
      .left {
        -webkit-transform: rotateY(270deg) translateX(-100px);
        -moz-transform: rotateY(270deg) translateX(-100px);
        -o-transform: rotateY(270deg) translateX(-100px);
        -ms-transform: rotateY(270deg) translateX(-100px);
        transform: rotateY(270deg) translateX(-100px);
        -webkit-transform-origin: center left;
        -moz-transform-origin: center left;
        -o-transform-origin: center left;
        -ms-transform-origin: center left;
        transform-origin: center left;
      }
      .top {
        -webkit-transform: rotateX(-270deg) translateY(-100px);
        -moz-transform: rotateX(-270deg) translateY(-100px);
        -o-transform: rotateX(-270deg) translateY(-100px);
        -ms-transform: rotateX(-270deg) translateY(-100px);
        transform: rotateX(-270deg) translateY(-100px);
        -webkit-transform-origin: top center;
        -moz-transform-origin: top center;
        -o-transform-origin: top center;
        -ms-transform-origin: top center;
        transform-origin: top center;
      }
      .bottom {
        -webkit-transform: rotateX(270deg) translateY(100px);
        -moz-transform: rotateX(270deg) translateY(100px);
        -o-transform: rotateX(270deg) translateY(100px);
        -ms-transform: rotateX(270deg) translateY(100px);
        transform: rotateX(270deg) translateY(100px);
        -webkit-transform-origin: bottom center;
        -moz-transform-origin: bottom center;
        -o-transform-origin: bottom center;
        -ms-transform-origin: bottom center;
        transform-origin: bottom center;
      }
      .box_wrapper:hover .front {
        -webkit-transform: translateZ(200px);
        -moz-transform: translateZ(200px);
        -o-transform: translateZ(200px);
        -ms-transform: translateZ(200px);
        transform: translateZ(200px);
      }
      .box_wrapper:hover .back {
        -webkit-transform: translateZ(-200px) rotateY(180deg);
        -moz-transform: translateZ(-200px) rotateY(180deg);
        -o-transform: translateZ(-200px) rotateY(180deg);
        -ms-transform: translateZ(-200px) rotateY(180deg);
        transform: translateZ(-200px) rotateY(180deg);
      }
      .box_wrapper:hover .right {
        -webkit-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        -moz-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        -o-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        -ms-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        transform: rotateY(-270deg) translateZ(100px) translateX(100px);
      }
      .box_wrapper:hover .left {
        -webkit-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        -moz-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        -o-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        -ms-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        transform: rotateY(270deg) translateZ(100px) translateX(-100px);
      }
      .box_wrapper:hover .top {
        -webkit-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        -moz-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        -o-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        -ms-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
      }
      .box_wrapper:hover .bottom {
        -webkit-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        -moz-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        -o-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        -ms-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        transform: rotateX(270deg) translateZ(100px) translateY(100px);
      }
      @-moz-keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      @-webkit-keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      @-o-keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      @keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      
      
      /* 큐브접기 */
      
      /* body {
        width: 100vw;
        height: 100vh;
        perspective: 600px;
     }
      
     h1, h2 {
        transform: translateX(-50%);
        text-transform: uppercase;
     }
      
      .ksstest{
        position: absolute;
        width: 120px;
        height: 120px;
        top: 0;
        background: rgba(255, 255, 255, 0.4);
        box-shadow: 0 0 0 2px white inset;
        border-radius: 3px;
        cursor: all-scroll;
        transition: all 0.5s ease-in-out;
        transform-style: preserve-3d;
      }
      
      div#base {
        top: 55%;
        left: 50%;
        background: #2440cc;
        box-shadow: 0 0 60px 15px #2440cc;
        transform: translate(-50%, -50%) rotateX(70deg) rotate(-45deg);
      }
      
      div#base.rotate {
        animation: rotate 6s linear infinite;
      }
      
      div#right {
        transform-origin: 0% 50%;
        transform: translateX(120px);
      }
      
      div#right.on {
        transform: translateX(120px) rotateY(-90deg);
      }
      
      div#left {
        transform-origin: 100% 50%;
        transform: translateX(-120px);
      }
      
      div#left.on {
        transform: translateX(-120px) rotateY(90deg);
      }
      
      div#front {
        transform-origin: 50% 0%;
        transform: translateY(120px);
      }
      
      div#front.on {
        transform: translateY(120px) rotateX(90deg);
      }
      
      div#back,
      div#top {
        transform-origin: 50% 100%;
        transform: translateY(-120px);
      }
      
      div#back.on,
      div#top.on {
        transform: translateY(-120px) rotateX(-90deg);
      }
      
      ul.timeline {
        position: absolute;
        width: 200px;
        height: 2px;
        top: 80%;
        left: 50%;
        background: rgba(255, 255, 255, 0.4);
        opacity: 0;
        transition: all 0.4s ease-in-out;
        transform: translateX(-50%) translateY(100px) scale(0.4);
      }
      ul.timeline li {
        position: absolute;
        height: 100%;
        top: 0;
        left: 0;
        background: white;
      }
      
      ul.timeline.visible {
        opacity: 1;
        transition: all 0.4s ease-in-out;
        transform: translateX(-50%) translateY(0) scale(1);
      }
      
      @keyframes rotate {
        from {
          transform: translate(-50%, -50%) rotateX(70deg) rotate(-45deg);
        }
        to {
          transform: translate(-50%, -50%) rotateX(70deg) rotate(315deg);
        }
      } */
            
   </style>
  
   <script type="text/javascript">
   
   $(function() {
      var currentSlide = 0;
      var testCount = 0;
      
      var checkStr = '<button class="check">CHECK</button>';
      $('#checkBtnDiv').html(checkStr);
      
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
      
      $('.check').on('click', goToCheck);
      function goToCheck() {
         //alert(currentSlide);
         //if (currentSlide == 0) {
            //var slideNumber = "71"+currentSlide+1;
            var cNum = currentSlide + 1;
            //alert("cNum : "+cNum);
            var answer = $('#answer'+currentSlide).val();
            //alert(answer);
                  $.ajax({
                     url : "contents71",
                     type : "POST",
                     //contentType : "application/json; charset=utf-8",
                     //dataType : "json",
                     data : {
                        cNum : cNum,
                        answer : answer  
                     },
                     /* success : function(result) {
                       //alert('success');
                       //alert(result);
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
                      //if (result) {
                         $('#checkBtnDiv').html("");
                         var str = '<button class="next">next</button>';
                     $('#nextBtnDiv').html(str);
                     $('.next').on('click', goToNextSlide);
                  //}
                     }, */
                     success : function(resultMap) {
                         //alert('success');
                         //alert(result);
                         var resultStr = '';
                         if (resultMap.result == false) {
                       resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
                       resultStr += '<div> 정답 : '+resultMap.answer+'</div>';
                       $('#answerResultDiv').html(resultStr);
                      } else if (resultMap.result == true) {
                         resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"></div>';
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
   
      function goToNextSlide () {
        $('#answerResultDiv').html("");
        //if(currentSlide >= slideCount - 1) return; 
        if(currentSlide >= slideCount - 1){
          location.href = "contentsHome";
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
      
      $('.previous').on('click', goToPreviousSlide);
   });
   
   //큐브접기
   /* $(function () {
      function on(e) {
         var time = 6000; // Same as animation duration in CSS:45

         var target = document.getElementById(e.target.id);
         if (target.classList.contains("on")) target.classList.remove("on");
         else target.classList.add("on");

         if (divs.length === document.querySelectorAll("div.on").length) {
           base.classList.add("rotate");
           timeline.classList.add("visible");

           // Timeline
           var width = 0;
           setInterval(function() {
             if (width == 100) clearInterval();
             else document.querySelector(".timeline li").style.width = width++ + "%";
           }, time / 100);

           // Reset divs & timeline after the rotation
           setTimeout(function() {
             base.classList.remove("rotate");
             timeline.classList.remove("visible");
             for (i = 1; i < divs.length; i++) divs[i].classList.remove("on");
           }, time);
         }
       }

       var base = document.getElementById("base"),
         timeline = document.querySelector(".timeline"),
         divs = document.querySelectorAll("div");
       base.addEventListener("click", on, false);

   }); */
   
   </script>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Trophy Quiz</title>
</head>
<body style="overflow-x:hidden"> 


<div class="pagination-container full-width-container">
  <div class="sized-container">
    <div class="pagination"></div>
  </div>
</div>
<div class="viewport full-width-container">
  <ul class="slide-container">
    <li class="slide" data-tag="Step1" id="slide1">
      <div class="sized-container">
        <!-- <h1></h1> -->
        <h2>다음 네모의 가로는 5입니다. 적합한 자료형을 사용하여 가로 변수를 선언, 생성하세요.</h2>
        <br>
        <img src="../resources/img/cube3.png" width="250px">
        <input type="text" id="answer0" class="answer" placeholder="작성">
        <div class="box_wrapper">
         </div>
        <br><br><br>
        <!-- <input type="text" id="answer0" class="answer" placeholder="작성"> --> 
      </div>
    </li>
    <li class="slide" data-tag="Step2">
      <div class="sized-container">
        <!-- <h1></h1> -->
        <h2>다음 네모의 세로는 3입니다. 적합한 자료형을 사용하여 가로 변수를 선언, 생성하세요.</h2>
        <br>
        <img src="../resources/img/cube3.png" width="250px">
        <input type="text" id="answer1" class="answer" placeholder="작성"> 
      </div>
    </li>
    <li class="slide" data-tag="Step3">
      <div class="sized-container">
        <h2>다음 네모의 세로는 3입니다. 적합한 자료형을 사용하여 가로 변수를 선언, 생성하세요.</h2>
        <img src="../resources/img/cube3.png" width="250px">
        <input type="text" id="answer2" class="answer" placeholder="작성"> 
      </div>
    </li>
    <li class="slide" data-tag="Step4">
      <div class="sized-container">
        <h2>상자를 만들기 위해 지금까지 입력한 가로, 세로, 높이 변수를 곱해 cube라는 변수에 담아주세요.</h2>
        <!-- 가로*세로*높이 -->
        <input type="text" id="answer3" class="answer" placeholder="작성">
      </div>
    </li>
    <li class="slide" data-tag="Step5">
      <div class="sized-container">
        <h2>만들어진 상자의 부피가 구해졌습니다!</h2>
        <input type="text" id="answer4" class="answer" placeholder="작성">
      </div>
    </li>
    <li class="slide" data-tag="Step6">
      <div class="sized-container">
        <!-- 큐브접기 -->
      <!-- <div class="on" id="base" class="ksstest">
        <div id="left" class="ksstest"></div>
        <div id="right" class="ksstest"></div>
        <div id="front" class="ksstest"></div>
        <div id="back" class="ksstest">
          <div id="top" class="ksstest"></div>
        </div>
      </div> -->
      <ul class="timeline">
        <li></li>
      </ul>
      </div>
    </li>
    <li class="slide" data-tag="Step7">
      <div class="sized-container">
      <!-- 돌아가는 박스 -->
        <div class="box_wrapper">
           <div class="box">
             <div class="front"></div>
             <div class="back"></div>
             <div class="top"></div>
             <div class="bottom"></div>
             <div class="left"></div>
             <div class="right"></div>
           </div>
      </div>    
      </div>
    </li>
  </ul>
</div>
<div class="full-width-container">
  <div class="button-container sized-container">
     <!-- <button class="check">CHECK</button> -->
     <div id="checkBtnDiv"></div>
    <div id="nextBtnDiv"></div>
    <!-- <button class="next">next</button> -->
    <button class="previous">previous</button>
    <div id="answerResultDiv"></div>
  </div>
</div>

</body>
</html>