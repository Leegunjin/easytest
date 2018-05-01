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
 
.cardb {
   width: 200px;
   height: 250px;
   position: relative;
   transform-style: preserve-3d;
   border-radius: 10px;
   font-family: 'Jua', sans-serif;
   transition: all 1s ease-in-out;
   float: left;
   margin-left: 157px;
   margin-right: 20px;
   margin-top: 114px;
   margin-bottom: 50px;
}

.cardb:hover {
   transform: rotatey(180deg);
}

.cardb>div {
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
.cardb .front {
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
.cardb .back {
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

.cardbTop {
   font-family: 'Jua', sans-serif;
   font-size: 40px;
}

header {
   padding: 10px;
   font-size: 60px;
   font-weight: bold;
   font-family: 'Jua', sans-serif;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
   <div class="cardb">
      <div class="front">
         <header><h1>중첩반복문이란?</h1></header>
      </div>
      <div class="back">
         <ul>
            <h5>
               반복문안에 다른 반복문이 실행될 수 있는데 바깥 반복문과 안쪽 반복문이 있습니다. 
               안쪽 반복문은 반복문이 한번 반복할 때 마다 새로 실행됩니다.
            </h5>
         </ul>
      </div>
   </div>
   <div class="cardb">
      <div class="front">
         <header><h1>
         중첩반복문 <br>실행 순서</h1></header>

      </div>
      <div class="back">
         <ul>
            <h5>
               for(i =0; i < 반복횟수; i++){
                 (반복 문장)
                 for(j=0; j < 반복횟수; j++){
                 (반복문장)
                 }<br>
                }
            </h5>
         </ul>
      </div>
   </div>
   
</body>
</html>