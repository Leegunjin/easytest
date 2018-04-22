<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>[ contents42.jsp ]</title>

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

/*  CHECK & NEXT Button */
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

/* Container Div */
/* 전체 슬라이드의 버튼 컨테이너 */
.full-width-container {
	width: 100%;
	min-width: 320px;
}
/* 각 슬라이드 컨텐츠 컨테이너 */
.sized-container {
	max-width: 900px;
	width: 100%;
	margin: 0 auto;
}
/* 전체 슬라이드의 컨테이너 */
.slide-container {
	margin: 0; 
	padding: 0 1em 0;
	left: 0;
	position: relative;
	overflow: hidden;
	width: 10780px;
}

/* li tag - 각 컨텐츠*/
.slide {
	float: left;
	list-style-type: none;
}

.slide .sized-container {
	padding: 25px 0px;
}

/* 각 슬라이드의 버튼 컨테이너 */
.button-container {
	border-top: 1px solid black;
	overflow: hidden;
	padding-top: 30px;
}
.button-container button {
	float: right;
	margin-left: 30px;
}

/* 각 슬라이드의  페이지네이션 컨테이너 */
.pagination-container {
	margin-top: 75px;
}


.pagination {
	width: 100%;
	text-align: center;
	padding: 0 25px;
}

/* 페이지네이션의 각 Step 아이콘 */
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
/* 페이지네이션의 각 Step의 텍스트 */
.indicator .tag {
	position: absolute;
	top: -30px;
	left: 50%;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%);
	color: lightgray;
	white-space: now rap;
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
	width: 6.5%;
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

/* ul tag */
ul{
	list-style:none;
	padding-left:0px;
}

/* table 전체 속성 */
table {
	width: 800px;
	height: 200px;
	border-collapse: collapse;
	position: relative;
	background-color: #d7f4ff;
}

/* 각 열 속성 */
td{
	width: 400px;
}

/*예제 답 선택 Button*/
.button-one {
	padding:20px 60px;
	outline: none;
	background-color: #8BBCFF;
	border: none;
	border-radius:5px;
	box-shadow: 0 9px #95a5a6;
}

.button-one:hover{
	background-color: #6D6AB7;
}

.button-one:active {
	background-color: #A3A0ED;
	box-shadow: 0 5px #95a5a6;
	transform: translateY(4px);
}
  
/* 이미지 Flip */  
.cubeshape {
	width: 300px;
	text-align: center;
	margin: 0 auto;
	height: 130px;
	text-transform: uppercase;
	font-family: sans-serif;
}

.image_name {
	font-size: 30pt;
	font-weight: bold;
}

.container-button {
	position: relative;
/* 	top: 50%;
	left: 50%;
 	transform: translate(-50%, -50%);  
	width: 800px; */
	text-align: center;
}

.toggle-button-2 {
/*  display: inline-block; */
	vertical-align: middle; 
	padding-top: 16px;
	margin-left: 15px;
}

.cube2 {
	-webkit-transition: -webkit-transform 0.8s;
 	transition: transform 0.8s; /* Animate the transform properties */

	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d; 
}

.first_cube2, .second_cube2 {
	background: rgba(255,255,255,0);
	height: 130px;
	width: 100%;
    position: absolute;
}

.first_cube2, .second_cube2 {
	position: absolute;
    backface-visibility: hidden;
}

.first_cube2 {
	/* border-bottom: 4px solid #d7f4ff; */
	transform: perspective(600px) rotateX(0);
}

.second_cube2 {
	/* border-top: 4px solid #d7f4ff; */
	transform: perspective(600px) rotateX(180deg);
}

.toggle-button-2:hover .cube2 {
	transform: rotateX(180deg);
} 

.toggle-button-2 {
	-webkit-perspective: 600px; 
}

</style>

<!-- JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script type="text/javascript">
   
   $(function() {
     /* 변수 선언 */
     // 현재 슬라이드 숫자
      var currentSlide = 0;

       // ul 태그
      var $slideContainer = $('.slide-container'),
       // li 태그
       $slide = $('.slide'),
       // 슬라이드 개수 = li 태그의 개수
       slideCount = $slide.length,
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
		
      $('.answer' + currentSlide).on('click', goToCheck);
     
     // 정답 체크
     function goToCheck() {
		
		alert(currentSlide);
         var answer = $(this).val();
         alert(answer);
         var cNum = currentSlide + 1;
         
          $.ajax({
                url : "contents8",
                type : "POST",
                contentType : "application/json; charset=utf-8",
                dataType : "json",
                data : JSON.stringify ({
                   cNum : cNum
                   , answer : answer
                }),
                async: false,
                success : function(result) {
                     alert('success');
                     alert(result);
                     $('.answer' + currentSlide).attr('disabled', 'disabled');
                     var resultStr = '';
                    
                   if (result == false) {
                     resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"></div>';
                     //resultStr += '<div class="resultMsg">정답입니다.</div>';
                     $('#answerResultDiv').html(resultStr);
                    
                   } else if (result == true) {
                       resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"></div>';
                       //resultStr += '<div class="resultMsg">오답입니다.</div>';
                         $('#answerResultDiv').html(resultStr);
                      }

					$('.next').removeAttr('disabled');
                    $('.next').off().on('click', goToNextSlide);
                },
                error : function(err) {
                   console.log(err);
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
        
        $('.next').attr('disabled', 'disabled');
        $('.answer' + currentSlide).on('click', goToCheck);
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
			<div class="sized-container" style="width: 800px">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_1" src="../resources/img/if_quiz_10.png" style="max-height: 80%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_11" src="../resources/img/if_quiz_11.PNG" style="width: 225px; height: auto;">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">신호등="빨강";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer0" style="height: 180px;" value="멈춰 섭니다.">멈춰 섭니다.</button> </td>
						<td style="text-align: center"><button class="button-one answer0" style="height: 180px;" value="기다립니다.">기다립니다.</button> </td>
					</tr>	
				</table>
			</div>
    	</li>
    	<li class="slide" data-tag="Step2">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_1" src="../resources/img/if_quiz_10.png" style="max-height: 80%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_12" src="../resources/img/if_quiz_12.PNG" style="width: 225px; height: auto;">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">신호등="초록";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer1" style="height: 180px;" value="건넙니다.">건넙니다.</button> </td>
						<td style="text-align: center"><button class="button-one answer1" style="height: 180px;" value="기다립니다.">기다립니다.</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	<li class="slide" data-tag="Step3">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_1" src="../resources/img/if_quiz_10.png" style="max-height: 80%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_13" src="../resources/img/if_quiz_13.PNG" style="width: 225px; height: auto;">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">신호등="노랑";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer2" style="height: 180px;" value="건넙니다.">건넙니다.</button> </td>
						<td style="text-align: center"><button class="button-one answer2" style="height: 180px;" value="멈춰 섭니다.">멈춰 섭니다.</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	<li class="slide" data-tag="Step4">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_2" src="../resources/img/if_quiz_20.png" style="max-height: 80%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_21" src="../resources/img/pear_128.png">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">과일="배";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer3" style="height: 160px;" value="1500">1500</button> </td>
						<td style="text-align: center"><button class="button-one answer3" style="height: 160px;" value="2000">2000</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	 	<li class="slide" data-tag="Step5">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_2" src="../resources/img/if_quiz_20.png" style="max-height: 70%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_22" src="../resources/img/apple_128.png">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">과일="사과";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer4" style="height: 160px;" value="1000">1000</button> </td>
						<td style="text-align: center"><button class="button-one answer4" style="height: 160px;" value="800">800</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	    	</li>
    	 	<li class="slide" data-tag="Step6">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_2" src="../resources/img/if_quiz_20.png" style="max-height: 70%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_23" src="../resources/img/orange_128.png" style="height: 128px;">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">과일="오렌지";</h2>
        								</div>
      								</div>
    							</div>
							</div>						
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer5" style="height: 160px;" value="1500">1500</button> </td>
						<td style="text-align: center"><button class="button-one answer5" style="height: 160px;" value="2000">2000</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	<li class="slide" data-tag="Step7">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_2" src="../resources/img/if_quiz_20.png" style="max-height: 70%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_24" src="../resources/img/banana_128.png">
        								</div>
        								<div class="second_cube2">
          									<h1 class="image_name" style="color: #41AF39">과일="바나나";</h1>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer6" style="height: 160px;" value="800">800</button> </td>
						<td style="text-align: center"><button class="button-one answer6" style="height: 160px;" value="2000">2000</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	<li class="slide" data-tag="Step8">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_3" src="../resources/img/if_quiz_30.png" style="max-height: 60%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_31" src="../resources/img/if_quiz_13.PNG" style="width: 225px; height: auto;">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">신호등="노랑";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer7" style="height: 160px;" value="멈춰 섭니다.">멈춰 섭니다.</button> </td>
						<td style="text-align: center"><button class="button-one answer7" style="height: 160px;" value="건넙니다.">건넙니다.</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	<li class="slide" data-tag="Step9">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_3" src="../resources/img/if_quiz_30.png" style="max-height: 60%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_32" src="../resources/img/if_quiz_11.PNG" style="width: 225px; height: auto;">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">신호등="빨강";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer8" style="height: 160px;" value="기다립니다.">기다립니다.</button> </td>
						<td style="text-align: center"><button class="button-one answer8" style="height: 160px;" value="건넙니다.">건넙니다.</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	<li class="slide" data-tag="Step10">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_3" src="../resources/img/if_quiz_40.png" style="max-height: 50%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_21" src="../resources/img/orange_128.png" style="height: 128px;">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">과일="오렌지";</h2>
        								</div>
      								</div>
    							</div>
							</div>						
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer9" style="height: 160px;" value="800">800</button> </td>
						<td style="text-align: center"><button class="button-one answer9" style="height: 160px;" value="2000">2000</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
    	<li class="slide" data-tag="Step11">
      		<div class="sized-container">
				<table>
					<tr>
						<td rowspan="2"><img alt="if_quiz_3" src="../resources/img/if_quiz_40.png" style="max-height: 50%; width: auto;"></td>
						<td colspan="2" style="height: 120px; text-align: center">
							<div class="container-button">
								<div class="toggle-button-2">
      								<div class="cubeshape cube2">
        								<div class="first_cube2">
          									<img alt="if_quiz_21" src="../resources/img/apple_128.png">
        								</div>
        								<div class="second_cube2">
          									<h2 class="image_name" style="color: #41AF39">과일="사과";</h2>
        								</div>
      								</div>
    							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center"><button class="button-one answer10" style="height: 160px;" value="1000">1000</button> </td>
						<td style="text-align: center"><button class="button-one answer10" style="height: 160px;" value="1500">1500</button> </td>
					</tr>	
				</table>
      		</div>
    	</li>
  </ul>
</div>
<div class="full-width-container">
  <div class="button-container sized-container">
  <button class="next" disabled="disabled">next</button> 
  <button class="previous">previous</button>
    <div id="answerResultDiv"></div>
  </div>
</div>


</body>
</html>