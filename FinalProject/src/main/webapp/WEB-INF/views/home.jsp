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
      });
           
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
      
      
      function selectLevelPage() {
    	  location.href = "contents/contentsHome";
    	  
      }
   </script>
</head>  

<body>
<div class="wrapper">
     
<nav>
   <div class="logo"> EasyCodingU </div>   
   <ul>
      <!-- 로그인 한 사람 없을때 -->
      <c:if test="${sessionScope.loginId == null }">            
         <li> <a href="person/loginForm"> Login </a> </li>
      </c:if>
      
      <!-- 로그인 했을때 -->
      <c:if test="${sessionScope.loginId != null }">
         <li> <a style="color: #18aafe; font-weight: bold;"> Hello ${sessionScope.loginName }
         <span style="color: gray; font-weight: normal;">(${sessionScope.loginId })</span>  </a> </li>
         <li> <a href="#"> My Page </a> </li>
         <li> <a href="person/logout" onclick="googleLogout('${loginId}')"> Logout </a> </li>
      </c:if>
      
      <!-- 기본 메뉴 -->
      <li> <a href="#"> Board </a> </li>
      <li> <a href="#"> Language </a> </li>
      
                 
      <div class="table_center">
         <div class="drop-down">
            <div id="dropDown" class="drop-down__button">
            
            <span class="drop-down__name" onclick="selectLevelPage();">Study</span>
            <svg version="1.1" class="drop-down__icon" xmlns="http://www.w3.org/2000/svg" 
            xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="48.625px" 
            height="48.625px" viewBox="0 0 48.625 48.625" 
            style="enable-background:new 0 0 48.625 48.625;" xml:space="preserve">
            </svg>
            </div>
          
         </div>
      </div>
   </ul>
</nav>   
      
<section class="sec1"> 

</section>

      
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




</div>

</body>
</html>