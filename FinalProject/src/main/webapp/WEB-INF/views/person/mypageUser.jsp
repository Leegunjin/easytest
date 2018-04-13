<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title>My page</title>
   
   <link rel="stylesheet" type="text/css" href="../resources/css/styleContentsMain.css">
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

	           
	      function loginForm() { location.href = "../person/loginForm"; } 
	      function logout() { location.href = "../person/logout"; } 
	      function goHome() { location.href = "/easycodingu/home"; } 
	
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