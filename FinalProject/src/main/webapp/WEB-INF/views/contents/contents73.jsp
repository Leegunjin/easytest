<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<style type="text/css">
	
		.codeEditor{
			background-color: black;
			color: #8bf95c;
			margin: 0;
			width: 400px;
			height: 500px;
		}
		
		.shortCodeEditor{
			background-color: black;
			color: #8bf95c;
			margin: 0;
			width: 400px;
			height: 50px;
		}
	
		
		/* Show tooltip content on hover */
		[data-tooltip]:hover:before,
		[data-tooltip]:hover:after {
		  visibility: visible;
		  bottom: 90%;
		}
		
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
		   height:40px;
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
		   padding: 10px 0px;
		}
		
		.button-container {
		   border-top: 1px solid black;
		   overflow: hidden;
		   padding-top: 30px;
		   height: 80px;
		}
		
		.button-container button {
		   float: right;
		   margin-left: 30px;
		}
		
		.pagination-container {
		   margin-top: 70px;
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
		
		ul {
		   list-style: none;
		   padding-left: 0px;
		}
		
		.concept{
		   /* background-color: yellow; */
		}
		
		.example{
		   /* background-color: green; */
		   margin-left: auto;
		   margin-right: auto;
		   width: 800px;
		   height: 60px;
		   margin-top: 50px;
		   padding: 0px;
		   border: 1px solid #37B595; 
		   border-radius: 1em;
		}
		
		.buttonDiv{
		   /* background-color: blue; */
		   text-align: center;
		}
		
		/* .buttonDiv input{
		    width:500px;
		    background-color: #f1f1f1;
		    border: thick;
		    color:black;
		    padding: 15px 0;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 15px;
		    margin: 4px;
		    cursor: pointer;
		} */
		
		.buttonDiv :HOVER {
		   background-color: black;
		   color: white;
		}
		
		.buttonDiv + div{
		   /* background-color: green; */
		   text-align: center;
		   margin-top: 70px;
		   margin-left: 130px;
		   width: 500px;
		   height: 50px;
		   padding: 10px;
		   border: 1px solid orange; 
		   border-radius: 1em;
		}
		
		
	</style>
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/styleContents.css"> -->
	<script type="text/javascript">
	   $(function() {
	      var currentSlide = 0;
	      var testCount = 0;
	      
	      $('#next').attr('disabled', true);
	      $('#btnShowJava').hide();
	      $('.buttonDiv + div').hide();
	      
	      var resultStr = '';
	      $('.buttonDiv input').on('click', function(){
	         var clickedVal = $(this).val();
	         var clickedAns = $(this).attr('answer');
	         var slideAns = $(this).parent().attr('answer');
	         //alert(clickedAns);
	         //alert(slideAns);
	         if(clickedAns == slideAns){
	            //클릭한 답이 맞으면
	            //next버튼 눌리게 하고
	            $('#next').attr('disabled', false);
	            //정답 이미지 넣고
	            resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"> </div>';
	            //메세지 컨캣
	               //resultStr += '<div> 정답입니다! </div>';
	               //정답메세지 삽입
	               $('#answerResultDiv').html(resultStr);
	            //자바로 보기 버튼 나타내기
	               //$('#btnShowJava').show();
	            //자바로 보기 누르면
	               $('#btnShowJava').on('click',function(){
	                  var testClass = '.divShowJava' + currentSlide;
	                  //alert(testClass);
	                  var javacode = clickedAns + ' 변수이름 = ' + clickedVal + ';';
	                  $(testClass).show();
	               $(testClass).html(javacode);
	               //$('.divShowJava0').show();
	               //$('.divShowJava0').html(javacode);
	               });
	         }else{
	            //틀렸으면
	            resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
	               resultStr += '<div> 틀렸습니다! 그건 '+ clickedAns +' 이예요 </div>';
	               $('#answerResultDiv').html(resultStr);
	         }
	      });
	
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
	
	      $('#next').on('click',goToNextSlide);
	      function goToNextSlide() {
	    	
	         $('#answerResultDiv').html("");
	         if (currentSlide >= slideCount - 1) {
	            location.href = "clearChapter?c_num=110";
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
	         $('#btnShowJava').hide();
	         $('#next').attr('disabled', true);
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
	         $('#next').attr('disabled',false);
	         $('#btnShowJava').show();
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
	      $('#previous').on('click', goToPreviousSlide);
	      
	      $('#printBtn').on('click', function() {
		  	var str = '<input type="image" src="">';	  
		  	$('#resultDiv').html(str);
		  });
	   });
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>contents73</title>
</head>
<body style="overflow-x: hidden">

   <div class="pagination-container full-width-container">
      <div class="sized-container">
         <div class="pagination"></div>
      </div>
   </div>
   <div class="viewport full-width-container" style="padding: 5px;">
      <ul class="slide-container">
         <li class="slide" data-tag="day">
            <div class="sized-container" >
               <div class="concept">
                  <h1>
                  	  다음 칸에 필요한 숫자를 선택해 주세요. 
                  </h1>
               </div>
               <div class="example">
                  <h2>
                  	Q) 월요일 = 1; 화요일 = 2; 수요일 = 3; 목요일 = 4; 금요일 = ?
                  </h2>
                  <div class="buttonDiv" answer="5">
                     <input type="button" value="3" answer="3" class="shortCodeEditor"> 
                     <input type="button" value="4" answer="4" class="shortCodeEditor"> 
                     <input type="button" value="5" answer="5" class="shortCodeEditor"> 
                     <input type="button" value="6" answer="6" class="shortCodeEditor">
                  </div>
                  <div class="divShowJava0"></div>
               </div>
            </div>
         </li>
         <li class="slide" data-tag="class">
            <div class="sized-container">
               <div class="concept">
                  <h1>
                                          다음 칸에 필요한 숫자를 선택해 주세요.
                  </h1>
               </div>
               <div class="example">
                  <h2>
                     Q) 1교시 = 1; 2교시 = 2; 3교시 = 3;...6교시 = ?
                  </h2>
                  <div class="buttonDiv" answer="6">
                     <input type="button" value="2" answer="2" width="100" class="shortCodeEditor"> 
                     <input type="button" value="4" answer="4" width="100" class="shortCodeEditor"> 
                     <input type="button" value="6" answer="6" width="100" class="shortCodeEditor"> 
                     <input type="button" value="8" answer="8" width="100" class="shortCodeEditor">
                  </div>
                  <div class="divShowJava1"></div>
               </div>
            </div>
         </li>
         <li class="slide" data-tag="day-array">
            <div class="sized-container">
               <div class="concept">
                  <h1>
                                         월요일에서 금요일까지를 나타내는 String 배열을 골라주세요. 
                  </h1>
               </div>
               <div class="example">
                  <h2>
                    Q) String 요일 배열을 선언, 생성하는 코드를 고르세요. 
                  </h2>
                  <div class="buttonDiv" answer="String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};" >
                     <input type="button" value="String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};" answer="String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};"  width="500" class="shortCodeEditor"><br>
                     <input type="button" value="String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;}" answer="String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;}" width="500" class="shortCodeEditor"><br>
                     <input type="button" value="[ ]String 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};" answer="[ ]String 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};" width="500" class="shortCodeEditor"><br>
                     <input type="button" value="[ ]String 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;}" answer="[ ]String 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;}" width="500" class="shortCodeEditor">
                  </div>
                  <div class="divShowJava2"></div>
               </div>
            </div>
         </li>
         <li class="slide" data-tag="class-array">
            <div class="sized-container">
               <div class="concept">
                  <h1>
                    1교시에서 6교시까지 배열을 표현해 봅시다.
                  </h1>
               </div>
               <div>
               	<pre class="codeEditor">
               		String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};
               	</pre>
               </div>
               <div class="example">
                  <h2>
                     Q) int 수업 배열을 선언, 생성하는 코드를 고르세요. 
                  </h2>
                  <div class="buttonDiv" answer="int[ ] 교시 = {1, 2, 3, 4, 5, 6};">
                     <input type="button" value="int[ ] 교시 = {1, 2, 3, 4, 5, 6};" answer="int[ ] 교시 = {1, 2, 3, 4, 5, 6};" class="shortCodeEditor">
                     <input type="button" value="int[ ] 수업 = {1, 2, 3, 4, 5, 6}" answer="int[ ] 교시 = {1, 2, 3, 4, 5, 6}" class="shortCodeEditor">
                     <input type="button" value="[ ]int 수업 = {1, 2, 3, 4, 5, 6}" answer="[ ]int 교시 = {1, 2, 3, 4, 5, 6}" class="shortCodeEditor">
                     <input type="button" value="[ ]int 수업 = {1, 2, 3, 4, 5, 6};" answer="[ ]int 교시 = {1, 2, 3, 4, 5, 6};" class="shortCodeEditor">
                  </div>
                  <div class="divShowJava3"></div>
               </div>
            </div>
         </li>
         <li class="slide" data-tag="day-for">
            <div class="sized-container">
               <div class="concept">
                  <h3>
                    String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};<br>
                  </h3>
               </div>
               <div class="example">
                  <h2>
                     	[요일] 배열에 대한 for문을 선택해 주세요. 
                  </h2>
                   <div class="buttonDiv" answer="for (int i = 1; i &lt;= 요일.length; i++) {  }">
                     <input type="button" value="for (int i = 1; i &lt;= 요일.length; i++) {     }" answer="for (int i = 1; i &lt;= 요일.length; i++) {  }" class="shortCodeEditor">
                     <input type="button" value="for (int i = 1; i &lt; 요일.length; ++i) {     }" answer="for (int i = 1; i &lt; 요일.length; ++i) {     }" class="shortCodeEditor">
                     <input type="button" value="for (int i = 1; i &lt;= 요일.length; i--) {     }" answer="for (int i = 1; i &lt;= 요일.length; i--) {     }" class="shortCodeEditor">
                     <input type="button" value="for (int i = 1; i &lt;= 요일.length; --i) {     }" answer="for (int i = 1; i &lt;= 요일.length; --i) {     }" class="shortCodeEditor">
                  </div>
               </div>
            </div>
         </li>
         <li class="slide" data-tag="class-for">
            <div class="sized-container">
               <div class="concept">
                  <h3>
                    int[ ] 교시 = {1, 2, 3, 4, 5, 6};<br>
                  </h3>
               </div>
               <div class="example">
                  <h2>
                     	[int] 배열에 대한 for문을 선택해 주세요. 
                  </h2>
                   <div class="buttonDiv" answer="for (int j = 1; j &lt;= 교시.length; j++) {  	}">
                     <input type="button" value="for (int j = 1; j &lt;= 교시.length; j++) {  	}" answer="for (int j = 1; j &lt;= 교시.length; j++) {  	}" class="shortCodeEditor">
                     <input type="button" value="for (int j = 1; j &lt;= 교시.length; ++j) {  	}" answer="for (int j = 1; j &lt;= 교시.length; ++j) {  	}" class="shortCodeEditor">
                     <input type="button" value="for (int j = 1; j &lt;= 교시.length; j--) {  	}" answer="for (int j = 1; j &lt;= 교시.length; j--) {  	}" class="shortCodeEditor">
                     <input type="button" value="for (int j = 1; j &lt;= 교시.length; --j) {  	}" answer="for (int j = 1; j &lt;= 교시.length; --j) {  	}" class="shortCodeEditor">
                  </div>
               </div>
            </div>
         </li>
         <li class="slide" data-tag="table1">
            <div class="sized-container">
               <div class="concept">
                  <pre class="codeEditor">
	               String[ ] 요일 = {&ldquo;월요일&ldquo;,&ldquo;화요일&ldquo;,&ldquo;수요일&ldquo;,&ldquo;목요일&ldquo;,&ldquo;금요일&ldquo;};
	               int[ ] 교시 = {1, 2, 3, 4, 5, 6};
	               for (int j = 1; j &lt;= 교시.length; j++) {  	
	               	for (int i = 1; i &lt;= 요일.length; i++) {  
	               	<input type="button" value="PRINT" id="printBtn" name="printBtn">
	               	}
	               }
                  </pre>
               </div>
               <!-- <div class="example">
               </div> -->
               <div id="resultDiv"></div>
            </div>
         </li>
      </ul>
   </div>
   <div class="full-width-container">
      <div class="button-container sized-container">
         <div id="checkBtnDiv"></div>
         <div id="nextBtnDiv"></div>
         <button class="next" id="next">next</button>
         <button class="previous" id="previous">previous</button>
         <!-- <button class="next" id="btnShowJava">Java로 보기</button> -->
         <div id="answerResultDiv"></div>
      </div>
   </div>

</body>
</html>