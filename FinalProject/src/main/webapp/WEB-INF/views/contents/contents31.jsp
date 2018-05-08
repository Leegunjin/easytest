<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>contents31</title>
<link href="https://ss.googleapis.com/css?family=Jua" rel="stylesheet">
<!--  <link rel="stylesheet" type="text/css"
   href="../resources/css/styleContents31.css?ver=1"> -->
<style type="text/css">
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
   font-size: 18px;
   font-family: 'Jua', sans-serif;
   line-height: 88px;
   margin-top: 0px;
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
   width: 10800px;
}

.slide {
   float: left;
   list-style-type: none;
   height: 470px;
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
   margin-top: -17px;
   font-family: 'Jua', sans-serif;
   font-size: 20pt;
   color: #353538;
   font-weight: 600;
   font-style: inherit;
}

ul {
   list-style: none;
   padding-left: 0px;
}

.resultMsg {
   vertical-align: center;
}
.divfont{
margin-left: 30px;
}
/* html, body{
  width:100%;
  height:100%;
  margin:0;
} */

.page-wrapper{
  width:100%;
  height:100%;
  background:url(https://i.imgur.com/2ZgHKbQ.jpg) center no-repeat;
  background-size:cover;
}

/* .blur{
  -webkit-filter: blur(5px);
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
} */

a.btn{
     width:150px;
     height:50px;
     display:block;
	 margin:12px 0 0 -75px;
     position:absolute;
     top:86.5%; left:42%;
     font:1.125em 'Arial', sans-serif;
     font-weight:700;
     text-align:center;
     text-decoration:none;
     color:#fff;
     border-radius:5px;
     background:rgba(217,67,86,1);
     font-size: 30px;
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
     background:#EEEEEE;
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
  #contentsError.content{
      font-family: 'Jua', sans-serif;
    font-size: 28px;
    color: #393E46;
    padding-left: 3%;
    padding-top: 19%;
}
</style>


<!-- JavaScript -->
<script type="text/javascript"
   src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script type="text/javascript">
   
   $(function() {
     /* 변수 선언 */
     // 현재 슬라이드 숫자
      var currentSlide = 0;
      
      // 체크 버튼 생성
      var checkStr = '<button class="check">CHECK</button>';
      var str = '<button class="next">next</button>';
      if (currentSlide == 0) {
       $('#checkBtnDiv').html("");    
       $('#nextBtnDiv').html(str);
        $('.next').on('click', goToNextSlide);
     }  else {
         $('#checkBtnDiv').html(checkStr);
         $('.check').on('click', goToCheck);
     } 
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
       
         var userAnswer = $('#answer' + currentSlide).val();
         var cNum = currentSlide + 1;
         
             $.ajax({
                url : "contents5",
                type : "POST",
                contentType : "application/json; charset=utf-8",
                dataType : "json",
                data : JSON.stringify ({
                   cNum : cNum
                   ,userAnswer : userAnswer
                }),
                /*success : function(blankMap) {
                     //alert('success');
                   var resultStr = '';
                    
                   if (blankMap.result == false) {
                     resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"><br>';
                      resultStr += '사용자가 입력한 답 : '+blankMap.wrongAnswer+'<br>'; 
                     resultStr += '정답 : ' + blankMap.rightAnswer + '<br>';
                     resultStr += '틀린 이유 : ' + blankMap.errorReason + '<br>';
                     resultStr += '</div>';
                     $( document ).ready(function() {
                         $('.trigger').click(function() {
                            $('.modal-wrapper').toggleClass('open');
                           $('.page-wrapper').toggleClass('blur');
                            return false;
                         });
                       });
                     //resultStr += '<div class="resultMsg">정답입니다.</div>';
                     /* alert("blankMap.rightAnswer : "+blankMap.rightAnswer);
                     alert("blankMap.wrongAnswer : "+blankMap.wrongAnswer); 
                     $('#answerResultDiv').html(resultStr);
                    
                   } else if (blankMap.result == true) {
                      resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"></div>';
                         $('#answerResultDiv').html(resultStr);
                      }
                       //if (result) {
                       $('#checkBtnDiv').html("");
                         var str = '<button class="next"> next </button>';
                        $('#nextBtnDiv').html(str);
                        $('.next').on('click', goToNextSlide);
                },
                error : function(err) {
                   console.log(err);
                   alert("fail");
                }
                
             });*/
                success : function(blankMap) {
                   // alert('success');
                    answerArr = [];
                  var resultStr = '';
                  var userAnswerFull = ''; 
                  var erTest = '';
                  if (blankMap.result == false) {
                    resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"></div><br>';
                    resultStr += '<div class="page-wrapper"><a class="btn trigger" href="javascript:;">Error</a></div>';
                    
                    /* var wrongAnswer = blankMap.wrongAnswer;
                    var rightAnswer = blankMap.rightAnswer; */
                    erTest = blankMap.errorReason;
                    //alert("errorReason : "+erTest);
                    
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
                 /* var userAnswerFull = blankMap.wrongAnswer;
                 alert("userAnswerFull : "+userAnswerFull); */
                 userAnswerFull = blankMap.wrongAnswer;
                 //alert("userAnswerFull : "+userAnswerFull);
                 /* var errTxt = '';
                 $.each(erTest , function( i, val ) {
                    errTxt += '✔  '+ val + '<br>'; 
                    alert("errTxt : " + errTxt);
                   }); */
                 
                  $('.head1').html('입력한 답 : '+userAnswerFull);
                 $('.head1').val('입력한 답 : '+userAnswerFull);
                // alert("왜 안오니?");
                 $('.content').html('✔  '+erTest);
                 $('.content').val('✔  '+erTest);
                  
                      //if (result) {
                      $('#checkBtnDiv').html("");
                        var str = '<button class="next">next</button>';
                       $('#nextBtnDiv').html(str);
                       $('.next').on('click', goToNextSlide);
               },
               error : function(err) {
                  console.log(err);
                  alert("fail");
               }
               
            });
            
             $('.trigger').click(function() {
                $('.page-wrapper').toggleClass('blur');
              });
     }
     
     // 다음 슬라이드로 이동
      function goToNextSlide () {
       $('#answerResultDiv').html("");
        // 현재 슬라이드가 슬라이드 카운트 -1보다 작거나 같으면 Return  
      if(currentSlide >= slideCount - 1) {
        location.href = "clearChapter?c_num=310";
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
        
        if (currentSlide == 6 || currentSlide == 9) {
           $('#checkBtnDiv').html("");    
           $('#nextBtnDiv').html(str);
            $('.next').on('click', goToNextSlide);
      } else {
           $('#checkBtnDiv').html(checkStr);
           $('#nextBtnDiv').html("");
           $('.check').on('click', goToCheck);
      }
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
<body style="overflow-x: hidden">

   <div class="pagination-container full-width-container">
      <div class="sized-container">
         <div class="pagination"></div>
      </div>
   </div>
   <div class="viewport full-width-container">

      <ul class="slide-container">

         <li class="slide" data-tag="Step1">
            <div class="sized-container">
               <jsp:include page="contents311.jsp" flush="true" />
            </div>

         </li>


         <li class="slide" data-tag="Step2">

            <div class="question-container">
               <h1>빈칸에 알맞은 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/31c1.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer1" id="answer1">
               </h1>
               <div class="modal-wrapper">
                 <div class="modal">
                   <div class="head1" style="font-size: 40px">
                   testMSG
                     <!-- <a class="btn-close trigger" href="javascript:;"></a> -->
                   </div>
                   <div class="content" id="contentErrDiv" style="font-size: 40px;">
                   </div>
                 </div>
               </div>
            </div>
         </li>

         <li class="slide" data-tag="Step3">

            <div class="question-container">
               <h1>빈칸에 알맞은 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/31c2.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer2" id="answer2">
               </h1>
            </div>
         </li>

         <li class="slide" data-tag="Step4">

            <div class="question-container">
               <h1>빈칸에 알맞은 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/31c3.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer3" id="answer3">
               </h1>
            </div>
         </li>

         <li class="slide" data-tag="Step5">

            <div class="question-container">
               <h1>빈칸에 알맞은 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/31c4.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer4" id="answer4">
               </h1>
            </div>
         </li>

         <li class="slide" data-tag="Step6">

            <div class="question-container">
               <h1>빈칸에 알맞은 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/31c5.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer5" id="answer5">
               </h1>
            </div>
         </li>
         <li class="slide" data-tag="Step7">
            <div class="question-container">
               <div class="sized-container">
                  <jsp:include page="contents313.jsp" flush="true" />
               </div>
               </div>
         </li>
         <li class="slide" data-tag="Step8">

            <div class="question-container">
               <h1>빈칸에 공통으로 들어갈 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/31c6.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer7" id="answer7">
               </h1>
            </div>
         </li>
         
         <li class="slide" data-tag="Step9">
            <div class="question-container">
               <h1>빈칸에 공통으로 들어갈 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/31c7.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer8" id="answer8">
               </h1>
            </div>
         </li>
         <li class="slide" data-tag="Step10">
            <div class="question-container">
               <div class="sized-container">
                  <jsp:include page="contents312.jsp" flush="true" />
               </div>
               </div>
         </li>
         <li class="slide" data-tag="Step11">

            <div class="question-container">
               <h1>빈칸에 공통으로 들어갈 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/sic.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer10" id="answer10">
               </h1>
            </div>
         </li>

         <li class="slide" data-tag="Step12">

            <div class="question-container">
               <h1>빈칸에 공통으로 들어갈 연산자를 입력해주세요.</h1>
               <img alt="" src="../resources/img/duk.png"
                  style="width: 600px; height: 250px; transform: translate(26%, 0%);">
            </div>

            <div class="sized-container">
               <h1>
                  <input type="text" class="answer11" id="answer11">
               </h1>
               <div class="modal-wrapper">
                 <div class="modal">
                   <div class="head1">
                     <a class="btn-close trigger" href="javascript:;"></a>
                   </div>
                   <div class="content" id="contentsError">
                   </div>
                 </div>
               </div>
            </div>
         </li>
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
         <div class="page-wrapper">
  <!-- <a class="btn trigger" href="javascript:;">Error</a> -->
</div>
<!-- <div class="modal-wrapper">
  <div class="modal">
    <div class="head">
      <a class="btn-close trigger" href="javascript:;"></a>
    </div>
    <div class="content" id="contentsError">
    </div>
  </div>
</div> -->
      </div>
      
   </div>
   


</body>
</html>