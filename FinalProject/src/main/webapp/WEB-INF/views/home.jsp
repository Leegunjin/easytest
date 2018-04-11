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
      function loginForm() { location.href = "person/loginForm"; }  
      function logout() { location.href = "person/logout"; } 
      function mypageUser() { location.href = "person/mypageUser"; } 
     
   </script>

</head>  

<body>

   <div class="wrapper">
     
      <nav>
         
         <div class="logo"> EasyCodingU </div>   
       
       <ul>
         
         <!-- 로그인 한 사람 없을때 -->
         <c:if test="${sessionScope.loginId == null }">            
            
            <li class="anitamedButton"> 
				<div class="buttonWrapper">
					<div class="buttonContent">
						<span class="button">
						 <p onclick="loginForm();"> Login </p>
					 	</span>
					</div>
				</div>
            </li>
            
         </c:if>
      
         <!-- 로그인 했을때 -->
         <c:if test="${sessionScope.loginId != null }">
            
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
						 <p onclick="mypageUser();"> My Page </p>
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
               
         </c:if>
      
         <!-- 기본 메뉴 (로그인/아웃 여부 상관없이) -->
         
         
         
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
						<span class="buttonStudy">
						 <p onclick="selectLevelPage();"> Study </p>
					 	</span>
					</div>
				</div>
           	</li>
         
         </ul>
      </nav> <!-- 상단 내비게이션바 끝 -->  
      
      
      <!-- 당장 쓸모는 없으나 지우지는 마세요 - 지호 -->      
      <section class="sec1"> </section>  


      <!-- 메인 화면 스크롤 내리면 그림 바뀌는 부분 입니다 - 지호 -->
      <div class="box1"> <h1>  </h1> </div>
      <div class="box2"> <h1>  </h1> </div>
      <div class="box3"> <h1>  </h1> </div>

      
   </div> <!-- wrapper를 안 쓰고 있었는데? -->

</body>
</html>