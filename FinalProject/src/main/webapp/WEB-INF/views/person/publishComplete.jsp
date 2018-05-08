<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[Publishing Certificate Complete]</title>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<style type="text/css">
body {
   background: #009688;
}

h1, h2 {
   font-family: 'Jua', sans-serif;
   color: #fff;
   text-align: center;
}

#container {

}

#message-container {
   position: inherit;
   margin-top: 300px;
}

#mail-container {
  position: absolute;
  top: 40%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  -webkit-animation: mail-move 5s infinite;
          animation: mail-move 5s infinite;
}

#line-container {
  position: absolute;
  left: -70px;
  width: 60px;
  overflow: hidden;
}
#line-container .line {
  margin-top: 5px;
  width: 70px;
  height: 5px;
  background: #fff;
  border-radius: 6px;
}

#mail {
  width: 60px;
  height: 45px;
  border: solid 5px #fff;
  border-radius: 10px;
  overflow: hidden;
}
#mail:before {
  content: '';
  display: inline-block;
  position: relative;
  width: 30px;
  height: 30px;
  border-top: solid 5px #fff;
  border-left: solid 5px #fff;
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
  top: 18px;
  left: 12px;
}
#mail:after {
  content: '';
  display: inline-block;
  position: relative;
  width: 50px;
  height: 50px;
  border: solid 5px #fff;
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
  top: -70px;
  border-radius: 15px;
  background: #009688;
}

.line-1 {
  -webkit-animation: line-1-move 3s infinite;
          animation: line-1-move 3s infinite;
}

@-webkit-keyframes line-1-move {
  0% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(20%);
            transform: translateX(20%);
  }
  60% {
    -webkit-transform: translateX(20%);
            transform: translateX(20%);
  }
  80% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  80.1% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  100% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
}

@keyframes line-1-move {
  0% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(20%);
            transform: translateX(20%);
  }
  60% {
    -webkit-transform: translateX(20%);
            transform: translateX(20%);
  }
  80% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  80.1% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  100% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
}
.line-2 {
  -webkit-animation: line-2-move 3s infinite;
          animation: line-2-move 3s infinite;
}

@-webkit-keyframes line-2-move {
  0% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(40%);
            transform: translateX(40%);
  }
  60% {
    -webkit-transform: translateX(40%);
            transform: translateX(40%);
  }
  80% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  80.1% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  100% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
}

@keyframes line-2-move {
  0% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(40%);
            transform: translateX(40%);
  }
  60% {
    -webkit-transform: translateX(40%);
            transform: translateX(40%);
  }
  80% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  80.1% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  100% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
}
.line-3 {
  -webkit-animation: line-3-move 3s infinite;
          animation: line-3-move 3s infinite;
}

@-webkit-keyframes line-3-move {
  0% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(60%);
            transform: translateX(60%);
  }
  60% {
    -webkit-transform: translateX(60%);
            transform: translateX(60%);
  }
  80% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  80.1% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  100% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
}

@keyframes line-3-move {
  0% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(60%);
            transform: translateX(60%);
  }
  60% {
    -webkit-transform: translateX(60%);
            transform: translateX(60%);
  }
  80% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  80.1% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  100% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
}
.line-4 {
  -webkit-animation: line-4-move 3s infinite;
          animation: line-4-move 3s infinite;
}

@-webkit-keyframes line-4-move {
  0% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(120%);
            transform: translateX(120%);
  }
  60% {
    -webkit-transform: translateX(120%);
            transform: translateX(120%);
  }
  80% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  80.1% {
    -webkit-transform: translateX(80%);
            transform: translateX(80%);
  }
  100% {
    -webkit-transform: translateX(-120%);
            transform: translateX(-120%);
  }
}

@keyframes line-4-move {
  0% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(120%);
            transform: translateX(120%);
  }
  60% {
    -webkit-transform: translateX(120%);
            transform: translateX(120%);
  }
  80% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  80.1% {
    -webkit-transform: translateX(80%);
            transform: translateX(80%);
  }
  100% {
    -webkit-transform: translateX(-120%);
            transform: translateX(-120%);
  }
}
.line-5 {
  -webkit-animation: line-5-move 3s infinite;
          animation: line-5-move 3s infinite;
}

@-webkit-keyframes line-5-move {
  0% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(150%);
            transform: translateX(150%);
  }
  60% {
    -webkit-transform: translateX(150%);
            transform: translateX(150%);
  }
  80% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  80.1% {
    -webkit-transform: translateX(80%);
            transform: translateX(80%);
  }
  100% {
    -webkit-transform: translateX(-120%);
            transform: translateX(-120%);
  }
}

@keyframes line-5-move {
  0% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  20% {
    -webkit-transform: translateX(100%);
            transform: translateX(100%);
  }
  20.0001% {
    -webkit-transform: translateX(-100%);
            transform: translateX(-100%);
  }
  40% {
    -webkit-transform: translateX(150%);
            transform: translateX(150%);
  }
  60% {
    -webkit-transform: translateX(150%);
            transform: translateX(150%);
  }
  80% {
    -webkit-transform: translateX(-80%);
            transform: translateX(-80%);
  }
  80.1% {
    -webkit-transform: translateX(80%);
            transform: translateX(80%);
  }
  100% {
    -webkit-transform: translateX(-120%);
            transform: translateX(-120%);
  }
}
@-webkit-keyframes mail-move {
  0% {
    opacity: 0;
    left: 3%;
  }
  40% {
    opacity: 1;
    left: 50%;
  }
  60% {
    left: 50%;
  }
  80% {
    opacity: 1;
  }
  100% {
    opacity: 0;
    left: 95%;
  }
}
@keyframes mail-move {
  0% {
    opacity: 0;
    left: 3%;
  }
  40% {
    opacity: 1;
    left: 50%;
  }
  60% {
    left: 50%;
  }
  80% {
    opacity: 1;
  }
  100% {
    opacity: 0;
    left: 95%;
  }
}

</style>
</head>
<body>

<div id="container">
   <div id="mail-container">
       <div id="line-container">
          <div class="line line-1"></div>
           <div class="line line-4"></div>
           <div class="line line-2"></div>
           <div class="line line-5"></div>
           <div class="line line-3"></div>
       </div>
       <div id="mail"></div>
   </div>
   <br><br>
   <div id="message-container">
      <h1>인증서 전송이 완료되었습니다.</h1>
      <a href="/easycodingu/home"><h2>메인으로 돌아가기</h2></a>
   </div>
</div>

</body>
</html>