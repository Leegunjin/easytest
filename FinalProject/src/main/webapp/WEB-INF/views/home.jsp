<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title>JavaLingo Main</title>
   <link rel="stylesheet" type="text/css" href="resources/css/styleMain.css">
   <link rel="stylesheet" type="text/css" href="resources/css/styleDropdown.css">
   <link href="http://fonts.googleapis.com/css?family=Quicksand:500" rel="stylesheet">
   <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
   <script type="text/javascript">
      $(window).on('scroll', function() {
         if($(window).scrollTop()) {
            $('nav').addClass('black');
         }
         else{   
            $('nav').removeClass('black');
         }
         
      })
      
		function googleLogout(loginId) {
			var result = loginId.includes('@gmail.com');
			if(result) {
				window.open('https://accounts.google.com/logout', 'popup', 'z-lock=yes, width=600, height=400');
			}
		} 
      $(document).ready(function(){
    	  $('#dropDown').click(function(){
    	    $('.drop-down').toggleClass('drop-down--active');
    	  });
    	});
     
      
   /* 화면 관련 제이쿼리 */
   function anim(targetedDiv) {
	   var targetedLetter = $("#" + targetedDiv + " .rotate").text();
	   var asciiValue = targetedLetter.charCodeAt(0);
	   var pointer = 65; /* 아스키 코드 A 번호 */
	   changeChar();
	   
	   
	   function changeChar() {
		   if(pointer <= asciiValue) {
			   $("#" + targetedDiv + " .rotate").text(String.fromCharCode(pointer));
			   pointer++;
			   setTimeout(changeChar,20);
			   
		   }
		   else {
			   $(this).stop;
		   }
	   }
	   
   }
   
   
   $(document).ready(function() {
	   
	   $(".openMenu").click(function() {
		 $(".mainSection").fadeIn(200);
		 $(".openMenu").animate({left:"-10%"});
		 $(".closeMenu").animate({left:"94%"});
		 $(".menu").animate({left:"-1%"},10);
	  }); 
	   
	   
	   $(".closeMenu").click(function() {
		 $(".mainSection").fadeOut(200);
		 $(".openMenu").animate({left:"0%"});
		 $(".closeMenu").animate({left:"100%"});
		 $(".menu").animate({left:"-50%"},10);
	  }); 
   });
      
    
   
   function study1_click() {
	   location.href = "contents/contents21";
   }
   
   function study2_click() {
	   location.href = "contents/contents71";
   }
   
   function study3_click() {
	   location.href = "contents/contents320";
   }
   
   </script>


</head>  

<body>

   <!-- <div class="wrapper"> -->
      
      <c:if test="${sessionScope.loginId == null }">
      <nav>
         
         
         <div class="logo"> EasyCordingU </div>   
         <ul>
            <li> <!-- <a href=""> </a> --> </li>
            <li> <a href="person/loginForm"> Login </a> </li>
            <li> <a href="#"> Board </a> </li>
            <li> <a href="#"> Language </a> </li>
           
           <div class="table_center">
       <div class="drop-down">
         <div id="dropDown" class="drop-down__button">
         	<span class="drop-down__name">Language</span>
			<svg version="1.1" class="drop-down__icon" xmlns="http://www.w3.org/2000/svg" 
			xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="48.625px" 
			height="48.625px" viewBox="0 0 48.625 48.625" 
			style="enable-background:new 0 0 48.625 48.625;" xml:space="preserve">
			</svg>
         </div>
         
         <div class="drop-down__menu-box">
           <ul class="drop-down__menu">
             <li data-name="profile" class="drop-down__item"> <a href="contents/contents21"> 김한솔 </a> 
	             <svg version="1.1" class="drop-down__item-icon" 
	             xmlns="http://www.w3.org/2000/svg" 
	             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" 
	             viewBox="0 0 350 350" style="enable-background:new 0 0 350 350;" 
	             xml:space="preserve">
				</svg>
			</li>
             
             <li data-name="dashboard" class="drop-down__item"> <a href="contents/contents71"> 김소선 </a>  
	             <svg version="1.1" class="drop-down__item-icon" 
	             xmlns="http://www.w3.org/2000/svg" 
	             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" 
	             width="511.626px" height="511.627px" 
	             viewBox="0 0 511.626 511.627" 
	             style="enable-background:new 0 0 511.626 511.627;" 
	             xml:space="preserve">
				</svg>
			</li>
             
             <li data-name="activity" class="drop-down__item"> <a href="contents/contents320"> 김희진 </a> 
	             <svg version="1.1" class="drop-down__item-icon" 
	             xmlns="http://www.w3.org/2000/svg" 
	             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" 
	             width="95.103px" height="95.103px" viewBox="0 0 95.103 95.103" 
	             style="enable-background:new 0 0 95.103 95.103;" xml:space="preserve">
				</svg>
			</li>
           
           </ul>
         </div>
       </div>
</div>

           
           
           
         </ul>
      </nav>   
      </c:if>
      
      <c:if test="${sessionScope.loginId != null }">
      <nav>
         <div class="logo"> EasyCordingU </div>   
         <ul>
            <li> <a style="color: #18aafe; font-weight: bold;"> Hello ${sessionScope.loginName }
            <span style="color: gray; font-weight: normal;">(${sessionScope.loginId })</span>  </a> </li>
            <li> <a href="#"> My Page </a> </li>
            <li> <a href="person/logout" onclick="googleLogout('${loginId}')"> Logout </a> </li>
            <li> <a href="#"> Board </a> </li>
            <li> <a href="#"> Language </a> </li>
            
            
            
            <div class="table_center">
       <div class="drop-down">
         <div id="dropDown" class="drop-down__button">
         	<span class="drop-down__name">Language</span>
			<svg version="1.1" class="drop-down__icon" xmlns="http://www.w3.org/2000/svg" 
			xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="48.625px" 
			height="48.625px" viewBox="0 0 48.625 48.625" 
			style="enable-background:new 0 0 48.625 48.625;" xml:space="preserve">
			</svg>
         </div>
         
         <div class="drop-down__menu-box">
           <ul class="drop-down__menu">
             <li data-name="profile" class="drop-down__item"> <a href="contents/contents99"> 김한솔 </a> 
	             <svg version="1.1" class="drop-down__item-icon" 
	             xmlns="http://www.w3.org/2000/svg" 
	             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" 
	             viewBox="0 0 350 350" style="enable-background:new 0 0 350 350;" 
	             xml:space="preserve">
				</svg>
			</li>
             
             <li data-name="dashboard" class="drop-down__item"> <a href="contents/contents99"> 김소선 </a>  
	             <svg version="1.1" class="drop-down__item-icon" 
	             xmlns="http://www.w3.org/2000/svg" 
	             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" 
	             width="511.626px" height="511.627px" 
	             viewBox="0 0 511.626 511.627" 
	             style="enable-background:new 0 0 511.626 511.627;" 
	             xml:space="preserve">
				</svg>
			</li>
             
             <li data-name="activity" class="drop-down__item"> <a href="contents/contents99"> 김희진 </a> 
	             <svg version="1.1" class="drop-down__item-icon" 
	             xmlns="http://www.w3.org/2000/svg" 
	             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" 
	             width="95.103px" height="95.103px" viewBox="0 0 95.103 95.103" 
	             style="enable-background:new 0 0 95.103 95.103;" xml:space="preserve">
				</svg>
			</li>
           
           </ul>
         </div>
       </div>
</div>
            
            
            
            
         </ul>  
      </nav>   
      </c:if>
      
      
      
      
      <section class="sec1"> 
      
      	
     
      </section>
      
      <div class="openMenu">
     <img alt="" src="resources/img/open.png" width="100px" height="100px">
      
      </div>
        
        <div class="closeMenu">
     <img alt="" src="resources/img/close.png" width="100px" height="100px">
      
      </div>
      
      <div class="mainSection">
      
      <div class="logoSection">
      		<img alt="" src="resources/img/study1.png">
      		
      	</div>
      	
      	<div class="menuSection">
      		<ul>
      			<li onmouseover="anim('about')" onclick="study1_click();"> 
      				<div id="about" class="menu">
      				HANSO
      				<div class="rotate">L</div>
      				</div>
      			</li>
      			
      			<li onmouseover="anim('work')" onclick="study2_click();"> 
      				<div id="work" class="menu">
      				SOSU
      				<div class="rotate">N</div>
      				</div>
      			</li>
      			
      			<li onmouseover="anim('services')" onclick="study3_click();"> 
      				<div id="services" class="menu">  
      				HEEJI
      				<div class="rotate">N</div>
      				</div>
      			</li>
      		
      		
      		</ul>
      	</div>
      </div>
      
      
      <div class="box1">
      <h1>  </h1>
    	  
      </div>
      
       <div class="box2">
      <h1>  </h1>
      
      </div>
      
       <div class="box3">
      <h1>  </h1>
      </div>
     
      
      
      
   <!-- </div> wrapper를 안 쓰고 있었는데? -->

</body>
</html>