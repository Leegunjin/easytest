<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Welcome to JavaLingo</title> 
 
   
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

var c = $('#minicube');
var cubeSize = 150;
var cSize = cubeSize / 3;

var x = cSize * 2;
var y = 0;
var z = 0;
var delay = 60;

function metal() {
    if($('.square').length == $('.square.visible').length) {
        $('#cube').addClass('full');
        setTimeout(function() {
            $('#cube').addClass('metal');
        }, delay * 8);
    }
}

function rX(d) {
    c.toggleClass('transition').css('transform', 'translate3d('+x+'px, '+y+'px, '+z+'px) rotateX('+d+'deg)');
}
function rY(d) {
    c.toggleClass('transition').css('transform', 'translate3d('+x+'px, '+y+'px, '+z+'px) rotateY('+d+'deg)');
}
function rZ(d) {
    c.toggleClass('transition').css('transform', 'translate3d('+x+'px, '+y+'px, '+z+'px) rotateZ('+d+'deg)');
}

function animate() {
    
    var i = 0;
    
    $('.cubeface .square').each(function(key, value) {
        var sq = $(this);
        setTimeout(function() {
            sq.addClass('visible');
            metal();
        }, delay * 2 * (key+1));
    });
    
    // moving left
    setTimeout(function() { rY(-90); }, delay*(i++));
    setTimeout(function() { x -= cSize; rY(0); }, delay*(i++));
    setTimeout(function() { rY(-90); }, delay*(i++));
    // switch
    setTimeout(function() { 
        x -= cSize; 
        rY(0);
        c.css('transform-origin', cSize+'px '+cSize+'px 0');
    }, delay*(i++));
    // moving forward
    setTimeout(function() { rX(-90); }, delay*(i++));
    setTimeout(function() { y += cSize; rX(0); }, delay*(i++));
    setTimeout(function() { rX(-90); }, delay*(i++));
    setTimeout(function() { y += cSize; rX(0); }, delay*(i++));
    setTimeout(function() { rX(-180); }, delay*(i++));
    //switch
    setTimeout(function() { 
        y += cSize;
        z -= cSize;
        rX(0);
        c.css('transform-origin', cSize+'px 0 0');
    }, delay*(i++));
    // moving down
    setTimeout(function() { rX(-90); }, delay*(i++));
    setTimeout(function() { z -= cSize; rX(0); }, delay*(i++));
    setTimeout(function() { rX(-90); }, delay*(i++));
    //switch
    setTimeout(function() { 
        z -= cSize;
        rX(0);
    }, delay*(i++));
    // moving right
    setTimeout(function() { rZ(-90); }, delay*(i++));
    setTimeout(function() { x += cSize; rZ(0); }, delay*(i++));
    setTimeout(function() { rZ(-90); }, delay*(i++));
    setTimeout(function() { x += cSize; rZ(0); }, delay*(i++));
    setTimeout(function() { rZ(-180); }, delay*(i++));
    //switch
    setTimeout(function() { 
        x += cSize;
        y -= cSize;
        rZ(0);
        c.css('transform-origin', '0 0 0');
    }, delay*(i++));
    // moving back
    setTimeout(function() { rZ(-90); }, delay*(i++));
    setTimeout(function() { y -= cSize; rZ(0); }, delay*(i++));
    setTimeout(function() { rZ(-90); }, delay*(i++));
    // switch
    setTimeout(function() { 
        y -= cSize; 
        rZ(0);
        c.css('transform-origin', '0 0 '+cSize+'px');
    }, delay*(i++));
    // moving up
    setTimeout(function() { rY(-90); }, delay*(i++));
    setTimeout(function() { z += cSize; rY(0); }, delay*(i++));
    setTimeout(function() { rY(-90); }, delay*(i++));
    // switch
    setTimeout(function() { 
        z += cSize; 
        rY(0); 
        c.css('transform-origin', '0 '+cSize+'px 0');
    }, delay*(i++));
    // moving left
    setTimeout(function() { rZ(90); }, delay*(i++));
    setTimeout(function() { y+= cSize; rZ(0); }, delay*(i++));
    setTimeout(function() { $('#minicube').addClass('grow'); }, delay*(i++));
}

setTimeout(animate, delay*10);





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

<link rel="stylesheet" type="text/css" href="resources/css/styleIntro.css">
<style type="text/css">


.top {      
	width: 100%;
    height: 40vh;
}

#cvs {
margin-top: 10vh;
}

html, body {
  margin: 0;
  height: 100%;
  background: #18aafe;
  overflow: hidden;
}

@-webkit-keyframes cubeshake {
  0% {
    transform: translate3d(-75px, -150px, 0) rotateX(55deg) rotateZ(45deg);
  }
  50% {
    transform: translate3d(-75px, -150px, 0) rotateX(45deg) rotateZ(45deg);
    top: 55%;
  }
  100% {
    transform: translate3d(-75px, -150px, 0) rotateX(55deg) rotateZ(45deg);
  }
}
@-webkit-keyframes cubeshakeStart {
  0% {
    transform: translate3d(-75px, -150px, 0) rotateX(55deg) rotateZ(45deg);
  }
  50% {
    transform: translate3d(-75px, -150px, 0) rotateX(55deg) rotateY(10deg) rotateZ(45deg);
    top: 55%;
  }
  100% {
    transform: translate3d(-75px, -150px, 0) rotateX(55deg) rotateZ(45deg);
  }
}
@-webkit-keyframes cubeglow {
  0% {
    box-shadow: none;
  }
  50% {
    box-shadow: inset 0 0 50px 5px rgba(255, 255, 255, 0.3);
  }
  100% {
    box-shadow: none;
  }
}
@-webkit-keyframes cubeglowStart {
  0% {
    box-shadow: none;
  }
  50% {
    box-shadow: inset 0 0 50px 5px rgba(255, 255, 255, 0.3);
  }
  100% {
    box-shadow: none;
  }
}
@-webkit-keyframes fall {
  0% {
    transform: translate3d(100px, 0, 500px);
  }
  100% {
    transform: translate3d(100px, 0, 0);
  }
}
@-webkit-keyframes jump {
  0% {
    transform: translate3d(150px, 50px, -50px) rotateX(0deg) rotateY(0deg) rotateZ(0deg);
  }
  75% {
    transform: translate3d(75px, 75px, 50px) rotateX(0deg) rotateY(180deg) rotateZ(0deg);
  }
  100% {
    transform: translate3d(75px, 75px, -75px) rotateX(0deg) rotateY(180deg) rotateZ(0deg);
  }
}
#cvs {
  width: 100%;
  height: 100%;
  perspective: 999999999px;
}

#cube {
  position: absolute;
  height: 150px;
  width: 150px;
  left: 50%;
  top: 50%;
  transform-style: preserve-3d;
  transform: translate3d(-75px, -150px, 0) rotateX(55deg) rotateZ(45deg);
  -webkit-animation: cubeshakeStart 0.3s ease-out;
  -webkit-animation-delay: 0.24s;
}

#cube.full {
  -webkit-animation: cubeshake 0.3s ease-out;
  -webkit-animation-delay: 0.42s;
}

#cube.shake {
  -webkit-animation: cubeshake 0.3s;
}

.cubeface {
  position: absolute;
  height: 150px;
  width: 150px;
  transform-style: preserve-3d;
  -webkit-animation: cubeglowStart 0.3s ease-out;
  -webkit-animation-delay: 0.24s;
}

#cube.full .cubeface {
  -webkit-animation: cubeglow 0.3s ease-out;
  -webkit-animation-delay: 0.42s;
}

.cubeface.front {
  top: 150px;
  transform-origin: top;
  transform: rotateX(-90deg);
}

.cubeface.back {
  transform-origin: top;
  transform: rotateX(-90deg);
}

.cubeface.right {
  left: 150px;
  transform-origin: left;
  transform: rotateY(90deg);
}

.cubeface.left {
  transform-origin: left;
  transform: rotateY(90deg);
}

.cubeface.bottom {
  transform: translateZ(-150px);
}

.square {
  opacity: 0;
  position: absolute;
  height: 50px;
  width: 50px;
  background: #5e4cba;
  border: 3px solid #18aafe; /* 큐브의 작은 네모 바깥 색깔은 여기서 변경 */
  box-sizing: border-box;
  transition: all 0.18s, opacity 0.06s;
}

.square.visible {
  opacity: 1;
}

#cube.metal .square {
  border: 0;
}

#cube.metal .top .square {
  background: #e2e6e9;
}

#cube.metal .front .square {
  background: #898fbf;
}

#cube.metal .right .square {
  background: #535e8b;
}

.top .square:nth-child(1) {
  top: 0;
  left: 50px;
}

.top .square:nth-child(2) {
  top: 0;
  left: 0;
}

.top .square:nth-child(3) {
  top: 50px;
  left: 0;
}

.top .square:nth-child(4) {
  top: 100px;
  left: 0;
}

.front .square:nth-child(1) {
  top: 0;
  left: 0;
}

.front .square:nth-child(2) {
  top: 50px;
  left: 0;
}

.front .square:nth-child(3) {
  top: 100px;
  left: 0;
}

.front .square:nth-child(4) {
  top: 100px;
  left: 50px;
}

.front .square:nth-child(5) {
  top: 100px;
  left: 100px;
}

.right .square:nth-child(1) {
  top: 100px;
  left: 100px;
}

.right .square:nth-child(2) {
  top: 50px;
  left: 100px;
}

.right .square:nth-child(3) {
  top: 0;
  left: 100px;
}

.right .square:nth-child(4) {
  top: 0;
  left: 50px;
}

.right .square:nth-child(5) {
  top: 0;
  left: 0;
}

.right .square:nth-child(6) {
  top: 50px;
  left: 0;
}

#minicube {
  position: absolute;
  width: 50px;
  height: 50px;
  transform: translate3d(100px, 0, 0);
  transform-style: preserve-3d;
  transform-origin: 0 0 0;
  -webkit-animation: fall 0.3s ease-in;
}

#minicube.transition {
  transition: all 0.06s;
}

.minicubeface {
  position: absolute;
  width: 50px;
  height: 50px;
  background: radial-gradient(#5e4cba, #7059e5) center;
  background-size: 100px 100px;
  border: 1px solid #4f3fa1;
  transform-style: preserve-3d;
  box-sizing: border-box;
  transition: all 0.48s ease-in, background 0.06s;
}

.minicubeface.top {
  transform: translate3d(0, 0, 50px);
}

.minicubeface.front {
  transform-origin: bottom;
  transform: rotateX(-90deg);
}

.minicubeface.left {
  transform-origin: left;
  transform: rotateY(-90deg);
}

.minicubeface.right {
  transform-origin: right;
  transform: rotateY(90deg);
}

.minicubeface.back {
  transform-origin: top;
  transform: rotateX(90deg);
}

#minicube.grow {
  -webkit-animation: jump 0.48s cubic-bezier(0.5, 1.2, 0, 0.9);
  transform: translate3d(75px, 75px, -75px) rotateY(180deg) !important;
  transform-origin: 75% 75% 37.5px !important;
}

#minicube.grow .minicubeface {
  width: 75px;
  height: 75px;
}

#minicube.grow .minicubeface.top {
  transform: translate3d(0, 0, 75px);
}

#cube.metal .minicubeface {
  border: 0;
}

#cube.metal .minicubeface.bottom {
  background: #e2e6e9;
}

#cube.metal .minicubeface.front {
  background: #898fbf;
}

#cube.metal .minicubeface.left {
  background: #535e8b;
}


</style>

</head>




<body>








<div class="top">

<div id="cvs">
    <div id="cube">
        
        <div class="cubeface top">
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
        </div>
        <div class="cubeface front">
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
        </div>
        <div class="cubeface right">
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
            <div class="square"></div>
        </div>
        <div class="cubeface back"></div>
        <div class="cubeface left"></div>
        <div class="cubeface bottom"></div>
        
        <div id="minicube">
            <div class="minicubeface top"></div>
            <div class="minicubeface front"></div>
            <div class="minicubeface left"></div>
            <div class="minicubeface right"></div>
            <div class="minicubeface back"></div>
            <div class="minicubeface bottom"></div>
        </div>
    
    </div>
    
</div>

</div> <!-- top 끝 -->


<div class="wrapper" >
      
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
         <a href="home" class="enter-button"> E N T E R </a>
      
      </div>
   </div>
   

</body>
</html>