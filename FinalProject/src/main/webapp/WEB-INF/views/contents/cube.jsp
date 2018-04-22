<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>TEST PAGE</title>
	<style type="text/css">
		.bodyClass {
		  background: #d7dde5;
		  font-family: sans-serif;
		  width: 100vw;
		  height: 100vh;
		  perspective: 600px;
		} 

		.h1Cube, .h2Cube {
		  position: absolute;
		  left: 50%;
		  transform: translateX(-50%);
		  color: white;
		  text-transform: uppercase;
		  letter-spacing: 2px;
		}
		
		.h1Cube {
		  top: 24px;
		  font-size: 12px;
		}
		
		.h2Cube {
		  top: 44px;
		  font-size: 10px;
		  opacity: 0.7;
		}
		
		.divCube {
		  position: absolute;
		  width: 120px;
		  height: 120px;
		  top: 0;
		  background: #37B595;
		  box-shadow: 0 0 0 2px white inset;
		  border-radius: 3px;
		  cursor: all-scroll;
		  transition: all 0.5s ease-in-out;
		  transform-style: preserve-3d;
		}
		
		#baseCube {
		  top: 63%;
		  left: 75%;
		  background: #37B595;
		  box-shadow: 0 0 60px 15px #37B595;
		  transform: translate(-50%, -50%) rotateX(70deg) rotate(-45deg);
		}
		
		.divCube#baseCube.rotate {
		  animation: rotate 6s linear infinite;
		}
		
		.divCube#rightCube {
		  transform-origin: 0% 50%;
		  transform: translateX(120px);
		}
		
		.divCube#rightCube.on {
		  transform: translateX(120px) rotateY(-90deg);
		}
		
		.divCube#leftCube {
		  transform-origin: 100% 50%;
		  transform: translateX(-120px);
		}
		
		.divCube#leftCube.on {
		  transform: translateX(-120px) rotateY(90deg);
		}
		
		.divCube#frontCube {
		  transform-origin: 50% 0%;
		  transform: translateY(120px);
		}
		
		.divCube#frontCube.on {
		  transform: translateY(120px) rotateX(90deg);
		}
		
		.divCube#backCube,
		.divCube#topCube {
		  transform-origin: 50% 100%;
		  transform: translateY(-120px);
		}
		
		.divCube#backCube.on,
		.divCube#topCube.on {
		  transform: translateY(-120px) rotateX(-90deg);
		}
		
		/* ul.timeline {
		  position: absolute;
		  width: 200px;
		  height: 2px;
		  top: 80%;
		  left: 50%;
		  background: rgba(255, 255, 255, 0.4);
		  opacity: 0;
		  transition: all 0.4s ease-in-out;
		  transform: translateX(-50%) translateY(100px) scale(0.4);
		}
		ul.timeline li {
		  position: absolute;
		  height: 100%;
		  top: 0;
		  left: 0;
		  background: white;
		}
		
		ul.timeline.visible {
		  opacity: 1;
		  transition: all 0.4s ease-in-out;
		  transform: translateX(-50%) translateY(0) scale(1);
		} */
		
		@keyframes rotate {
		  from {
		    transform: translate(-50%, -50%) rotateX(70deg) rotate(-45deg);
		  }
		  to {
		    transform: translate(-50%, -50%) rotateX(70deg) rotate(315deg);
		  }
		}
	</style>
	<script type="text/javascript">
		$(function() {
			function on(e) {
				  var time = 6000; // Same as animation duration in CSS:45
				  
				  var target = document.getElementById(e.target.id);
				  if (target.classList.contains('on')) target.classList.remove('on');
				  else target.classList.add('on');
				 
				  /* if (divs.length === document.querySelectorAll('div.on').length) {
				    base.classList.add('rotate');
				    timeline.classList.add('visible');
				    
				    // Timeline
				    var	width = 0;
						setInterval(function() {
				      if (width == 100) clearInterval();
				      else document.querySelector('.timeline li').style.width = (width++) + '%';
				    }, time/100);
				    
				    // Reset divs & timeline after the rotation
				    setTimeout(function() {
				      base.classList.remove('rotate');
				      timeline.classList.remove('visible');
				      for (i = 1; i < divs.length; i++) divs[i].classList.remove('on');
				    }, time);
				  } */
				}


				var base = document.getElementById('baseCube'),
				    timeline = document.querySelector('.timelineCube'),
				    divs = document.querySelectorAll('divCube');
				base.addEventListener("click", on, false);
		});
	</script>
</head>
<body class="bodyCube">
	<h1 class="h1Cube">큐브를 조립해 봅시다!</h1>
	<h2 class="h2Cube">상자를 눌러보세요!</h2>
	<div class="divCube" class="on" id="baseCube">
	  <div class="divCube" id="leftCube"></div>
	  <div class="divCube" id="rightCube"></div>
	  <div class="divCube" id="frontCube"></div>
	  <div class="divCube" id="backCube">
	    <div class="divCube" id="topCube"></div>
	  </div>
	</div>
	<ul class="timelineCube">
	  <li></li>
	</ul>
</body>
</html>