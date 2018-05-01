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
 
.cards {
   width: 250px;
    height: 250px;
    position: relative;
    transform-style: preserve-3d;
    border-radius: 10px;
    font-family: 'Jua', sans-serif;
    transition: all 1s ease-in-out;
    float: left;
    margin-left: 140px;
    margin-right: 20px;
    margin-top: 114px;
    margin-bottom: 50px;
}

.cards:hover {
   transform: rotatey(180deg);
}

.cards>div {
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
.cards .front {
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
.cards .back {
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

.cardsTop {
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

   <div class="cards">
      <div class="front">
         <header><h1>System.out.print</h1></header>
      </div>
      <div class="back">
         <ul>
            <h5>
               출력할 때 사용하는 문장입니다.
               Print는 내용을 계속 이어서 출력합니다
            </h5>
         </ul>
      </div>
   </div>
   <div class="cards">
      <div class="front">
         <header><h1>System.out.println</h1></header>
      </div>
      <div class="back">
         <ul>
            <h5>
               출력할 때 사용하는 문장입니다.
               Println은 내용을 다음줄로 자동으로 줄바꿈 합니다
            </h5>
         </ul>
      </div>
   </div>
</body>
</html>