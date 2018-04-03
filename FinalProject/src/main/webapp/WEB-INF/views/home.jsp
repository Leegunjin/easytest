<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title>JavaLingo Main</title>
   <link rel="stylesheet" type="text/css" href="resources/css/styleMain.css">
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
   </script>


</head>  

<body>

   <div class="wrapper">
      
      <c:if test="${sessionScope.loginId == null }">
      <nav>
         <div class="logo"> EasyCordingU </div>   
         <ul>
            <li> <!-- <a href=""> </a> --> </li>
            <li> <a href="person/loginForm"> Login </a> </li>
            <li> <a href="#"> Board </a> </li>
            <li> <a href="#"> Language </a> </li>
            <li> <a class="active" href="contents/contents13"> Study </a> </li>
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
            <li> <a class="active" href="contents/contents13"> Study </a> </li>
         </ul>
      </nav>   
      </c:if>
      
      
      
      
      <section class="sec1"> 
      
      
      </section>
      
      <div class="content"> 
      <!-- <section class="content">  -->
      
         
         
         <p>Lorem Ipsum is simply dummy text of the printing 
         and typesetting industry. Lorem Ipsum has been the 
         industry's standard dummy text ever since the 1500s, 
         when an unknown printer took a galley of type and 
         scrambled it to make a type specimen book. It has 
         survived not only five centuries, but also the leap 
         into electronic typesetting, remaining essentially 
         unchanged. It was popularised in the 1960s with the 
         release of Letraset sheets containing Lorem Ipsum 
         passages, and more recently with desktop publishing 
         software like Aldus PageMaker including versions of 
         Lorem Ipsum.</p>
         
         <p>It is a long established fact that a reader will be 
         distracted by the readable content of a page when looking 
         at its layout. The point of using Lorem Ipsum is that it 
         has a more-or-less normal distribution of letters, as 
         opposed to using 'Content here, content here', making it 
         look like readable English. Many desktop publishing packages 
         and web page editors now use Lorem Ipsum as their default 
         model text, and a search for 'lorem ipsum' will uncover many 
         web sites still in their infancy. Various versions have 
         evolved over the years, sometimes by accident, sometimes 
         on purpose (injected humour and the like).</p>
         
         <p>@copyright 2018 Final Project Make By Sosun Kim, Hansol Kim, 
         Heejin Kim, Jiho Joo, Gunjin Lee </p>
         
         <p>영어 글씨체는 예쁜데 한글은 그렇지 못하다. 왜 그럴까?</p>
         
         
         <!-- </section> -->
         </div>
      
   </div>

</body>
</html>