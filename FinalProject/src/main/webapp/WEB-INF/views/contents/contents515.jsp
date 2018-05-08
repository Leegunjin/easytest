<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
   rel="stylesheet">
<style type="text/css">
* {
   padding: 0;
   margin: 0;
   box-sizing: border-box;
}

body {
   perspective: 1000px;
}
 
.card4 {
   width: 200px;
   height: 250px;
   position: relative;
   transform-style: preserve-3d;
   border-radius: 10px;
   font-family: 'Jua', sans-serif;
   transition: all 1s ease-in-out;
   float: left;
   margin-left: 66px;
   margin-right: 20px;
   margin-top: 114px;
   margin-bottom: 50px;
}

.card4:hover {
   transform: rotatey(180deg);
}

.card4>div {
   width: 90%;
   height: 90%;
   background-color: #dce0e8;
   font-family: 'Jua', sans-serif;
   text-align: center;
   position: absolute;
   top: 0;
   left: 0;
   backface-visibility: hidden;
   border-radius: 10px;
}

/* Front style */
.card4 .front {
   z-index: 2;
}

.front header {
   width: 100% font-family: 'Jua', sans-serif;;
   height: 100px;
   margin-bottom: 30px;
   background-color: #37B595;
   position: relative;
   border-radius: 10px 10px 0 0;
}

.front header img {
   width: 100px;
   font-family: 'Jua', sans-serif;
   height: 100px;
   margin-top: 20px;
   border-radius: 50%;
}

.front p {
   padding: 10px 10px 5px;
   font-family: 'Jua', sans-serif;
   line-height: 1.2em;
}

.front span {
   font-weight: bold;
   font-family: 'Jua', sans-serif;
   color: #22a89f;
}

/* Back style */
.card4 .back {
   z-index: 1;
   transform: rotateY(180deg);
   font-size: 20px;
   text-align: center;
   font-family: 'Jua', sans-serif;
   padding: 10px;
   /* font-family: sans-serif; */
   /* font-family: ‘NanumSquareRound’,sans-serif; */
}

.back ul {
   list-style: none;
   margin: 40px auto 0;
}

.back ul li {
   line-height: 1.5em;
   font-weight: bold;
   /* color: #22a89f; */
}

.back ul li span {
   color: #000;
   font-family: 'Jua', sans-serif;
   font-weight: 300;
}

.card4Top {
   font-family: 'Jua', sans-serif;
   font-size: 40px;
}

header {
   padding: 10px;
   font-size: 60px;
   font-weight: bold;
   font-family: 'Jua', sans-serif;
}
.img1{
  width: 182px;
    margin-top: -50px;
    margin-left: -12px;
    height: 225px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
   <div class="card4">
      <div class="front">
         <header>
         <h1> While문이란? </h1>
         </header>
      </div>
      <div class="back">
         <ul>
            <h5>
               조건식이 참(True)이면 문장들의 블록을 반복적으로 실행합니다.
            </h5>
         </ul>
      </div>
   </div>
   <div class="card4">
      <div class="front">
         <header>
         <h1>While문 실행  <br>순서</h1>
         </header>

      </div>
      <div class="back">
         <ul>
            <h5>
               while (조건식) {
                     (문장)
               }
            </h5>
         </ul>
      </div>
   </div>
   <div class="card4">
      <div class="front">
         <header>
         <h1>While문 실행 <br>순서</h1>
         </header>
   </div>
      <div class="back">
         <ul>
            <li>
               <img alt="" src="../resources/img/while.png" width="200px;" height="200px;" class="img1">
            </li>
         </ul>
      </div>
   </div>
</body>
</html>