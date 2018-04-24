<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Drag & Drop</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
	$(function(){
		$('#btnShowJava').hide();
		//$('#next').attr('disabled', true);
		$('.btnSubject').draggable({ 
			revert : true
		});
		var count = 0;
		var timeTable = new Array();		
		$('.btnTable').droppable({
			drop: function(event, ui){
				var dropItem = $(ui.draggable);
				var subName = dropItem.text();
				var dropcount = $(this).attr("count");
				//alert(dropcount);
				if(count == dropcount){
					//$('.divSubject').append(subName + " ");
					$(this).append(dropItem);
					timeTable[count] = subName;
					//alert(timeTable);
					count++;
					if(count == 4){
						$('#btnShowJava').show();
					}
				}
			}
		});
		
		$('#btnShowJava').on('click',function(){
			var strJava = '과목 시간표[ ] = {'+timeTable[0]+','+timeTable[1]+','+timeTable[2]+','+timeTable[3]+'}';
			$('#divSubject').html(strJava);
			$('#next').attr('disabled', false);
		});
		
		$('#next').on('click',function(){
			var arrConcept = '<h1>입력한 시간표는 '+timeTable[0]+','+timeTable[1]+','+timeTable[2]+','+timeTable[3]+'입니다.</h1>'
			var inputTimeTable = '{'+timeTable[0]+','+timeTable[1]+','+timeTable[2]+','+timeTable[3]+'};';
			$('#concept2').html(arrConcept);
			$('#inputTimeTable').text(inputTimeTable);
			//$('#next').attr('disabled', true);
		});
		
		$('#btnReverse1').on('click',function(){
			var btnReverse1 = '<input type="button" value="자료형">';
			$('#btnReverse').html(btnReverse1);
			$(this).attr('disabled', true);
		});
		
		$('#btnReverse2').on('click',function(){
			var btnReverse2 = '<input type="button" value="배열 이름[ ] = ">';
			$('#btnReverse').append(btnReverse2);
			$(this).attr('disabled', true);
		});
		
		$('.noAnswer').on('click',function(){
			alert('noanswer');
		});
		
		$('.yesAnswer').on('click',function(){
			$('#next').attr('disabled', false);
		});
		
		$('#btnShowJava2').on('click',function(){
			var showArray = '<div class="jb-table"> <div class="jb-table-row">	<div class="jb-table-cell"> <p></p> </div><div class="jb-table-cell"> <p>0 열</p></div> <div class="jb-table-cell"> <p>1 열</p> </div> <div class="jb-table-cell"> <p>2 열</p></div> <div class="jb-table-cell"> <p>3 열</p> </div></div> <div class="jb-table-row"><div class="jb-table-cell"> <p>0 행</p> </div> <div class="jb-table-cell">  <p>[0][0]</p> </div> <div class="jb-table-cell"> <p>[0][1]</p> </div> <div class="jb-table-cell"> <p>[0][2]</p> </div> <div class="jb-table-cell"> <p>[0][3]</p></div> </div>	<div class="jb-table-row"><div class="jb-table-cell"> <p>1 행</p>	 </div>	<div class="jb-table-cell">	<p>[1][0]</p></div><div class="jb-table-cell"><p>[1][1]</p></div><div class="jb-table-cell"><p>[1][2]</p></div><div class="jb-table-cell"><p>[1][3]</p></div></div><div class="jb-table-row"><div class="jb-table-cell"><p>2 행</p></div><div class="jb-table-cell"><p>[2][0]</p></div><div class="jb-table-cell"><p>[2][1]</p></div><div class="jb-table-cell"><p>[2][2]</p></div><div class="jb-table-cell"><p>[2][3]</p>		        </div>		      </div>		    </div>';
			$('#example4').html(showArray);
		})
		
		var clickCount = 0;
		$('#inputTimeTable').on('click',function(){
			alert(clickCount);
			var btnReverse3 = '<input type="button" value="{배열에 들어간 것들}">';
			if(clickCount == 0){
				$('#btnReverse').append(btnReverse3);
				$('#next').attr('disabled', false);
				cilckCount++;
			}
		});
		
		
		var currentSlide = 0;
		var testCount = 0;
		
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
				location.href = "clearChapter?c_num=620";
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
		
	});
		/* $("#images div img").draggable({
			start: function(event,ui) {
				$(this).draggable( "option", "revert", true );
				$("#images div img").css("zIndex",10);
				$(this).css("zIndex",100);
			}
		});
		var count = 0; */
		/* $("#boards div img").droppable({
			drop: function(event,ui) {
				var droptitle = $(this).attr("title");
				var drophtml = $(this).html();
				var dragtitle = ui.draggable.attr("title");
				/* if( dragtitle == droptitle ) {
					//$('#ansDiv').append("<img src='resources/img/number3.png'>");
					//$('#ansDiv').append();
					//$(this).remove();
					
					count++;
					if(count == 3){
						//alert(count);
						$('#showJava').show();
						$('#goNext').show();
					}
					$(this).html('');
					ui.draggable.draggable( "option", "revert", false );
					var droppableOffset = $(this).offset();
					var x = droppableOffset.left + 1;
					var y = droppableOffset.top + 1;
					ui.draggable.offset({ top: y, left: x });
				} */
	/* 		}
		});
	});
	$(document).ready(function(){
		$("#images div").sort(function(){
			return Math.random()*10 > 5 ? 1 : -1;
		}).each(function(){
			$(this).appendTo( $(this).parent() );    
		});
		$("#boards div").sort(function(){
			return Math.random()*10 > 5 ? 1 : -1;
		}).each(function(){
			$(this).appendTo( $(this).parent() );    
		});
	}); */
</script>
<style>
	*{
		border: none;
	}
	
	
	
	#images > div, #boards > div {
		float:left;
		width:100px;
		height:100px;
		/* border:1px solid #000; */
		margin:5px;
	}
	#images div img {
		width:100px;
		height:100px;
		margin-left: 10px;
	}
	#boards {
		clear:both;
	}
	#boards > div {
		font-size:2em;
		line-height:100px;
		text-align:center;
		margin: 5px;
	}
	.ansDiv{
		background-color: yellow;
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
	height:80px;
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

li {
	text-align: center;
}

li div{
	display: inline-block;
	text-align: center;
}

/* #images{
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	height: 170px;
	margin-top: 20px;
	padding: 10px;
	border: 1px solid orange; 
	border-radius: 1em;
	text-align: center;
}

#boards{
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	height: 170px;
	padding: 10px; 
	border: 1px solid orange; 
	border-radius: 1em;
	/* text-align: center; */
} */

#images div div, #boards div div{
	display: inline-block;
}

#images > div, #board > div{
	text-align: center;
}

.concept{
	background-color: yellow;
}

.example{
	/* background-color: green; */
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	height: 250px;
	margin-top: 50px;
	padding: 10px;
	border: 1px solid orange; 
	border-radius: 1em;
}

.divSubject{
	background-color: yellow;
	width: 600px;
	height: 100px;
}

.divTimetable{
	margin-top: 20px;
	background-color: yellow;
	width: 600px;
	height: 100px;
}

.btnSubject{
	width:100px;
	height:50px;
    background-color: #f1f1f1;
    border: 1px solid black;
    color:black;
    /* padding: 15px 0; */
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    /* margin: 4px; */
    cursor: pointer;
}

.divTimetable div{
	width:100px;
    background-color: #f1f1f1;
    border: 1px solid black;
    border-color: black;
    color:black;
    /* padding: 15px 0; */
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    /* margin: 4px; */
    cursor: pointer;
}

#showInputTable{
	width: 600px;
	height: 70px;
	background-color: lime;
}

#btnReverse{
	width: 600px;
	height: 70px;
	background-color: orange;
}

.jb-table {
  display: table;
  width: 80%;
}
.jb-table-row {
  display: table-row;
}
.jb-table-cell {
  display: table-cell;
  padding: 0px 20px;
  height: 30px;
}
.jb-middle {
  vertical-align: middle;
}

</style>
</head>
<body style="overflow-x: hidden">

<div class="pagination-container full-width-container">
	<div class="sized-container">
		<div class="pagination"></div>
	</div>
</div>
<div class="viewport full-width-container" style="padding: 5px;">
	<ul class="slide-container">
		<li class="slide" data-tag="Quiz">
			<div class="sized-container" >
				<div class="concept">
					<h1>
						숫자 1,3,5,7,9 를 배열에 담고 싶습니다.
					</h1>
				</div>
				<div class="example">
					<h2>Q.어떤 자료형을 담는 배열인가요?</h2>
					<input type="button" value="double">
					<input type="button" value="String">
					<input type="button" class="yesAnswer" value="int"><br>
					<h2>Q.몇개를 담을 수 있는 배열인가요?</h2>
					<input type="button" value="4개">
					<input type="button" class="yesAnswer" value="5개">
				</div>
			</div>
		</li>
		<li class="slide" data-tag="Quiz">
			<div class="sized-container" >
				<div class="concept">
					<h1>
						Q.다음 중 맞게 생성한 배열은 무엇인가요?
					</h1>
				</div>
				<div class="example">
					<input type="button" value="int 배열이름[ ] = {1,3,5,7,9}"><br>
					<input type="button" value="double 배열이름[ ] = {1,3,5,7,9};"><br>
					<input type="button" class="yesAnswer" value="int 배열이름[ ] = {1,3,5,7,9};"><br>
					<input type="button" value="int 배열이름 = {1,3,5,7,9};">
				</div>
			</div>
		</li>
		<li class="slide" data-tag="Array">
			<div class="sized-container" >
				<div class="concept">
					다음 시간표를 보고 답해주세요.
				</div>
				<div class="example">
					<div class="jb-table">
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p></p>
				        </div>
				        <div class="jb-table-cell">
				          <p>1교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>2교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>3교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>4교시</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>월</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>영어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>사회</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>과학</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>화</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>수학</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>체육</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>음악</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국어</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>수</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>영어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>과학</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국사</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>수학</p>
				        </div>
				      </div>
				    </div>
				</div>
				<div>
					Q. 화요일의 4교시는 어떤 과목인가요?
					<input type="button" class="noAnswer" value="수학">
					<input type="button" class="yesAnswer" value="국어">
					<input type="button" class="noAnswer" value="음악">
				</div>
			</div>
		</li>
		<li class="slide" data-tag="Array">
			<div class="sized-container" >
				<div class="concept">
					다음 시간표를 보고 답해주세요.
				</div>
				<div class="example">
					<div class="jb-table">
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p></p>
				        </div>
				        <div class="jb-table-cell">
				          <p>1교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>2교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>3교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>4교시</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>월</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>영어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>사회</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>과학</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>화</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>수학</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>체육</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>음악</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국어</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>수</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>영어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>과학</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국사</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>수학</p>
				        </div>
				      </div>
				    </div>
				</div>
				<div>
					Q. 둘째 줄의 4번째 칸은 어떤 과목인가요?
					<input type="button" class="yesAnswer" value="국어">
					<input type="button" class="noAnswer" value="수학">
					<input type="button" class="noAnswer" value="영어">
				</div>
			</div>
		</li>
		<li class="slide" data-tag="Array">
			<div class="sized-container" >
				<div class="concept">
					다음 시간표를 보고 답해주세요.
				</div>
				<div class="example">
					<div class="jb-table">
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p></p>
				        </div>
				        <div class="jb-table-cell">
				          <p>1교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>2교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>3교시</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>4교시</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>월</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>영어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>사회</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>과학</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>화</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>수학</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>체육</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>음악</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국어</p>
				        </div>
				      </div>
				      <div class="jb-table-row">
				      	<div class="jb-table-cell">
				          <p>수</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>영어</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>과학</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>국사</p>
				        </div>
				        <div class="jb-table-cell">
				          <p>수학</p>
				        </div>
				      </div>
				    </div>
				</div>
				<div>
					Q. 이 배열의 [0][2]어떤 과목인가요?
					<input type="button" class="noAnswer" value="국사">
					<input type="button" class="noAnswer" value="음악">
					<input type="button" class="yesAnswer" value="사회">
				</div>
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
		<button class="next" id="btnShowJava">Java로 보기</button>
		<div id="answerResultDiv"></div>
	</div>
</div>
</body>
</html>