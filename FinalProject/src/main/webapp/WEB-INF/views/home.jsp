<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
	
	<head>
	   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	   
	   <title>JavaLingo Main</title>
	   
	   <link rel="stylesheet" type="text/css" href="resources/css/styleMain.css">
	   <link rel="stylesheet" type="text/css" href="resources/css/styleNav.css">
	   <link href="http://fonts.googleapis.com/css?family=Quicksand:500" 
	         rel="stylesheet">
	  
	   <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
	   
	   <script type="text/javascript">
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
	      
	      function selectLevelPage() { location.href = "contents/contentsHome"; }
	      function joinForm() { location.href = "person/joinForm"; }  
	      function loginForm() { location.href = "person/loginForm"; }  
	      unction logout(loginId) { 
	    	  var result = loginId.includes('@gmail.com');
	    	  if(result) {
	    		  window.open('https://accounts.google.com/logout', 'popup', 'z-lock=yes, width=600, height=400');
	    	  }
	    	  location.href = "person/logout"; 

	    	}  
	      function mypageUser() { location.href = "person/mypageUser"; } 
	      function board() { location.href = "board/boardList"; } 
	      function testPage() { location.href = "person/test67"; }
	      
	      
	      
	   </script>
	
	</head>  

	<body style="overflow-x:hidden; overflow-y:hidden">
	
		<div class="wrapper">
	     
	    	<!-- 상단 내비게이션 바 -->
	    	<nav>
	        
	        <!-- 로그아웃 -->
	        <c:if test="${sessionScope.loginId == null }">       
	        
	        	<div class="slogan">
				EasyCodingU
				  	<ul class="list">
					    <li> WelCome To Web Page </li>
					    <li> Thank You </li>
					    <li> WelCome To Web Page </li>
					    <li> Thank You </li>
					    <li> WelCome To Web Page </li>
				  	</ul>
				</div>
	            
	        </c:if> <!-- 로그아웃 끝 -->
	      
	        <!-- 로그인 -->
		         
		    <c:if test="${sessionScope.loginId != null }">
		          
		    	<div class="slogan">
				EasyCodingU
					<ul class="list">
					    <li> WelCome To Web Page </li>
					    <li> <span> Name : </span> ${sessionScope.loginName} </li>
					    <li> <span> Id : </span> ${sessionScope.loginId} </li>
					    <li> <span> Name : </span> ${sessionScope.loginName} </li>
					    <li>  Thank You </li>
					</ul>
				</div>
				
				<div class="displayLevel"> 
					<span> level : </span> 
					${person.grade} 
				</div>
				
				<div class="displayProgress"> 
					<span> progress : </span> 
					<fmt:parseNumber value="${bestLevel / 12 * 100}" integerOnly="true"/>
					<%-- ${bestLevel / 12 * 100} --%>%  
				</div>
		    
		     </c:if> <!-- 로그인 끝 -->  
	      	 
	      	 </nav> <!-- 상단 내비게이션바 끝 -->  
	      
	      
		     <!-- 당장 쓸모는 없으나 지우지는 마세요 - 지호 -->      
		     <section class="sec1"> </section>  
	
	
	      	 <!-- 메인화면 좌측 컴퓨터하는 사람 모양 나오는 부분 -->
	      	 <div class="box1"> 
			 	
			 	<div class="background">
	  	  			
	  	  			<!-- 그림 자체를 감싸고 있는 div -->
	  	  			<div class="BWrap"> 
	  					
	  					<div class="frame"></div>
	    		
				    		<!-- 사람과 관련된 요소 -->
				    		<div class="me">
				      			<div class="me-body"></div>
				      			<div class="me-head"> 
				      				<div class="hair"></div>
				        			<div class="face">
							        	<div class="eye-left"></div>
							            <div class="eye-right"></div>
							            <div class="mouth"></div>
				        			</div> 
				        			<div class="hair-front"></div>
				      			</div>   
				   			</div> <!-- 사람과 관련된 요소 끝 -->
	  
	  					<!-- 책상에 있는 물건들과 관련된 요소 -->
						<div class="table">
					
							<div class="bowl">
						    	<div class="cable">
						       		<div class="leaf-1"></div>
						         	<div class="leaf-2"></div>
						         	<div class="leaf-3"></div>
						         	<div class="leaf-4"></div>
						        </div>
				    		</div>
				    
						    <div class="bowl-2">
						    	<div class="caneta-1"></div>
						      	<div class="caneta-2"></div>
						    </div>
				    
						    <div class="notebook">
						    	<div class="apple"></div>
						    </div>
				    
						    <div class="book-1"></div>
						    <div class="book-2"></div>
						    <div class="book-3"></div>
				    
						    <div class="coffee">
						    	<div class="smoke"></div>
						    </div>
				
						</div> <!-- 책상에 있는 물건들과 관련된 요소 끝 -->
	  	
	  					<!-- 꽃과 관련된 요소 -->
	  					<div class="flower"></div>
					
					</div> <!-- 그림 자체를 감싸고 있는 div 끝 -->
		  
		  		</div> <!-- background 끝 -->
		  
	 		 </div> <!-- box1 끝 -->
	 
	 
			<!-- 로그아웃 -->
			<c:if test="${sessionScope.loginId == null }"> 
	 
	 		<!-- 메인화면 중간 버튼 부분 -->
		 	<div class="box2"> 
		  
		  		<div class="container">
					
					<div class="wrapper2">
			    		<div class="card" onclick="joinForm();"> 
			    			<i class="fal fa-arrow-right"></i> 
			    		</div>
			  		</div>
			  	
			  		<div class="wrapper1">
			    		<div class="card"> 
			    			<i class="fal fa-arrow-right"></i> 
			    		</div>
			  		</div>
			  		
				</div> <!-- container 끝 -->
		  	
		  	</div> <!-- box2 끝 -->
		  
			<!-- 메인화면 오른쪽 버튼 부분 -->	  
		    <div class="box3"> 
		  
		  		<div class="container">
					
					<div class="wrapper4">
			    		<div class="card" onclick="loginForm();"> 
			    			<i class="fal fa-arrow-right"></i> 
			    		</div>
			  		</div>
			  	
			  		<div class="wrapper3">
			    		<div class="card"> 
			    			<i class="fal fa-arrow-right"></i> 
			    		</div>
			  		</div>
				
				</div> <!-- container 끝 -->
		  	
		  	</div> <!-- box3 끝 -->
		
			</c:if> <!-- 로그아웃 끝 -->
		
		
			<!-- 로그인 -->
			<c:if test="${sessionScope.loginId != null }"> 
	 
				<div class="box2"> 
			  
			    	<div class="container">
					
						<div class="wrapper6">
				    		<div class="card" onclick="mypageUser();"> 
				    			<i class="fal fa-arrow-right"></i> 
				    		</div>
				  		</div>
				  	
				  		<div class="wrapper1">
				    		<div class="card" onclick="board();"> 
				    			<i class="fal fa-arrow-right"></i> 
				    		</div>
				  		</div>
				  		
				  		<div class="wrapper7">
				    		<div class="card" onclick="selectLevelPage();"> 
				    			<i class="fal fa-arrow-right"></i> 
				    		</div>
				  		</div>
					
					</div> <!-- container 끝 -->
					
			  	</div> <!-- box2 끝 -->
			  
			    <div class="box3"> 
			  
			  		<div class="container">
						
						<div class="wrapper5">
				    		<div class="card" onclick="logout('${sessionScope.loginId}');"> 
				    			<i class="fal fa-arrow-right"></i> 
				    		</div>
				  		</div>
				  	
				  		<div class="wrapper3">
				    		<div class="card"> 
				    			<i class="fal fa-arrow-right"></i> 
				    		</div>
				  		</div>
				  		
				  		<div class="wrapperVoid">
				    		<div class="card"> 
				    			<i class="fal fa-arrow-right"></i> 
				    		</div>
				  		</div>
					
					</div> <!-- container 끝 -->
					
			  	</div> <!-- box3 끝 -->
			
			</c:if> <!-- 로그인 끝 -->  
		      
		</div> <!-- wrapper를 안 쓰고는 있지만 혹시 몰라서 그냥 남겨놓음 -->
		
	</body>
	
</html>
