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
   
   
   <script src="https://smtpjs.com/smtp.js"></script>

   
   <script type="text/javascript">

   $(function() {
 	 
 		 var profile = $('.testImage').val();
 		 var select1 = $('#aqua').val();
 		 var select2 = $('#red').val();
 		 var select3 = $('#blue').val();
 		 
 		 alert(profile);
 		 if(profile == "blank") {
 			 $('#image').css('background','black');
 		 }
 		 
 		 if(profile == "red") {
 			 $('#image').css('background','red');
 		 }
 		 
 		if(profile == "green") {
			 $('#image').css('background','green');
		 }
 		
 		 $('.fa-codepen').click(function() {
 			 $('#image').css('background','aqua');
 	   	 	 alert(select1);
 	   	     
 	   	 	 
 	   	 	 $.ajax({
				
				url : "modifyImage",
				type : "post",
				data : {
					profile_Image : select1
				},
				dataType : "text", // 서버로부터 받아오는 데이터의 타입 (보내는 타입 아님)
				success : function(data) {
					alert("섭어에서 전달받은 문자열 : " + data);
					
				},
				error : function(e) {
					/*여기서는 alert() 알럿으로 찍으면 객체 타입만 나옴 (오브젝트, 오브젝트 로 나옴)*/
					alert(JSON.gtringify(e)); /* 이렇게 해야 에러내용을 볼 수 있어 */
					
				} 
			});
 	   	 	 
 	   	     
 	   	     return true; 
 		 });
 		 
 		$('.fa-facebook').click(function() {
	   	     $('#image').css('background','red');
	   	     alert(select2);
	   	     
	   	  $.ajax({
				
				url : "modifyImage",
				type : "post",
				data : {
					profile_Image : select2
				},
				dataType : "text", // 서버로부터 받아오는 데이터의 타입 (보내는 타입 아님)
				success : function(data) {
					alert("섭어에서 전달받은 문자열 : " + data);
					
				},
				error : function(e) {
					/*여기서는 alert() 알럿으로 찍으면 객체 타입만 나옴 (오브젝트, 오브젝트 로 나옴)*/
					alert(JSON.gtringify(e)); /* 이렇게 해야 에러내용을 볼 수 있어 */
					
				} 
			});
	   	     
	   	     
	   	     return true; 
		 });
 		
 		$('.fa-github').click(function() {
	   	     $('#image').css('background','blue');
	   	  	 alert(select3);
	   	     
	   	     return true; 
		 });
 		
 		$('.fa-tumblr').click(function() {
	   	     $('#image').css('background','yellow');
	   	 	 return true; 
		 });
 		
 		$('.fa-twitter').click(function() {
	   	     $('#image').css('background','green');
	   	 	 return true; 
		 });
 		
 	 
  });
   
   
   </script>
   
   
   
   <script type="text/javascript">
  
   $(function() {
   	   $('.btn').click(function() {
   	     $(this).toggleClass('active');
   	     return $('.box').toggleClass('open');
   	   });

   	 }).call(this);
   
	</script>

   
   <script type="text/javascript">
  
   $(function() 
	 {
	  
	  $('#modifyCheck').submit(function() {
		var name = $('#name').val();
		var name2 = $('#name2').val();
		var password = $('#password').val();
		var password2 = $('#password2').val();
		
		
		if(name == "") { 
			alert('오류 : id칸에 공백이 있습니다.'); 
			name.focus(); return false; 
		}   
		
		if(name == name2) { 
			alert('오류 : 같은 id는 입력 할 수 없습니다.'); 
			return false; 
		}                                                                                                           
		
		
		if(password == "") {
			alert('오류 : 비밀번호칸에 공백이 있습니다.'); 
			return false; 
		}
		
		if(password != password2) {
			alert('오류 : 같은 비밀번호를 입력해주세요.'); 
			return false; 
		}
		
	  });
	  return true;
	  
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
        <li>
        
   <c:if test="${person.profile_Image == 'blank' }">
       <div class="profile">
  	<input type="hidden" id="blank" name="blank" class="testImage" value="${person.profile_Image}">
  
  <div class="content" id="image">
    
    <div class="btn"><span></span></div>
   
  </div>
  </c:if>
  
  
  <c:if test="${person.profile_Image == 'green' }">
       <div class="profile">
       <input type="hidden" id="green" name="green" class="testImage" value="${person.profile_Image}">
  
  
  <div class="content" id="image">
    
    <div class="btn"><span></span></div>
   
  </div>
  </c:if>
  

  
  
  
  <div class="box">
  
  <i class="fa fa-codepen">
  <input type="hidden" id="aqua" name="profile_Image" value="aqua">
  </i>
  
  <i class="fa fa-facebook">
  <input type="hidden" id="red" name="profile_Image" value="red">
  </i>
  
  <!-- <i class="fa fa-github">
   <input type="hidden" id="blue" name="profile_Image" value="blue">
  </i>
  <i class="fa fa-tumblr"></i>
  <i class="fa fa-twitter"></i> -->
  
  </div>
  
</div>
        
        
        
        </li>
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

	
		
		
		<div class="wrapper">

	<div class="form8">

		<div class="stripes">
			<div class="stripe stripe1"></div>
			<div class="stripe stripe2"></div>
			<div class="stripe stripe3"></div>
			<div class="stripe stripe4"></div>
			<div class="stripe stripe5"></div>
			<div class="stripe stripe6"></div>
			<div class="stripe stripe7"></div>
		</div>
		
		<div class="form8__log">
			<span class="form8__text">
				<span>Modify</span> My Info
			</span>
			<form action="modify" method="post" id="modifyCheck"> 
				<input type="hidden" id="name2" name="name2" value="${sessionScope.loginName }">
				<input type="text" id="name" name="name" value="${sessionScope.loginName }">
				<input type="password" id="password" name="password" value="${person.password }">
				<input type="password" id="password2" placeholder="비밀번호 재입력">
				<input type="submit" class="form8__btn" value="Submit">
			</form>
		</div>


	</div>
	
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
      			<%-- <a> ${sessionScope.loginName } </a>  --%>
      			<span>레벨</span>   
      		</p> 
      	
      		<!-- 레벨 바가 표시되는 영역 -->	
      		<div class="rightLevelBar">
      		
	      		<div class="perspective">
				 
				  <!-- 실제로 바를 숫자값에 맞게 이동시키려면 aria-valuenow 값을 조정하면 된다 -->
				  <div class="bar cyan" role="progressbar" aria-valuenow="${sessionScope.testUserLevel}" 
				  	   aria-valuemin="0" aria-valuemax="100">
				    <div class="bar-face roof percentage"></div>
				    <div class="bar-face back percentage"></div>
				    <div class="bar-face floor percentage"></div>
				    <div class="bar-face left"></div>
				    <div class="bar-face right"></div>
				    <div class="bar-face front percentage"> 
				    
				    <!-- 여기에 숫자를 입력하면 바 앞에 표시가 된다 -->
				    <div class="LevelPercentage">${sessionScope.testUserLevel}</div> 
				    
				    </div>
				  </div>
				</div>
			</div> 	
      	</div> <!-- 레벨 표시되는 영역 -->
      	
      	
      	<!-- 진도율을 보여주는 영역 -->
      	<div class="rightYourLProgress">
      		<p> 
      			<a> 진도율  </a>
      			<span> ${sessionScope.testUserLevel * 10}% </span>   
      		</p> 
      		
      		<p> 
      			<a> 수강일  </a>
      			<span> ${sessionScope.testDate} </span>   
      		</p> 
      	
      	
      	</div> <!-- 진도율을 보여주는 영역 끝 -->
      
      
      </div> <!-- box2 끝 -->
         
         
     
     
     </c:if>
 

</body>
</html>