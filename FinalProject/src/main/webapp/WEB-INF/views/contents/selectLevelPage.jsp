<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title>contents</title>
   
   <link rel="stylesheet" type="text/css" href="../resources/css/styleContentsMain.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/styleNav.css">
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
      function myPage() { location.href = "../person/mypageUser"; } 
      
      
   // FireFox CodePen.io Fix
      $('MypageButton').click(function(e){
        e.preventDefault();
      });
      </script>

</head>  

<body>
     
      <!-- 로그아웃 상황 -->
      <c:if test="${sessionScope.loginId == null }">
      <body style="overflow-y:hidden">
      
	      <nav>
	      	
	        <c:if test="${sessionScope.loginId == null }">       
        
        <div class="slogan">
		Contents
		  <ul class="list">
		    <li> WelCome To Web Page </li>
		    <li> ${sessionScope.loginName} </li>
		    <li> ${sessionScope.loginId} </li>
		    <li> ${sessionScope.loginName} </li>
		    <li> Thank You </li>
		  </ul>
		</div>
       <ul>
         
            <li class="anitamedButton"> 
				<div class="buttonWrapper">
					<div class="buttonContent">
						 <button class="btn-animate" onclick="loginForm();">Login</button>
					</div>
				</div>
            </li>
            
            <li class="anitamedButton"> 
				<div class="buttonWrapper">
					<div class="buttonContent">
						 <button class="btn-animate" onclick="gohome();">Home</button>
					</div>
				</div>
            </li>
            
         </c:if>
	        
	      </nav> <!-- 상단 내비게이션바 끝 -->  
            
      
     	  <!-- 좌측 컨텐츠들을 감싸고 있는 영역 -->       
     	  <div class="box1Logout"> 
     	  	<h1> 로그인 후에 컨텐츠 이용 가능 </h1> 
     	  	
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
						 		<p onclick="myPage();"> My Page </p>
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
         	
         	<span style="background-image: url('../resources/img/1111.png');">
         	
         	<ul>
				
				<div class="trophyNqText11">
					<li>
						<i> 
							<img alt="icon1" src="../resources/img/icon1.png" 
								 class="icon1" id="11" aria-hidden="true">   
						</i> 
					 	<p> Level 11 </p>
					</li>  
				</div>
				
				<div class="trophyNqText12">
					<li>
						<i> 
							<img alt="icon2" src="../resources/img/icon2.png" 
								 class="icon2" id="12" aria-hidden="true">   
						</i> 
						<p> Level 12 </p>
					</li> 
				</div> 
				
				<div class="trophyNqText21">
					<li>
						<i> 
							<img alt="icon3" src="../resources/img/icon3.png" 
							     class="icon3" id="21" aria-hidden="true">   
						</i> 
						<p> Level 21 </p>
					</li>  
				</div>
				
	            <div class="trophyNqText22">
		        	<li>
						<i> 
							<img alt="icon4" src="../resources/img/icon4.png" 
							     class="icon4" id="22" aria-hidden="true">   
						</i> 
						<p> Level 22 </p>
					</li>  
				</div>
		
				<div class="trophyNqText31">
					<li>
						<i> 
							<img alt="icon5" src="../resources/img/icon5.png" 
								 class="icon5" id="31" aria-hidden="true">   
						</i> 
						<p> Level 31 </p>
					</li> 
				</div>
				
				<div class="trophyNqText32">
					<li>
						<i> 
							<img alt="icon6" src="../resources/img/icon6.png" 
								 class="icon6" id="32" aria-hidden="true">   
						</i> 
						<p> Level 32 </p>
					</li>  
         		</div>
         		
         		<div class="trophyYqText71">
					<li>
						<i> 
							 <img alt="icon12" src="../resources/img/icon12.png" 
							 class="trophy3" id="71" aria-hidden="true">  
						</i> 
						<p> Trophy Quiz 1 </p>
					</li>
				</div>
				
				<div class="trophyNqText41">
					<li>
						<i> 
							<img alt="icon7" src="../resources/img/icon7.png" 
								 class="icon7" id="41" aria-hidden="true">   
						</i> 
						<p> Level 41 </p>
					</li>  
         		</div>	
         		
         		<div class="trophyNqText42">
					<li>
						<i> 
							<img alt="icon8" src="../resources/img/icon8.png" 
								 class="icon8" id="42" aria-hidden="true">   
						</i> 
						<p> Level 42 </p>
					</li>  
         		</div>
         		
         		<div class="trophyNqText51">
					<li>
						<i> 
							<img alt="icon9" src="../resources/img/icon9.png" 
								 class="icon9" id="51" aria-hidden="true">   
						</i> 
						<p> Level 51 </p>
					</li>  
         		</div>
         		
         		<div class="trophyNqText52">
					<li>
						<i> 
							<img alt="icon10" src="../resources/img/icon10.png" 
								 class="icon10" id="52" aria-hidden="true">   
						</i> 
						<p> Level 52 </p>
					</li>  
         		</div>
         		
         		<div class="trophyYqText72">
					<li>
						<i> 
							 <img alt="icon12" src="../resources/img/icon12.png" 
							 class="trophy3" id="72" aria-hidden="true">  
						</i> 
						<p> Trophy Quiz 2 </p>
					</li>
				</div>	
				
				<div class="trophyNqText61">
					<li>
						<i> 
							<img alt="icon11" src="../resources/img/icon11.png" 
								 class="icon11" id="61" aria-hidden="true">   
						</i> 
						<p> Level 61 </p>
					</li>  
         		</div>	
         		
         		<div class="trophyNqText62">
					<li>
						<i> 
							<img alt="icon1" src="../resources/img/icon1.png" 
								 class="icon1" id="62" aria-hidden="true">   
						</i> 
						<p> Level 62 </p>
					</li>  
         		</div>		
         		
         		<div class="trophyYqText73">
					<li>
						<i> 
							 <img alt="icon12" src="../resources/img/icon12.png" 
							 class="trophy3" id="73" aria-hidden="true">  
						</i> 
						<p> Trophy Quiz 3 </p>
					</li>
				</div>	

         	
         	</ul>
         	
       </div> <!-- leftContentsList 끝 -->
     </div> <!--  box1 끝 -->
         
     
         
     <!-- 반으로 나눴을  때 오른쪽을 감싸는 영역 -->    
     <div class="box2">
      
     	<!-- 레벨 표시되는 영역 -->
     	<div class="rightYourLevel">
      		
      		<p> 
      			<a> Level </a> 
      			<span> ${sessionScope.testUserLevel} </span>   
      		</p> 
      	
      	</div>
      	
      	
      	<!-- 진도율을 보여주는 영역 -->
      	<div class="rightYourLProgress">
      		<p> 
      			<a>  </a> 
      			<span>Progress</span>   
      		</p> 
      		
      		<div class="perspective">
				 
				  <!-- 실제로 바를 숫자값에 맞게 이동시키려면 aria-valuenow 값을 조정하면 된다 -->
				  <div class="bar cyan" role="progressbar" aria-valuenow="${sessionScope.testUserLevel *10 }" 
				  	   aria-valuemin="0" aria-valuemax="100">
				    <div class="bar-face roof percentage"></div>
				    <div class="bar-face back percentage"></div>
				    <div class="bar-face floor percentage"></div>
				    <div class="bar-face left"></div>
				    <div class="bar-face right"></div>
				    <div class="bar-face front percentage"> 
				    
				    <!-- 여기에 숫자를 입력하면 바 앞에 표시가 된다 -->
				    <div class="LevelPercentage">${sessionScope.testUserLevel * 10}%</div> 
				    
				    </div>
				  </div>
				</div>
      	
      	
      	
      	
      	</div> <!-- 진도율을 보여주는 영역 끝 -->
      	
      	
      	<!-- 마이페이지로 보내주는 영역 -->
      	<div class="rightGoMypage">
      	
      	<a href="#" class="MypageButton" onclick="myPage();"> <span> My Page</span> </a>
      	
      	</div> <!-- 마이페이지로 보내주는 영역 끝 -->
      
      
      </div> <!-- box2 끝 -->
         
         
     
     
     </c:if>
 

</body>
</html>