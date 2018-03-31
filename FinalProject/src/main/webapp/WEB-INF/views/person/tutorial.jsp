<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


  <head>

    <title> 튜토리얼아 왜그러니 </title>

   <style type="text/css">
   
   body {
   margin: 0;
   padding: 0;
   font-family: Quicksand;
}

section.sec1 {
   width: 100%;
   height: 90vh;
   background: url("../resources/img/tutorial1.png");
   background-size: cover;
   background-position: center;
}

.wrapper {
   width: 100%;
   height: 100vh;

}

section.botton {
   width: 100%;
   height: 10vh;
   /* background: url("../resources/img/tutorial1.png"); */
   background-color: rgb(110,110,110);
   background-size: cover;
   background-position: center;
   color: rgb(24,170,254);
   text-align: center;
   font-size: 38px;  
}

section.botton:HOVER {
   background-color: rgb(24,170,254);
   color: white;

}
   
   
   </style>

  </head>

  <body>
  
  <!-- <a href="/easycodingu"> 메인으로 가기</a> -->
 
 <div class="wrapper">
 
 <section class="sec1">  
 
 
 </section>
 
  <section class="botton" onclick="location.href='../home'">   
      메인화면으로 이동
  </section>
    
</div>

  </body>

</html>