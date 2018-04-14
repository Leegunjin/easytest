<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title>My page</title>
   
   <link rel="stylesheet" type="text/css" href="../resources/css/styleMyPage.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/styleDropdown.css">
   <link href="http://fonts.googleapis.com/css?family=Quicksand:500" 
           rel="stylesheet">
   <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
   <script type="text/javascript">
  

	   
	   /* 내비 바 관련 스크립트 */
	  $(window).on('scroll', function() {
         if($(window).scrollTop()) {
            $('nav').addClass('black');
         }
         else{   
            $('nav').removeClass('black');
         }
      });

	           
	      function logout() { location.href = "logout"; } 
	      function gohome() { location.href = "../home"; } 
	      
	      
	
	      
	      
	   // Stop annoying page refresh!
	      var submit = document.querySelector('#btn-submit'),
	          form = document.querySelector('#form');

	      submit.addEventListener('click', function (e) {
	      	e.preventDefault();
	      	form.reset();
	      }, false);
   </script>

</head>  

<body>
     
      <!-- 로그아웃 상황 -->
      <c:if test="${sessionScope.loginId == null }">
      <body style="overflow-y:hidden">
      
	      <nav>
	      	<div class="logo"> My Page </div>    
	        
	        <ul>
	            
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
	    	<div class="logo"> My Page </div>   
      
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
         
         	<div class="container">

  <section class="up"></section>

  <div class="left">

    <section class="cam"></section>

    <div class="top">

      <ul>
        <li>
		<%
		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH:mm");
		 String today = formatter.format(new java.util.Date());
		
		 out.println(today);
		%>
        <li>
        
          <span><i class="fas fa-signal"></i></span>
          <span><i class="fas fa-wifi"></i></span>
          <span><i class="fas fa-battery-three-quarters"></i>
</span>
        </li>
      </ul>

    </div>

    <div class="profile-info">

      <section class="dots"><i class="fas fa-ellipsis-v"></i></section>

      <ul>
        <li><img src="../resources/img/hs1.png" /></li>
        <li>
          <h2> ${sessionScope.loginName }</h2>
        </li>
        <li> </li>
        <li>${sessionScope.loginId }</li>
        <li>Level &ensp;|&ensp; ${sessionScope.testUserLevel}</li>
        <li>
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fas fa-globe"></i></a>
        </li>
      </ul>

    </div>

    <div class="numbers">

      <ul>
        <li><span>30</span>posts</li>
        <li><span>4</span>collections</li>
        <li><span>1.2k</span>votes</li>
      </ul>

    </div>

    <div class="posts">

      <section class="dots"><i class="fas fa-ellipsis-v"></i></section>

      <div class="one">
        <p>#PROGRAMMING #CODE</p>
        <p>Don't copy paste code. Type it out yourself.</p>
      </div>

      <div class="two">
        <ul>
          <li><img class="image" src="https://goo.gl/BAE7JV" /></li>
          <li>
            <span>Amanda Baker</span>
            <span>Jan 22, 2018.</span>
            <span>&ensp;10h ago.</span>
          </li>
        </ul>
        <ul>
          <li><i class="fas fa-heart"></i> 23k</li>
          <li><i class="fas fa-comment"></i> 117</li>
        </ul>
      </div>

    </div>

    <div class="bottom">
      <ul>
        <li><i class="fas fa-home"></i></li>
        <li><i class="fas fa-search"></i></li>
        <li><i class="fas fa-user"></i></li>
        <li><i class="fas fa-ellipsis-h"></i></li>
      </ul>
    </div>

  </div>

  <!-------------------- -->
  <!-------------------- -->
  <!-------------------- -->

 

</div>
     	</div> <!--  box1 끝 -->
         
         
     <!-- 반으로 나눴을  때 오른쪽을 감싸는 영역 -->    
     <div class="box2">
      
     	<!-- 레벨 표시되는 영역 -->
     	<div class="rightYourLevel">
      		
      		<p> 
      			<a> ${sessionScope.loginName } </a> 
      			<span>레벨</span>   
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
      			<span>진도율</span>   
      		</p> 
      	
      	
      	</div> <!-- 진도율을 보여주는 영역 끝 -->
      
      
      </div> <!-- box2 끝 -->
         
         
     
     
     </c:if>
 

</body>
</html>