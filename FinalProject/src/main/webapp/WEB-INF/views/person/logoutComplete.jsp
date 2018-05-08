<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>안녕히 가십시오!</title> 
   <link rel="stylesheet" type="text/css" href="../resources/css/styleComplete.css">
   <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
</head>

<body>

   <div class="wrapper" >
      <h1> intro </h1>
   </div>
   
   <div class="welcome-section content-hidden">
      <div class="content-wrap">
         <ul class="fly-in-text">
            <li>E</li>
            <li>a</li>
            <li>s</li>
            <li>y</li>
            <li>C</li>
            <li>o</li>
            <li>d</li>
            <li>i</li>
            <li>n</li>
            <li>g</li>
            <li>U</li>
         </ul>
         <a class="enter-button" style="color: white;"> Made By C-Class #3 </a>
         <a href="/easycodingu/home" class="enter-button"> ${sessionScope.loginName }  </a>
       
      
      </div>
   </div>

   <script type="text/javascript">
      
   $(function() {
         var welcomeSection = $('.welcome-section'),
         enterButton = welcomeSection.find('.enter-button');
         
         setTimeout(function() {
            welcomeSection.removeClass('content-hidden');
         }, 800);
         
         /* enterButton.on('click', function(e) {
            e.preventDefault();
            welcomeSection.addClass('content-hidden').fadeOut();
         }); */
         
      });
   
   </script>

</body>
</html>