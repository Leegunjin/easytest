<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8">
		<title> Tutorial </title>
				       
        <link rel="stylesheet" type="text/css" href="../resources/css/styleTutorial.css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<script>
		
		'use strict';
		// Abandon all hope ye who enter here
		$(document).ready(function() {
		  
		  var navigating = false,
		      curPage = 1,
		      pages = $(".section").length,
		      $sections = $(".sections"),
		      $paginationPage = $(".pagination .page"),
		      $paginationTotal = $(".total-pages"),
		      $textStuff = $(".section-heading, .additional-text");
		  
		  if (pages >= 10) {
		    $paginationTotal.text(pages);
		  } else {
		    $paginationTotal.text("0" + pages);
		  }
		  
		  /*
		  Sets random transition-delay for blocks between 0.4 and 1.2 seconds on every call
		  */
		  function randomDelay() {
		    $(".left-part").css("transition-delay", (Math.floor(Math.random() * 9) + 4)/10 + "s");
		    for (var i = 1; i <= pages; i++) {
		      $(".bg-part:nth-child("+i+")").css("transition-delay", (Math.floor(Math.random() * 9) + 4)/10 + "s");
		    }
		  }
		  
		  /* Async hell, with hardcoded numbers.
		  On production, 410 number must be .section-heading transform transition time in miliseconds + 10, but i'm sort of tired of this demo :D
		  */
		  function timeoutNav(t) {
		    var time = t || 2000;
		    $textStuff.addClass("not-visible");
		    setTimeout(function() {
		      navigating = false;
		      randomDelay();
		    }, time);
		    setTimeout(function() {
		      // cached selector not working because of newely created clone when moving up more then 2 positions
		      $(".section-heading, .additional-text").css({"margin-top": 0 - (parseInt($(".nav-elem.active").attr("data-page")) - 1) * 100 + "vh"}).hide();
		    }, 410);
		    setTimeout(function() {
		      $textStuff.show();
		      $textStuff.css("top");
		      $textStuff.removeClass("not-visible");
		    }, time + 10);
		  }
		  
		  function magicStuff(paramPage) {
		    if (paramPage) curPage = paramPage;
		    navigating = true;
		    var calculatedMargin = 0 - (curPage - 1) * 100;
		    $(".bg-part, .left-part").css("margin-top", calculatedMargin +"vh");
		    $(".scroll-down").addClass("removed");
		    if (parseInt($(".nav-elem.active").attr("data-page")) === 1) {
		      $(".scroll-down").removeClass("removed");
		    }
		  }
		  
		  function trickyStuff(page) {
		    $(".left-part, .bg-part").css({"transition-duration": "0s", "transition-delay": "0s"});
		    $(".main").css("top");
		    magicStuff(page);
		    $(".main").css("top");
		    $(".left-part, .bg-part").css("transition-duration", "0.8s");
		    randomDelay();
		  }
		  
		  function pagination(pg) {
		    $(".nav-elem").removeClass("active");
		    $(".nav-" + pg).addClass("active");
		    curPage = pg;
		    
		    if (pages >= 10) {
		      $paginationPage.text(pg);
		    } else {
		      $paginationPage.text("0" + pg);
		    }
		  }
		  
		  function navigateUp() {
		    if (curPage > 1) {
		      curPage--;
		      pagination(curPage);
		      magicStuff();
		      timeoutNav();
		    }
		  }
		  
		  function navigateDown() {
		    if (curPage < pages) {
		      curPage++;
		      pagination(curPage);
		      magicStuff();
		      timeoutNav();
		    }
		  }
		  
		  $(document).on("mousewheel DOMMouseScroll", function(e) {
		    if (!navigating) {
		      if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
		        navigateUp();
		      } else { 
		        navigateDown();
		      }
		    }
		  });
		  
		  $(document).on("mousewheel DOMMouseScroll",
		                 ".sidebar-hover, .sidebar-real",
		                 function(e) {
		    e.stopPropagation();
		  });
		  
		  var sidebarScroll = 0,
		      $navEl =  $(".nav-elem"),
		      $sidebar = $(".sidebar-real"),
		      maxScroll = $navEl.length * $navEl.height() - $(window).height();
		  
		  $(document).on("mousewheel DOMMouseScroll", ".sidebar-real", function(e) {
		    if (navigating) return;
		    if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
		      if (!sidebarScroll) return;
		      sidebarScroll += 100;
		      if (sidebarScroll > 0) sidebarScroll = 0;
		    } else { 
		      if (Math.abs(sidebarScroll) === maxScroll) return;
		      sidebarScroll -= 100;
		      if (Math.abs(sidebarScroll) > maxScroll) sidebarScroll = 0 - maxScroll;
		    }
		    $sidebar.css("transform", "translateY("+ sidebarScroll +"px)");
		  });
		  
		  $(document).on("click", ".nav-elem:not(.active)", function() {
		    if (navigating) return;
		    var activePage = parseInt($(".nav-elem.active").attr("data-page"), 10),
		        futurePage = $(this).attr("data-page");
		    
		    pagination(futurePage);
		    
		    if (Math.abs(activePage - futurePage) > 2) {
		      var $fakePage = $(".section-" + futurePage).clone(),
		          $currentPage = $(".section-" + activePage),
		          fakeNumber = 0;
		      // ugly code, do not enter here
		      if (activePage < futurePage) {
		        // moving down
		        $currentPage.after($fakePage);
		        fakeNumber = activePage + 1;
		        $(".main").css("top");
		        randomDelay();
		        magicStuff(fakeNumber);
		      } else {
		        // moving up (real hell)
		        $currentPage.before($fakePage);
		        fakeNumber = activePage - 1;
		        trickyStuff(activePage + 1);
		        $(".main").css("top");
		        randomDelay();
		        $(".main").css("top");
		        magicStuff(activePage);
		      }
		      timeoutNav(2050);
		      setTimeout(function() {
		        $fakePage.remove();
		        trickyStuff(futurePage);
		      }, 2000);
		    } else {
		      magicStuff(futurePage);
		      timeoutNav();
		    }
		  });
		  
		  $(window).resize(function() {
		    maxScroll = $navEl.length * $navEl.height() - $(window).height();
		    $sidebar.css("transform", "translateY(0)");
		  });
		  
		});
		
		
		function goHome() { location.href = "/easycodingu/home"; } 
		
		</script>

	</head>

	  <body>
	   
	  	<div class="main">
	  
	    	<div class="sidebar-hover">
	    		<p class="pagination">
	      			<span class="page">01</span> / <span class="total-pages">08</span>
	    		</p>
	  		</div>
	  		
		  	<div class="sidebar-real">
			    <div data-page="1" class="nav-elem nav-1"></div>
			    <div data-page="2" class="nav-elem nav-2"></div>
			    <div data-page="3" class="nav-elem nav-3"></div>
			    <div data-page="4" class="nav-elem nav-4"></div>
			    <div data-page="5" class="nav-elem nav-5"></div>
			    <div data-page="6" class="nav-elem nav-6"></div>
			    <div data-page="7" class="nav-elem nav-7"></div>
			    <div data-page="8" class="nav-elem nav-8"></div>
	  		</div>
	  		
		  	<div class="sections">
		    	
		    	<!-- 첫번째 슬라이드 -->
		    	<div class="section section-1">
		        	
		        	<div class="left-part"></div>
		            	
		            	<div class="content">
		                	<div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading"> #1 Login Page </h2>
					        <p class="additional-text"> If Contents Use, Login.</p>
		      			</div>
		    	</div> <!-- section-1 끝 -->
		    	
		    	
		    	<!-- 두번째 슬라이드 -->
		    	<div class="section section-2">
		        	
		        	<div class="left-part"></div>
		     	 		
		     	 		<div class="content">
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading"> #2 Main Page </h2>
					        <p class="additional-text"> My Page, Study, Board Open.</p>
		      			</div>
		    	</div> <!-- section-2 끝 -->
		    	
		    	
		    	<!-- 세번째 슬라이드 -->
		    	<div class="section section-3">
			    	
			    	<div class="left-part"></div>
			        	
			        	<div class="content">
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading"> #3 My Page </h2>
					        <p class="additional-text"> Your Infomation. </p>
			      		</div>
		    	</div> <!-- section-3 끝 -->
		    	
		    	
		    	<!-- 네번째 슬라이드 -->
		    	<div class="section section-4">
		      		
		      		<div class="left-part"></div>
		      
		      			<div class="content">
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading"> #4 Study Quiz </h2>
					        <p class="additional-text"> Level 1~12. </p>
		      			</div>
		    	</div> <!-- section-4 끝 -->
		    	
		    	
		    	<!-- 다섯번째 슬라이드 -->
		    	<div class="section section-5">
		      		
		      		<div class="left-part"></div>
		      		
		      			<div class="content">
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading"> #5 Hidden </h2>
					        <p class="additional-text"> Trophy Quiz </p>
		      			</div>
		    	</div> <!-- section-5 끝 -->
		    	
		    	
		    	<!-- 여섯번째 슬라이드 -->
		    	<div class="section section-6">
		      		
		      		<div class="left-part"></div>
		      
		      			<div class="content">
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading"> #6 Board </h2>
					        <p class="additional-text"> Q & A User to User. </p>
		      			</div>
		    	</div> <!-- section-6 끝 -->
		    	
		    	
		    	<!-- 일곱번째 슬라이드 -->
		    	<div class="section section-7">
		      		
		      		<div class="left-part"></div>
		      
		      			<div class="content">
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading"> #7 Hash Tag </h2>
					        <p class="additional-text"> Just Easy Search. </p>
		      			</div>
		    	</div> <!-- section-7 끝 -->
		    
		    
		    	<!-- 여덟번째 슬라이드 -->
		    	<div class="section section-8">
		      		
		      		<div class="left-part"></div>
		      
		      			<div class="content">
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <div class="bg-part"></div>
					        <h2 class="section-heading">
					        	<a class="codepen-link" > #8 Tutorial Complete! </a>
					        </h2>
					        <p class="check-out additional-text">Thank You.
					        	<a onclick="goHome();" style="cursor: pointer;">Go Main</a>
					        </p>
		      			</div>
		    	</div> <!-- section-8 끝 -->
		  	
		  	</div> <!-- sections 끝 -->
		  
		  <h2 class="scroll-down">Scroll down</h2>
		</div>
	 
	  </body>

</html>