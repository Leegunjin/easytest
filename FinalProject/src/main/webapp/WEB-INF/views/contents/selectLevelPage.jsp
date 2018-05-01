<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>

	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
	    <title>Test Contents </title>
	   
	    <link rel="stylesheet" type="text/css" href="../resources/css/styleContentsMain.css">
	    <link href="http://fonts.googleapis.com/css?family=Quicksand:500" 
	           rel="stylesheet">
	    <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
   
	    <script type="text/javascript">
	    
		$(function(){
			//alert(${initPage});
			if(${initPage} == 1){
				var offset = $('#st-panel-'+${initPage}).offset();
		        $('html, body').animate({scrollTop : offset.top}, 400);
			}else{
				var offset = $('#st-panel-'+${initPage-1}).offset();
		        $('html, body').animate({scrollTop : offset.top}, 400);
			}
	        $('#st-control-'+${initPage}).attr('checked',true);
	        
			//alert("어디까지 깼나"+${bestLevel});
			$('.card').each(function(){
				
				//$(this).attr('disabled',true);
				//var test = document.getElementById("st-panel-4");
				
				//$(this).addClass('notClear');
		
				var thisLevel = $(this).attr('id');
				/*if(thisLevel <= ){
					
				} */
				
				/* $(this).on('focus',function(){ 
					$("#st-control-2").css('display','none');
					
				}); */
				
				//클리어한 레벨과 그 다음 레벨까지 클릭할 수 있게
				//if(thisLevel <= ${bestLevel+1}){
					$(this).on('click',function(){
						//alert(thisLevel);		           
						var level = $(this).attr('id');
						location.href = 'contents' + level;
			           //alert(level);
		        	});
				//}
				
				/* if(thisLevel == ${bestLevel+1}){
					$(this).addClass('blink');
				}
				
				if(thisLevel > ${bestLevel+1}){
					$(this).css({ opacity: 0.5 });
				}
				
				if(${bestLevel} >= 6 && ${bestLevel} <= 12){
					$('#13').on('click',function(){
						location.href = 'contents' + 13;
					});
					$('#13').css({ opacity: 1.0 });
				}
				
				if(${bestLevel} >= 10 && ${bestLevel} <= 12 ){
					$('#14').on('click',function(){
						location.href = 'contents' + 14;
					});
					$('#14').css({ opacity: 1.0 });
				}
				
				if(${bestLevel} == 12){
					$('#15').on('click',function(){
						location.href = 'contents' + 15;
					});
					$('#15').css({ opacity: 1.0 });
				} */
					
		     	//}
			})
 		});	

           
		function googleLogout(loginId) {
		   var result = loginId.includes('@gmail.com');
		   if(result) {
		      window.open('https://accounts.google.com/logout', 'popup', 
		               'z-lock=yes, width=600, height=400');
		   }
		} 
            
		$(document).ready(function(){
		   $('#dropDown').click(function(){
		      $('.drop-down').toggleClass('drop-down--active');
		   });
		});
      

		function goHome() { location.href = "../../easycodingu/home"; }
		function myPage() { location.href = "../person/mypageUser"; } 
   
  
		// FireFox CodePen.io Fix
		$('MypageButton').click(function(e){
		  e.preventDefault();
		});
	    
	    
       </script>
       
       
       <!-- 원형 프로그래스바 자바스크립트 -->
       <script type="text/javascript">

       window.onload = function(){
    	   var all = document.getElementsByClassName('progress');
    	   for(var i=0;i<all.length;i++){
    	   	p = all[i].attributes.percent.value;
    	     tc = all[i].attributes.textColor.value;
    	     pb = all[i].attributes.progressColor.value;
    	     ic = all[i].attributes.innerColor.value;
    	     cid = all[i].attributes.cid.value;
    	     bar = all[i].attributes.bar.value;
    	     
    	     //tracker.init.prototype = {};
    	      var t = new tracker(250, 250, 15, tc, cid, ic, bar, p);
    	   }
    	 }

    	 function tracker(width, height, lineWidth, text, cid, inner, bar, p) {
    	     this.trackers = document.getElementsByClassName('progress-'+cid);
    	     this.pt = this.trackers[0].children[0];
    	    
    	     this.progress = 0;
    	 	  this.counter = 1;
    	     this.cid = cid;
    	     this.inner = inner;
    	     this.percent = p;
    	     this.bar = bar;
    	     this.lineWidth = lineWidth;
    	     this.text = text;
    	     this.canvas = this.pt.children[1];
    	     this.span = this.pt.children[0];
    	     this.span.textContent = '0%';
    	     this.span.style.color = text;    
    	     this.ctx = this.canvas.getContext('2d');
    	     this.canvas.width = width;
    	     this.canvas.height = height;
    	     this.ctx.lineWidth = lineWidth;
    	     this.ctx.lineCap = 'flat';
    	     this.ctx.translate(width / 2, height / 2);
    	     this.ctx.rotate(-90*Math.PI/180);
    	     this.radius = (width - lineWidth) / 2;
    	     this.drawCircle = function  drawCircle(color, percent) {    
    	         percent = percent/100;
    	         this.ctx.beginPath();
    	         this.ctx.arc(0, 0, this.radius, 0, Math.PI * 2 * percent, false);
    	         this.ctx.strokeStyle = color;
    	         this.ctx.stroke();
    	       }
    	     this.drawCircle(inner, 100);
    	     this.span.textContent = p+'%';
    	     this.animateBar =   function animateBar(){
    	   	if(this.progress/7>99){
    	     	this.counter = -7;
    	   	} else if (this.progress < 1){
    	     	this.counter = 7;
    	   	}
    	   	if (this.progress/7 >= this.percent){cancelAnimationFrame(this.animate);return false;}
    	   	this.progress+=this.counter;
    	     this.span.textContent = (this.progress/7 >>0) + "%";
    	   	this.drawCircle(this.bar, this.progress/7);
    	  	  this.animate = requestAnimationFrame(this.animateBar.bind(this));  
    	   }
    	     this.animateBar();
    	 }
       
       </script>
       
       
       <script>
		    $(function() {
		        setInterval(function() {
		            $("#dt_now").text(new Date());
		        }, 1000);
		    });
		</script>
		
		<script type="text/javascript">
		
		<!-- 상단 내비게이션바에 출력하는 실시간 시계 -->
    	
    		setInterval("dpTime()",1000);
    	    
    			function dpTime(){
    	        
    				var now = new Date();
    	        
    				hours = now.getHours();
    				minutes = now.getMinutes();
    				seconds = now.getSeconds();
    	 
    	        /* 여기 주석을 풀면 12시간제로 표기 
    				if (hours > 12){
    					hours -= 12;
    					ampm = "오후 ";
    				} 
    				else {
    					ampm = "오전 ";
    	       		}
    				
    				if (hours < 10) {
    	            hours = "0" + hours;
    	        	} */
    	        
    				if (minutes < 10) {
    	            minutes = "0" + minutes;
    	        	}
    				
    	        	if (seconds < 10){
    	            seconds = "0" + seconds;
    	        	}
    	
    	        	document.getElementById("timeNav").innerHTML = hours + ":" + minutes + ":" + seconds;
    			}
		</script>

	</head>  
	
	<body style="overflow-x:hidden; overflow-y:hidden">
	
	<!-- 하단 왼쪽 문제 선택 -->
	<div class="bottomLeft">
	
		<div class="container">
				
			<div class="st-container">
				
				<input type="radio" name="radio-set" checked="checked" id="st-control-1"/>
				<a href="#st-panel-1">Chapter 1</a>
				<input type="radio" name="radio-set" id="st-control-2"/>
				<a href="#st-panel-2">Chapter 2</a>
				<input type="radio" name="radio-set" id="st-control-3"/>
				<a href="#st-panel-3">Chapter 3</a>
				<input type="radio" name="radio-set" id="st-control-4"/>
				<a href="#st-panel-4">Chapter 4</a>
				<input type="radio" name="radio-set" id="st-control-5"/>
				<a href="#st-panel-5">Chapter 5</a>
				<input type="radio" name="radio-set" id="st-control-6"/>
				<a href="#st-panel-5">Chapter 6</a>
				
					
					<div class="st-scroll">
					
						<!-- Placeholder text from http://hipsteripsum.me/ -->
						
						<section class="st-panel" id="st-panel-1">
	            		<div class="st-deco" data-icon="&#xf069;"></div>
							<h2> Chapter 1 </h2>
							<p> 자료형 </p>
							
							<div class="BtnContainer1">
					
								<div class="wrapper11"  aria-hidden="true">
						    		<div class="card" id="1"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  	
						  		<div class="wrapper12" aria-hidden="true">
						    		<div class="card" id="2">  
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
							</div> <!-- container 끝 -->
							
							
						</section>
						
						<section class="st-panel st-color" id="st-panel-2">
							<div class="st-deco" data-icon="&#xf118;"></div>
							<h2> Chapter 2 </h2>
							<p> 변수 </p>
							
							<div class="BtnContainer2">
					
								<div class="wrapper21" aria-hidden="true">
						    		<div class="card" id="3"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  	
						  		<div class="wrapper22" aria-hidden="true">
						    		<div class="card" id="4"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
							</div> <!-- container 끝 -->
							
						</section>
						
						<section class="st-panel" id="st-panel-3">
							<div class="st-deco" data-icon="&#xf0f4;"></div>
							<h2> Chapter 3 </h2>
							<p> 연산자, 트로피 퀴즈 1 </p>
							
							<div class="BtnContainer3">
					
								<div class="wrapper31" aria-hidden="true">
						    		<div class="card" id="5"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  	
						  		<div class="wrapper32" aria-hidden="true">
						    		<div class="card" id="6"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  		<div class="wrapperTro1" aria-hidden="true">
						    		<div class="card" id="13"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
							</div> <!-- container 끝 -->
							
						</section>
						
						<section class="st-panel st-color" id="st-panel-4" value="4">
							<div class="st-deco" data-icon="&#xf06c;"></div>
							<h2> Chapter 4 </h2>
							<p> 조건문 </p>
							
							<div class="BtnContainer4">
					
						  		<div class="wrapper41" aria-hidden="true">
						    		<div class="card" id="7"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  		<div class="wrapper42" aria-hidden="true">
						    		<div class="card" id="8"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  		
						  		
						  	</div> <!-- container 끝 -->
						  		
						</section>
						
						<section class="st-panel" id="st-panel-5">
							<div class="st-deco" data-icon="&#xf004;"></div>
							<h2> Chapter 5 </h2>
							<p> 반복문, 트로피 퀴즈 2 </p>
							
							<div class="BtnContainer5" aria-hidden="true">
																
								<div class="wrapper51">
						    		<div class="card" id="9"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  	
						  		<div class="wrapper52" aria-hidden="true">
						    		<div class="card" id="10"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  		<div class="wrapperTro2" aria-hidden="true">
						    		<div class="card" id="14"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  		
							</div> <!-- container 끝 -->
							
						</section>
						
						<section class="st-panel st-color" id="st-panel-6">
							<div class="st-deco" data-icon="&#xf004;"></div>
							<h2> Final Chapter </h2>
							<p> 배열, 트로피 퀴즈 3 </p>
							
							<div class="BtnContainer6">
					
						  		<div class="wrapper61" aria-hidden="true">
						    		<div class="card" id="11"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  		<div class="wrapper62" aria-hidden="true">
						    		<div class="card" id="12"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  		<div class="wrapperTro3" aria-hidden="true">
						    		<div class="card" id="15"> 
						    			<i class="fal fa-arrow-right"></i> 
						    		</div>
						  		</div>
						  		
						  	</div> <!-- container 끝 -->
						  	
						</section>
						  
	
					</div><!-- // st-scroll -->
					
			</div><!-- // st-container -->
			
		</div>
	
	
	</div> <!-- 하단 왼쪽 문제 선택 끝 -->
	
	
	<!-- 하단 오른쪽 레벨 / 진도율 표시 -->
	<div class="bottomRight">
		
		
		<div class="container">
		<section class="up"></section>
		
		
			<div class="left">
		    <section class="cam"></section>
		
		
		    	<div class="top">
		      		<ul>
		        		<li> 
							
							<!-- 시간을 띄워 줄 div -->        
				        	<div id='timeNav'> </div>
		        		
		        		</li>
				        
				        <li>
				        	<span> <i class="fas fa-signal"></i></span>
				            <span> <i class="fas fa-wifi"></i></span>
				            <span> <i class="fas fa-battery-three-quarters"></i> </span>
				        </li>
		      		</ul>
		    	</div>
		
		
		    	<div class="profile-info">
		      	<section class="dots"><i class="fas fa-ellipsis-v"></i></section>
		      		<ul>
				        <li> <!-- <img src="https://goo.gl/BAE7JV" /> --> </li>
				        
				        <li>
				        	<h2> ${sessionScope.loginName } </h2>
				        </li>
				        
				        <li> </li>
				        
				        <li> </li>
				        
				        <li> level &ensp;| <span> &ensp; ${person.grade } </span> </li>
				        <li>
				        	<a href="#"><i class="fab fa-facebook-f"></i></a>
				            <a href="#"><i class="fab fa-twitter"></i></a>
				          	<a href="#"><i class="fas fa-globe"></i></a>
				        </li>
		      		</ul>
		    	</div> <!-- profile-info 끝 -->
		    
		    
		    	<div class="profile-info2">
		      	<section class="dots"><i class="fas fa-ellipsis-v"></i></section>
		      		<ul>
				        <li> <!-- <img src="https://goo.gl/BAE7JV" /> --> </li>
				        <li>
			          		<h2> Progress </h2>
		        		</li>
		        
				        <!-- 원형 프로그래스바 -->
				    	<div class="row">
  							<%-- <c:set var="temp" value="<fmt:parseNumber value='${bestLevel / 12 * 100}' integerOnly='true'/>"></c:set> --%>
		  					<div class="progress" cid="1" percent="<fmt:parseNumber value='${bestLevel / 12 * 100}' integerOnly='true'/>" 
		  					textcolor="#000000" progresscolor="red" innercolor="gray" bar="#18aaaa">
					    		<div class="progress-1">
							    	<div class="progress-circle">
								        <span></span>
								        <canvas class="progress-canvas"></canvas>
							        </div>
					    		</div>
  							</div>
						</div> <!-- 원형 프로그래스바 끝 -->
		        
		      		</ul>
		    	</div> <!-- profile-info2 끝 -->
		
		
		    	<div class="numbers">
			    	<ul>
				        <!-- <li> </li> -->
				        <li onclick="goHome();"><span>Go Main</span>메인화면으로 가기</li> 
				        <!-- <li> </li> -->
			      	</ul>
		    	</div>
		
		  	</div> <!-- left 끝 -->
		</div> <!-- 컨테이너 끝 -->
	</div> <!-- 하단 오른쪽 레벨 / 진도율 표시 끝 -->
	
	</body>
	
</html>