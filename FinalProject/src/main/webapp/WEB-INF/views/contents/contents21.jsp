<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="../resources/css/styleContents21.css?ver=1">
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
   font-family: 'Jua', sans-serif;
   color: #353538;
   margin-left: 20px;
   font-weight: 600;
   font-style: inherit;
}

@charset "UTF-8";

*, html, body {
   font-family: 'Jua', sans-serif;
   margin: 0;
   padding: 0;
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
   font-family: 'Jua', sans-serif;
   line-height: 30px;
   font-weight: bold;
   margin-top: 59px;
}

h2 {
   font-size: 20px;
   font-family: 'Jua', sans-serif;
   line-height: 88px;
   margin-top: 14px;
   background-color: #37B595;
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
   font-family: 'Jua', sans-serif;
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
   margin-top: -15px;
}

.question-container {
   max-width: 900px;
   width: 100%;
   margin: 0 auto;
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
   height: 485px;
}

.slide .sized-container {
   padding-top: -8px;
   padding-bottom: 20px;
}

.button-container {
   border-top: 1px solid black;
   overflow: hidden;
   padding-top: 9px;
}

.button-container button {
   float: right;
   margin-left: 30px;
}

.pagination-container {
   height: 18vh;
}

.pagination {
   width: 100%;
   height: 100%;
   text-align: center;
   padding: 0 25px;
   padding-top: 60px;
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
   font-family: 'Jua', sans-serif;
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

ul {
   list-style: none;
   padding-left: 0px;
}

div.resultMsg>img {
   margin-top: -9px;
}

#javaCodeDiv {
   font-size: 40px;
   font-family: 'Jua', sans-serif;
   font-weight: bolder;
   width: 140px;
   margin-left: 300px;
    margin-top: -63px;
   height: 80px;
}


</style>
<script type="text/javascript"
   src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script type="text/javascript">
   $(function() {
      var currentSlide = 0;
      var testCount = 0;
      if (currentSlide == 0 ||currentSlide == 2 ||currentSlide == 4 ||currentSlide == 6) {
         $('.next').on('click', goToNextSlide);
      }
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
      function goToCheck() {
         var cNum = currentSlide + 1;
         var checkedValue = $('#checkedValue' + currentSlide).val();
      }

      function goToNextSlide() {
         $('#answerResultDiv').html("");
         if (currentSlide >= slideCount - 1) {
            location.href = "clearChapter?c_num=210";
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
         $('#javaCodeDiv').empty();
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
      $('.radioBtn').on('click', goToCheck);
      $('.previous').on('click', goToPreviousSlide);

      //answer -  태그
      //내가 비교해야 할것은 태그와 value와 값이 같은지 
      $(".radio-button").on("click",
function() {
                     var answer = $(this).closest(".slide").attr(
                           'data-tag');
                     var checkedValue = $(
                           "input[type=radio][name=radioBtn]:checked")
                           .val();
                     var btnId = $('input[name=radioBtn]:checked').attr(
                           'id');
                     var resultStr = '';
                     //alert(checkedValue); -인트
                     //alert(btnId);-100
                     //alert(answer);-스텝1
                     // 자바코드로 보기 div에 출력할 값
                     //alert(checkedValue+"="+btnId);
                     // 안에들어가는 값은 페이지 data-tag와비교
                     var test = '';
                     if (answer == 'step2') {
                        test = "int";
                     }
                     if (answer == 'step4') {
                        test = "double";
                     }
                     if (answer == 'step6') {
                        test = "string";
                     }
                     if (answer == 'step8') {
                        test = "boolean";
                     }

                     if (test == checkedValue) {
                        resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="270px"> </div>';
                        $('#answerResultDiv').html(resultStr);
                        if(checkedValue == "string"){
                        $('#javaCodeDiv').html(checkedValue + "=" + "\""+btnId+"\"");
                        }else{
                           $('#javaCodeDiv').html(checkedValue + "=" +btnId);
                        }
                        $('.next').removeAttr('disabled');
                        $('.next').off().on('click', goToNextSlide);

                     } else {
                        resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="270px"></div>';
                        $('#nextBtnDiv').html("");
                        $('#answerResultDiv').html(resultStr);
                        $('#javaCodeDiv').html("");
                     }
                  });
      
   });
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="overflow-x: hidden">
   <div class="pagination-container full-width-container">
      <div class="sized-container">
         <div class="pagination"></div>
      </div>
   </div>
   <div class="viewport full-width-container" style="padding: 5px;">
      <ul class="slide-container">

         <li class="slide" data-tag="step1">
            <div class="sized-container">
               <jsp:include page="contents215.jsp" flush="true" />
            </div>
         </li>
         <li class="slide" data-tag="step2">
            <div class="sized-container">
               <jsp:include page="contents211.jsp" flush="true" />
            </div>
         </li>
         <li class="slide" data-tag="step3">
            <div class="sized-container">
               <jsp:include page="contents216.jsp" flush="true" />
            </div>
         </li>
         <li class="slide" data-tag="step4">
            <div class="sized-container">
               <jsp:include page="contents212.jsp" flush="true" />
            </div>
         </li>
         <li class="slide" data-tag="step5">
            <div class="sized-container">
               <jsp:include page="contents217.jsp" flush="true" />
            </div>
         </li>
         <li class="slide" data-tag="step6">
            <div class="sized-container">
               <jsp:include page="contents213.jsp" flush="true" />
            </div>
         </li>
         <li class="slide" data-tag="step7">
            <div class="sized-container">
               <jsp:include page="contents218.jsp" flush="true" />
            </div>
         </li>
         <li class="slide" data-tag="step8">
            <div class="sized-container">
               <jsp:include page="contents214.jsp" flush="true" />
            </div>
         </li>
      </ul>
   </div>
   <div class="full-width-container">
      <div class="button-container sized-container">

         <div id="nextBtnDiv"></div>
         <button class="next">next</button>
         <div id="answerResultDiv"></div>
         <div id="javaCodeDiv"></div>
      </div>
   </div>
</body>
</html>   