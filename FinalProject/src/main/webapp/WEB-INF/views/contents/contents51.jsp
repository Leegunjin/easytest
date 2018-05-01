<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>contents51</title>
<link href="https://ss.googleapis.com/css?family=Jua" rel="stylesheet">

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
   font-size: 25px;
   font-family: 'Jua', sans-serif;
   line-height: 30px;
   font-weight: bold;
   margin-top: 21px;
}

h2 {
   font-size: 18px;
    font-family: 'Jua', sans-serif;
    line-height: 88px;
    margin-top: 17px;
    margin-left: 314px;
    width: 400px;
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
   padding: 0;
   padding-left: 0px;
   position: relative;
   left: 0;
   overflow: hidden;
   width: 7840px;
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
   width: 7%;
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
   width: 40px;
   height: 40px;
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

.divfont {
   margin-left: 30px;
}

[class^="question_div"] {
	margin-top: 60px;
	width: 600px;
	font-size:22px;
}

.question_div1{
	margin-left: 180px;
    height: 15px;
    margin-right: -33px;
}

.question_div2 {
	margin-left: 458px;

}
.question_div3{
   margin-left: 510px;
    height: 10px;
  
}

/* Error Button */
a.btn{
     width:150px;
     height:50px;
     display:block;
     margin: 13px  0 0 -75px;
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
     padding-top: 11px;
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
     background-color: rgba(217,67,86,1);
     font-size: 30px;
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
     }  /* else {
         $('#checkBtnDiv').html(checkStr);
         $('.check').on('click', goToCheck);
     }  */
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
         		answer = $('#answer' + currentSlide + i).val();
         		answerArr.push(answer);
			}
    
         var cNum = currentSlide + 1;
         
             $.ajax({
                url : "contents9",
                type : "POST",
                contentType : "application/json; charset=utf-8",
                dataType : "json",
                data : JSON.stringify ({
                   cNum : cNum
                   ,answerArr : answerArr
                }),
                success : function(blankMap) {
                   var resultStr = '';
                    
                   if (blankMap.result == false) {
                	   resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"></div><br>';
                       resultStr += '<div class="page-wrapper"><a class="btn trigger" href="javascript:;">Error</a></div>';
                       
                    	var wrongAnswer = blankMap.wrongAnswerArr;
                	   	var rightAnswer = blankMap.rightAnswerArr;
     					var errorReason = blankMap.errorReasonArr;
     					
                     $('#answerResultDiv').html(resultStr);
                    
                   } else if (blankMap.result == true) {
                	   esultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"></div>';
                       $('#answerResultDiv').html(resultStr);
                      }
                   
                   $('.trigger').click(function() {
                 	     $('.modal-wrapper').toggleClass('open');
                 	    $('.page-wrapper').toggleClass('blur');
                 	     return false;
                   });
                   
                 	    var errTxt = '';
                        $.each(errorReason , function( i, val ) {
                        	errTxt += '?  '+ val + '<br>'; 
                	   });
                        
                        $('.content').html(errTxt);
                        $('.content').val(errTxt);
                   
                       //if (result) {
                       $('#checkBtnDiv').html("");
                         var str = '<button class="next"> next </button>';
                        $('#nextBtnDiv').html(str);
                        $('.next').on('click', goToNextSlide);
                },
                error : function(err) {
                   console.log(err);
                }
                
             });
            
     }
     
     // 다음 슬라이드로 이동
      function goToNextSlide () {
       $('#answerResultDiv').html("");
        // 현재 슬라이드가 슬라이드 카운트 -1보다 작거나 같으면 Return  
      if(currentSlide >= slideCount - 1) {
        location.href = "clearChapter?c_num=519";
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
        
        if (currentSlide == 0 || currentSlide == 1|| currentSlide == 2||currentSlide == 4||currentSlide == 6) {
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

         <!-- T)연산자 튜토리얼 -->
         <li class="slide" data-tag="Step1">
            <div class="sized-container">
               <jsp:include page="contents511.jsp" flush="true" />
               
            </div>

         </li>
         <!-- T) 출력문튜토리얼 -->
         <li class="slide" data-tag="Step2">
            <div class="sized-container">
               <jsp:include page="contents512.jsp" flush="true" />
            </div>
         </li>
         <!-- T) for문튜토리얼 -->
         <li class="slide" data-tag="Step3">
            <div class="sized-container">
               <jsp:include page="contents513.jsp" flush="true" />
            </div>
         </li>
      <!--  for 문제  -->
      <li class="slide" data-tag="Step4">
   <h1> 1부터 10까지의 정수의 합을 출력하려고 합니다. <br>빈 칸에 알맞는 답을 입력해 주세요</h1>
   <div class="sized-container">
               <div class="question_div1">
              
                   int sum = 0 ;<br><br>
                   for ( int i = <input type="text" class="answer3" id="answer31" maxlength="1"> ; 
                   i &lt;= 10 ; 
                   <input type="text" class="answer3" id="answer32" maxlength="3" style="width:70px "height="40px;"> 
                    ) { <br><br>
                    	&emsp;&emsp;
                    	sum = sum + i ;<br><br>
                      	&emsp;&emsp;
                       	System.out.print("1부터 10까지 정수의 합은 : " + sum ) ;<br>
                    }
              </div>
				<!-- STEP 4 Error Message START -->
        		<div class="modal-wrapper">
        			<div class="modal">
          				<div class="head1" style="font-size: 40px">
            				Error Check
           					<a class="btn-close trigger" href="javascript:;"></a>
          				</div>
      					<div class="content" id="contentErrDiv"></div>
      				</div>
      			</div>
				<!-- STEP 4 Error Message END -->
              </div>
         </li>    
         <!-- T) 이중for문튜토리얼 -->
         <li class="slide" data-tag="Step5">
            <div class="sized-container">
               <jsp:include page="contents514.jsp" flush="true" />
            </div>
         </li>
         <!--  이중for 문제 -->
           <li class="slide" data-tag="Step6">

            <h1> 1부터 5까지의 숫자와 5부터 1까지의 숫자를 더한 값을 차례로 출력하려고 합니다. <br>
            	빈칸에 알맞은 답을 입력해 주세요.</h1>
               <div class="question_div2" style="border-color: aqua; border: 1px;">
                int sum = 0;<br><br>
                for ( int first = 1 ; first &lt;= 5 ; first <input type="text" class="answer5" id="answer51" maxlength="2" style="width:40px "height="40px;"> ) { <br>
                	&emsp;&emsp;
					for ( int second = 5 ; second >= 1 ; second <input type="text" class="answer5" id="answer52" maxlength="2" style="width:40px "height="40px;"> ) { <br>             
						&emsp;&emsp;&emsp;&emsp; 
                		sum = first + second; <br>
                		&emsp;&emsp;&emsp;&emsp;
                		System.out.print ( sum + " " ); <br>
                	&emsp;&emsp;
     				}<br>
     				&emsp;&emsp;
                	System.out.println();<br>
                } <br>
              </div>
         	 <!-- STEP 6 Error Message START -->
        		<div class="modal-wrapper">
        			<div class="modal">
          				<div class="head1" style="font-size: 40px">
            				Error Check
           					<a class="btn-close trigger" href="javascript:;"></a>
          				</div>
      					<div class="content" id="contentErrDiv"></div>
      				</div>
      			</div>
				<!-- STEP 6 Error Message END -->
         </li>
         <!-- T) while문튜토리얼 -->
         <li class="slide" data-tag="Step7">
            <div class="sized-container">
               <jsp:include page="contents515.jsp" flush="true" />
            </div>
         </li>
           <li class="slide" data-tag="Step8">
            <h1> 0 부터 4까지의 정수를 출력하세요 빈 칸에 알맞는 답을 입력해 주세요</h1>
               <div class="question_div3">
               
                    int = 0;<br><br>
                    while ( i &lt; <input type="text" class="answer7" id="answer71" maxlength="2" style="width:40px "height="40px;"> ) { 
                       <br><br>&emsp; &emsp;
                       System.out.print ( " 정수 : " + i ) ; <br>
                      &emsp; &emsp; 
                         i++ ;<br><br>
                    }
              </div>
               <!-- STEP 7 Error Message START -->
        		<div class="modal-wrapper">
        			<div class="modal">
          				<div class="head1" style="font-size: 40px">
            				Error Check
           					<a class="btn-close trigger" href="javascript:;"></a>
          				</div>
      					<div class="content" id="contentErrDiv"></div>
      				</div>
      			</div>
				<!-- STEP 7 Error Message END -->
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