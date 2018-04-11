<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title>contents</title>
   
   <link rel="stylesheet" type="text/css" href="../resources/css/styleContentsMain.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/styleDropdown.css">
   <link href="http://fonts.googleapis.com/css?family=Quicksand:500" 
           rel="stylesheet">
   <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
   <script type="text/javascript">
   $(function(){
	      $('img').each(function(){
	         $(this).addClass('notClear');
	         var thisLevel = $(this).attr('id');
	         //클리어 했으면
	         if(thisLevel < ${clearLevel}){ 
	            $(this).removeClass('notClear');
	            $(this).addClass('clear');
	            $(this).attr('disabled', true);
	            $(this).on('click',function(){
	               var level = $(this).attr('id');
	               location.href = 'contents' + level;
	               //alert(level);
	            }) 
	         }
	      })
	   });

	   
	   /* 내비 바 관련 스크립트 */
	   $(window).on('scroll', function() {
	         if($(window).scrollTop()) {
	            $('nav').addClass('black');
	         }
	         else{   
	            $('nav').removeClass('black');
	         }
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
	      
	      function loginForm() { location.href = "../person/loginForm"; } 
	      function logout() { location.href = "../person/logout"; } 
	      function goHome() { location.href = "/easycodingu/home"; } 
	      
	      
	      
	      /* 원형 프로그래스 바 스크립트 */
	function progressCircle(boxTarget){
	  var value = $(''+boxTarget+'').attr('percent'),
	      progressBar = $(''+boxTarget+' .progress-bar'),
	      countText = $(''+boxTarget+''),
	      delayAnimateProgress = 500;

	  var radius = progressBar.attr('r'),
	      progressBarDefault = 2 * Math.PI * radius;
	  
	  var durationCount,
	      progress,
	      dashoffset;
	  
	  var count,
	      maxCount;
	      
	  
	  if(value < 0) value = 0;
	  if(value > 100) value = 100;
	  
	  durationCount = 450 / value;
	  progress = value / 100;
	  dashoffset = progressBarDefault * (1 - progress);
	  
	  count = 0;
	  maxCount = value;
	  
	  // Set Defualt
	  progressBar.css({'stroke-dasharray':progressBarDefault, 'stroke-dashoffset':progressBarDefault});
	  
	  setTimeout(function(){
	    progressBar.css({'stroke-dashoffset':dashoffset});
	    
	    var animateCount = setInterval(function(){
	      if(count < maxCount){
	        count++;
	        countText.attr('data-count', count);
	      } else{
	        clearInterval(animateCount);
	      }
	    }, durationCount);
	  }, delayAnimateProgress);
	}

	progressCircle('.progress-1');
	progressCircle('.progress-2');
      
	
      function gohome() { location.href = "../../easycodingu/home"; }
      function loginForm() { location.href = "../person/loginForm"; }  
      function logout() { location.href = "../person/logout"; } 
   </script>

</head>  

<body>
     
      <!-- 로그아웃 상황 -->
      <c:if test="${sessionScope.loginId == null }">
      <body style="overflow-y:hidden">
      
	      <nav>
	      	<div class="logo"> Contents </div>   
	        
	        <ul>
	           	<li class="anitamedButton"> 
					<div class="buttonWrapper">
						<div class="buttonContent">
							<span class="button">
							 <p onclick="loginForm();"> Login </p>
						 	</span>
						</div>
					</div>
	          	 </li>
	            
	            <li class="anitamedButton"> 
					<div class="buttonWrapper">
						<div class="buttonContent">
							<span class="button">
							 <p onclick="gohome();"> Home </p>
						 	</span>
						</div>
					</div>
	           	</li>
	            
	        </ul>
	      </nav> <!-- 상단 내비게이션바 끝 -->  
            
      
     	  <!-- 좌측 컨텐츠들을 감싸고 있는 영역 -->       
     	  <div class="box1Logout"> 
     	  	<h1> 문제를 풀고 싶으면 로그인을 하여라. </h1> 
     	  </div>

      </c:if> <!-- 로그아웃 상황 끝 -->
      
      
      
      <!-- 로그인 상황 -->
      <c:if test="${sessionScope.loginId != null }">
      
      	<nav>
	    	<div class="logo"> Contents </div>   
      
            <ul>
	        	<li> 
               <div class="userInfo">
               <p> 
               <a>Hello</a> ${sessionScope.loginName }
                   <span>
                    (${sessionScope.loginId })
                    </span>  
              </p> 
              </div>
           </li>
            
	           <li class="anitamedButton"> 
		   	   		<div class="buttonWrapper">
						<div class="buttonContent">
							<span class="button">
						 		<p> My Page </p>
					 		</span>
						</div>
					</div>
	           </li>
            
	           <li class="anitamedButton"> 
					<div class="buttonWrapper">
						<div class="buttonContent">
							<span class="button">
							 	<p onclick="logout();"> Logout </p>
						 	</span>
						</div>
					</div>
	           </li>
               
         
		       <li class="anitamedButton"> 
					<div class="buttonWrapper">
						<div class="buttonContent">
							<span class="button">
								<p> Board </p>
							</span>
						</div>
					</div>
		       </li>
           	
	           <li class="anitamedButton"> 
					<div class="buttonWrapper">
						<div class="buttonContent">
							<span class="button">
							 	<p> Language </p>
						 	</span>
						</div>
					</div>
	           	</li>
           	
           	
	           	<li class="anitamedButton"> 
					<div class="buttonWrapper">
						<div class="buttonContent">
							<span class="button">
							 	<p onclick="gohome();"> Home </p>
						 	</span>
						</div>
					</div>
	           	</li>
         
         	</ul>
      	</nav> <!-- 상단 내비게이션바 끝 -->  
         
         
         <!-- 반으로 나눴을  때 왼쪽을 감싸는 영역 -->
         <div class="box1"> 
         
         	<div class="leftContentsList">
         	
         	<div id="trophy" class="trophyWapper">
            
            
           <div class="trophyNQ">
            
	            <div class="trophyNqText">
	            <img alt="icon1" src="../resources/img/icon1.png" id="11">  
	            <p> Level 11 </p>
	            </div>
	            
	            <div class="trophyNqText">
	            <img alt="icon2" src="../resources/img/icon2.png" id="12"> 
	           	<p> Level 12 </p>
	            </div>
            
            </div>
            
            <div class="trophyNQ">
	            
	            <div class="trophyNqText">
	            <img alt="icon3" src="../resources/img/icon3.png" id="21">   
	            <p> Level 21 </p>
	            </div>
	            
	            <div class="trophyNqText">
	            <img alt="icon4" src="../resources/img/icon4.png" id="22">
	           	<p> Level 22 </p>
	            </div>
	            
            </div>
            
            <div class="trophyNQ">
            
            	<div class="trophyNqText">
	            <img alt="icon5" src="../resources/img/icon5.png" id="31">   
	            <p> Level 31 </p>
	            </div>
	            
	            <div class="trophyNqText">
	            <img alt="icon6" src="../resources/img/icon6.png" id="32">
	           	<p> Level 32 </p>
	            </div>

            </div>
           
            <div class="trophyYQ"> 
            
            	<div class="trophyYqText">
	            <img alt="icon12" src="../resources/img/icon12.png" id="71" class="trophy3">  
	            <p> Trophy Quiz 1 </p>
	            </div>
            
            </div>
           
			<div class="trophyNQ">            
            
            	<div class="trophyNqText">
	            <img alt="icon7" src="../resources/img/icon7.png" id="41">   
	            <p> Level 41 </p>
	            </div>
	            
	            <div class="trophyNqText">
	            <img alt="icon8" src="../resources/img/icon8.png" id="42">
	           	<p> Level 42 </p>
	            </div>
            
            </div>
           
            <div class="trophyNQ">
            
            	<div class="trophyNqText">
	            <img alt="icon9" src="../resources/img/icon9.png" id="51">   
	            <p> Level 51 </p>
	            </div>
	            
	            <div class="trophyNqText">
	            <img alt="icon10" src="../resources/img/icon10.png" id="52"> 
	           	<p> Level 52 </p>
	            </div>
            
            </div>
           
            <div class="trophyYQ">
            
            	<div class="trophyYqText">
	            <img alt="icon12" src="../resources/img/icon12.png" id="72" class="trophy3">   
	            <p> Trophy Quiz 2 </p>
	            </div>
            
            </div>
          
			<div class="trophyNQ">            
            
            	<div class="trophyNqText">
	            <img alt="icon11" src="../resources/img/icon11.png" id="61">   
	            <p> Level 61 </p>
	            </div>
	            
	            <div class="trophyNqText">
	            <img alt="icon1" src="../resources/img/icon1.png" id="62"> 
	           	<p> Level 62 </p>
	            </div>
             
            </div>
           
            <div class="trophyYQ">
            
            	<div class="trophyYqText">
	            <img alt="icon12" src="../resources/img/icon12.png" id="73" class="trophy3">    
	            <p> Trophy Quiz 3 </p>
	            </div>
            
            </div>
            
            
         </div>
       </div>
     </div> <!--  box1 끝 -->
         
     
         
     <!-- 반으로 나눴을  때 오른쪽을 감싸는 영역 -->    
     <div class="box2">
      
     	<!-- 레벨 표시되는 영역 -->
     	<div class="rightYourLevel">
      		
      		<p> 
      			<a> ${sessionScope.loginName } </a> 
      			<span>님의 레벨은</span>   
      		</p> 
      	
      		<!-- 레벨 바가 표시되는 영역 -->	
      		<div class="rightLevelBar">
      		
	      		<div class="perspective">
				 
				  <!-- 실제로 바를 숫자값에 맞게 이동시키려면 aria-valuenow 값을 조정하면 된다 -->
				  <div class="bar cyan" role="progressbar" aria-valuenow="32" 
				  	   aria-valuemin="0" aria-valuemax="100">
				    <div class="bar-face roof percentage"></div>
				    <div class="bar-face back percentage"></div>
				    <div class="bar-face floor percentage"></div>
				    <div class="bar-face left"></div>
				    <div class="bar-face right"></div>
				    <div class="bar-face front percentage"> 
				    
				    <!-- 여기에 숫자를 입력하면 바 앞에 표시가 된다 -->
				    <div class="LevelPercentage">32</div> 
				    
				    </div>
				  </div>
				</div>
			</div> 	
      	</div> <!-- 레벨 표시되는 영역 -->
      	
      	
      	<!-- 진도율을 보여주는 영역 -->
      	<div class="rightYourLProgress">
      		<p> 
      			<a> ${sessionScope.loginName } </a> 
      			<span>님의 진도율은</span>   
      		</p> 
      	
      	
      	
      	
      	</div> <!-- 진도율을 보여주는 영역 끝 -->
      
      
      </div> <!-- box2 끝 -->
         
         
     
     
     </c:if>
 

</body>
</html>