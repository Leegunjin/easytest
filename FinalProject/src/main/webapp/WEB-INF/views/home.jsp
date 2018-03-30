<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title> Java Lingo </title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/full-slider.css">

  <style>
      body {
        margin: 0px;
        padding: 0px;
      }
      .jbTitle {
        text-align: center;
      }
      
      
      .jbleft{
     
     	text-align: center;
        background-color:rgb(24,170,254);
        padding: 10px 0px;
        width: 100%;
         text-decoration: none;
      
      }  
      
       .jbright{
      
     text-align: center;
        background-color:rgb(24,170,254);
      
        width: 100%;
       
       margin: 0px 30px 0px 10px;
        font-weight: bold;
        font-size: 25px;
        color: white;
        text-decoration: none;
      }   
      
       
      .jbMenu {
        text-align: center;
        background-color:rgb(24,170,254);
        padding: 10px 0px;
        width: 100%;
         text-decoration: none;
      }
      .jbContent {
        /* height: 2000px; */
      }
      .jbFixed {
        position: fixed;
        top: 0px;
      }
    </style>
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
    
  </head>

  <body>
  
   <div class="jbTitle">
     
    </div>
    <div class="jbMenu">
     <div class="jbleft"> <img alt="" src="resources/img/mainlogo.png"> </div>
   
   <div class="jbright"> 
     <a class="jbright" href="/easycodingu"> 마이페이지 </a>
     <a class="jbright" href="person/loginForm"> 로그인 </a>
     <a class="jbright" href="/easycodingu"> 게시판 </a>
     <a class="jbright" href="/easycodingu"> 홈으로 가기 </a>  
    </div>
    
    </div>
    <div class="jbContent">
    </div>
  
  
  <!-- <div id="fixed-menu" style="background-color: rgba(24,170,254,0.7);">
      
      <ul>
        <li>Lorem</li>
        <li>Ipsum</li>
        <li>Dolor</li>
      </ul>
    </div>
    <div id="main-content"> -->
      <!-- <img src="resources/img/sample.jpg"> -->
    </div>
  
	<%-- <%@ include file="menubar.jsp" %>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#"> Java Lingo </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="loginForm">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">My Page</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Board</a>
            </li>
          </ul>
        </div>
      </div>
    </nav> --%>

    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('resources/img/bg1.JPG')">
            <div class="carousel-caption d-none d-md-block">
              <h3>사진 테스트 1</h3>
              <p>이 글이 잘 보입니까?</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('resources/img/bg2.JPG')">
            <div class="carousel-caption d-none d-md-block">
              <h3>사진 테스트 2</h3>
              <p>이 글이 잘 보입니까?</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('resources/img/bg3.JPG')">
            <div class="carousel-caption d-none d-md-block">
              <h3>사진 테스트 3</h3>
              <p>이 글이 잘 보입니까?</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content -->
    <section class="py-5">
      <div class="container">
        <h1> 무료로 JAVA를 배울 수 있습니다. 지금 시작하세요.  </h1>
        <p> 이해가 어려운 초보자를 위해 시각화한 교육 프로그램 입니다.</p>
      </div>
      <form action="test" method="post">
		  <input type="text" name="name">
		  <input type="submit" value="테스트">
	  </form>
    </section>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <!-- <script src="vendor/jquery/jquery.min.js"></script> -->
    <script type="text/javascript" src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    
    <!-- <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
    <script type="text/javascript" src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
    
    

  </body>

</html>
