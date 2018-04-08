<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../resources/css/styleContents.css">
   
    <title>[ contents71.jsp ]</title>

	<!-- JavaScript -->
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<script type="text/javascript">
   
	$(function() {
     /* 변수 선언 */
     // 현재 슬라이드 숫자
      var currentSlide = 0,
       // ul 태그
       $slideContainer = $('.slide-container'),
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
      
     // 문제 정답 확인
     function checkUserAnswer() {
      // 현재 슬라이드가 슬라이드 카운트 -1보다 작거나 같으면 Return  
         if(currentSlide >= slideCount - 1) {return}; 
         // 현재 윈도우 창의 가로 길이
           var windowWidth = $(window).width();
         
         // answer+각 슬라이드 숫자 로 지정된 클래스를 가져온다 
         var $answerClass = $('.answer' + currentSlide);
         // $answerClass에 저장된 클래스 개수를 가져온다.
         var answerCount = $answerClass.length;
         alert(answerCount);

         
         for(var i = 1; i <= answerCount; i++) {
            // answer01, answer02
            var answer = $('#answer' + currentSlide + i).val();
            alert(answer);
            answerArr.push(answer);
            alert(answerArr);
         }
         
         var cNum = currentSlide +1;
         
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
        // 현재 슬라이드가 슬라이드 카운트 -1보다 작거나 같으면 Return  
      if(currentSlide >= slideCount - 1) {return}; 
      // 현재 윈도우 창의 가로 길이
        var windowWidth = $(window).width();
      
      // answer+각 슬라이드 숫자 로 지정된 클래스를 가져온다 
      var $answerClass = $('.answer' + currentSlide);
      // $answerClass에 저장된 클래스 개수를 가져온다.
      var answerCount = $answerClass.length;
      alert(answerCount);

      
      for(var i = 1; i <= answerCount; i++) {
         // answer01, answer02
         var answer = $('#answer' + currentSlide + i).val();
         alert(answer);
         answerArr.push(answer);
         alert(answerArr);
      }
      
      var cNum = currentSlide +1;
      
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
             },
             error : function(err) {
                console.log(err);
                answerArr = [];
                alert("fail");
             }
             
          });
      
      
      
      // 현재 슬라이드 숫자를 하나씩 증가시킴
        currentSlide++;
      //ul 태그에 효과를 준닷!
        $slideContainer.animate({
          // 왼쪽으로 (윈도우 창의 가로길이 * 현재 슬라이드)의 숫자만큼 이동시킴
          left: -(windowWidth * currentSlide)
        });
      
      // 
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
      $('.check').on('click', goToNextSlide);
      $('.previous').on('click', goToPreviousSlide);
   });
   
   
   </script>
</head>


<body style="overflow-x:hidden"> <!-- 하단 스크롤바 없애는 설정 -->
   
<!-- 모든 화면을 감싸는 영역 -->
<div class="wrapper">

	<!-- 상단 부분을 감싸는 영역 -->
	<div class="top">
		<div class="pagination-container full-width-container">
	  		<div class="sized-container">
	    		<div class="pagination"></div>
	  		</div>
		</div>
	</div> <!-- 상단 부분 끝 -->   


	<!-- 중단 부분을 감싸는 영역 -->
	<div class="mid">
		<div class="viewport full-width-container">
  			<ul class="slide-container">
   		 	
   		 	<!-- 첫 번째 슬라이드 -->
   		 	<li class="slide" data-tag="Step1">
   		 	
	      		<div class="sized-container">
		        <!-- <h1></h1> -->
		        <!-- <h2>다음 빈 칸을 채우세요</h2> --> <br>
	        	
	        		<!-- 문제 나오는 영역 -->
		        	<div class="question_area"> 
		        	<!-- <img src="../resources/img/quiz711.png" width="200px"> -->
		        	<h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
					    <h2>int x = 5;</h2>
					    <h2>int y = 2;</h2>
		        	</div>
	        
	        		<!-- 답 입력하는 영역 -->
			        <div class="answer_area"> 
			        	<h1>x &nbsp; 
				        	<input type="text" class="answer0" 
				        	id="answer01"> &nbsp; y &nbsp; = &nbsp; 7 &nbsp; 
				        	<input type="text" class="answer0" id="answer02"> 
			        	</h1>
			     	</div>
	      		
	      		</div>
    		</li> <!-- 첫 번째 슬라이드 끝 -->
    		
    		
    		<!-- 두 번째 슬라이드 -->
   		 	<li class="slide" data-tag="Step2">
   		 	
	      		<div class="sized-container">
		        <!-- <h1></h1> -->
		        <!-- <h2>다음 빈 칸을 채우세요</h2> --> <br>
	        	
	        		<!-- 문제 나오는 영역 -->
		        	<div class="question_area"> 
		        	<!-- <img src="../resources/img/quiz711.png" width="200px"> -->
		        	<h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
					    <h2>int x = 5;</h2>
					    <h2>int y = 2;</h2>
		        	</div>
	        
	        		<!-- 답 입력하는 영역 -->
			        <div class="answer_area"> 
			        	 <h1>x &nbsp; <input type="text" class="answer1" 
			        	 id="answer11"> &nbsp; y &nbsp; = &nbsp; 3 &nbsp; 
			        	 <input type="text" class="answer1" id="answer12"> 
			        	 </h1>
			     	</div>
	      		
	      		</div>
    		</li> <!-- 두 번째 슬라이드 끝 -->
    		
    		
    		<!-- 세 번째 슬라이드 -->
   		 	<li class="slide" data-tag="Step3">
   		 	
	      		<div class="sized-container">
		        <!-- <h1></h1> -->
		        <!-- <h2>다음 빈 칸을 채우세요</h2> --> <br>
	        	
	        		<!-- 문제 나오는 영역 -->
		        	<div class="question_area"> 
		        	<!-- <img src="../resources/img/quiz711.png" width="200px"> -->
		        	<h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
					    <h2>int x = 5;</h2>
					    <h2>int y = 2;</h2>
		        	</div>
	        
	        		<!-- 답 입력하는 영역 -->
			        <div class="answer_area"> 
			        	<h1>x &nbsp; <input type="text" class="answer2" 
			        	id="answer21"> &nbsp; y &nbsp; = &nbsp; 10 &nbsp; 
			        	<input type="text" class="answer2" id="answer22"> 
			        	</h1>
			     	</div>
	      		
	      		</div>
    		</li> <!-- 세 번째 슬라이드 끝 -->
    		
    		
    		<!-- 네 번째 슬라이드 -->
   		 	<li class="slide" data-tag="Step4">
   		 	
	      		<div class="sized-container">
		        <!-- <h1></h1> -->
		        <!-- <h2>다음 빈 칸을 채우세요</h2> --> <br>
	        	
	        		<!-- 문제 나오는 영역 -->
		        	<div class="question_area"> 
		        	<!-- <img src="../resources/img/quiz711.png" width="200px"> -->
		        	<h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
					    <h2>int x = 5;</h2>
					    <h2>int y = 2;</h2>
		        	</div>
	        
	        		<!-- 답 입력하는 영역 -->
			        <div class="answer_area"> 
			        	<h1>x &nbsp; <input type="text" class="answer3" 
			        	id="answer31"> &nbsp; y &nbsp; = &nbsp; 2 &nbsp; 
			        	<input type="text" class="answer3" id="answer32"> 
			        	</h1>
			     	</div>
	      		
	      		</div>
    		</li> <!-- 네 번째 슬라이드 끝 -->
    		
    		
    		<!-- 다섯 번째 슬라이드 -->
   		 	<li class="slide" data-tag="Step5">
   		 	
	      		<div class="sized-container">
		        <!-- <h1></h1> -->
		        <!-- <h2>다음 빈 칸을 채우세요</h2> --> <br>
	        	
	        		<!-- 문제 나오는 영역 -->
		        	<div class="question_area"> 
		        	<!-- <img src="../resources/img/quiz711.png" width="200px"> -->
		        	<h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
					    <h2>int x = 5;</h2>
					    <h2>int y = 2;</h2>
		        	</div>
	        
	        		<!-- 답 입력하는 영역 -->
			        <div class="answer_area"> 
			        	<h1>x &nbsp; <input type="text" class="answer4" 
			        	id="answer41"> &nbsp; y &nbsp; = &nbsp; 1 &nbsp; 
			        	<input type="text" class="answer4" id="answer42"> 
			        	</h1>
			     	</div>
	      		
	      		</div>
    		</li> <!-- 다섯 번째 슬라이드 끝 -->
    		
    		
    		<!-- 여섯 번째 슬라이드 -->
   		 	<li class="slide" data-tag="Step6">
   		 	
	      		<div class="sized-container">
		        <!-- <h1></h1> -->
		        <!-- <h2>다음 빈 칸을 채우세요</h2> --> <br>
	        	
	        		<!-- 문제 나오는 영역 -->
		        	<div class="question_area"> 
		        	<!-- <img src="../resources/img/quiz711.png" width="200px"> -->
		        	<h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
					    <h2>int x = 5;</h2>
					    <h2>int y = 2;</h2>
		        	</div>
	        
	        		<!-- 답 입력하는 영역 -->
			        <div class="answer_area"> 
			        	<h1>x &nbsp; + &nbsp; y &nbsp; <input type="text" 
			        	class="answer5" id="answer51"> &nbsp; 7 &nbsp; 
			        	<input type="text" class="answer5" id="answer52"> 
			        	</h1>
			     	</div>
	      		
	      		</div>
    		</li> <!-- 여섯 번째 슬라이드 끝 -->
    		
    		
    		<!-- 일곱 번째 슬라이드 -->
   		 	<li class="slide" data-tag="Step7">
   		 	
	      		<div class="sized-container">
		        <!-- <h1></h1> -->
		        <!-- <h2>다음 빈 칸을 채우세요</h2> --> <br>
	        	
	        		<!-- 문제 나오는 영역 -->
		        	<div class="question_area"> 
		        	<!-- <img src="../resources/img/quiz711.png" width="200px"> -->
		        	<h1>빈칸에 알맞은 연산자와 기호를 입력해주세요.</h1>
					    <h2>int x = 5;</h2>
					    <h2>int y = 2;</h2>
		        	</div>
	        
	        		<!-- 답 입력하는 영역 -->
			        <div class="answer_area"> 
			        	<h1>x &nbsp; * &nbsp; y &nbsp; <input type="text" 
			        	class="answer6" id="answer61"> &nbsp; 20 &nbsp; 
			        	<input type="text" class="answer6" id="answer62"> 
			        	</h1>
			     	</div>
	      		
	      		</div>
    		</li> <!-- 일곱 번째 슬라이드 끝 -->
    		
    		</ul>
		</div> <!-- 중단 부분 끝 -->
    		

	<!-- 하단 부분을 감싸는 영역 -->
	<div class="bottom"> 

		<div class="full-width-container">
		  <div class="button-container sized-container">
		    <button class="check">check</button>
		    <button class="previous">previous</button>
		  </div>
		</div>

	</div> <!-- 하단 부분 끝 -->

</div> <!-- wrapper 끝 -->

</body>
</html>