<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<style type="text/css">
*{
         padding: 0;
         margin: 0;
         box-sizing: border-box;
      }
      
      body{
         perspective: 1000px;
      }
      
      .card{
         width: 200px;
         height: 250px;
         position: relative;
         transform-style: preserve-3d;
         border-radius: 10px;
         font-family: 'Jua', sans-serif;
         transition: all 1s ease-in-out;
         float: left;
         margin-left: 4px;
         margin-right: 20px;
         margin-top: 114px;
         margin-bottom: 50px;
      }
      .card:hover{
         transform: rotatey(180deg);
      }
      
      .card > div{
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
      .card .front{
         z-index: 2;
      }
      .front header{
         width: 100%
         font-family: 'Jua', sans-serif;;
         height: 100px;
         margin-bottom: 30px; 
         background-color: #37B595;
         position: relative;
         border-radius: 10px 10px 0 0;
      }
      .front header img{
         width: 100px;
         font-family: 'Jua', sans-serif;
         height: 100px;
         margin-top: 20px;
         border-radius: 50%;
      }
      .front p{
         padding: 10px 10px 5px;
         font-family: 'Jua', sans-serif;
         line-height: 1.2em;
      }
      .front span{
         font-weight: bold;
         font-family: 'Jua', sans-serif;
         color: #22a89f;
      }
      
      /* Back style */
      .card .back{
         z-index: 1;
         transform: rotateY(180deg);
         font-size: 20px;
         text-align: center;
         font-family: 'Jua', sans-serif;
         padding: 10px;
         /* font-family: sans-serif; */
         /* font-family: ‘NanumSquareRound’,sans-serif; */
      }
      
      .back ul{
         list-style: none;
         margin: 40px auto 0;
      }
      .back ul li{
         line-height: 1.5em;
         font-weight: bold;
         /* color: #22a89f; */
         
      }
      .back ul li span{
         color: #000;
         font-family: 'Jua', sans-serif;
         font-weight: 300;
      } 
      
      .cardTop{
      font-family: 'Jua', sans-serif;
         font-size: 40px;
      }
      header{
         padding : 10px;
         font-size: 60px;
         font-weight: bold;
         font-family: 'Jua', sans-serif;
      
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card">
					<div class="front">
						<header>
					<img src="../resources/img/plus.png" >
						</header>

					</div>
					<div class="back">
						<ul>
						
						<h3> 값을 더하거나 , 문자열을 더할 때 사용합니다. </h3>
						</ul>
					</div>
					
				</div>
				<div class="card">
					<div class="front">
						<header>
						<img src="../resources/img/minus.png" >
						</header>

					</div>
					<div class="back">
						<ul>
						
							<h3> 값을 뺄 때 사용합니다 . </h3>
						</ul>
					</div>
					
				</div>
				<div class="card">
					<div class="front">
						<header>
							<img src="../resources/img/multiply.png" >
						</header>

					</div>
					<div class="back">
						<ul>
						
							<h3> 값을 곱할 때 사용합니다 <br>Java에서는 * 로 사용합니다.</h3>
						</ul>
					</div>
					
				</div>
				<div class="card">
					<div class="front">
						<header>
							<img src="../resources/img/division.png" >
						</header>

					</div>
					<div class="back">
						<ul>
						
							<h3> 값을 나눌 때 사용합니다 <br>Java에서는 / 로 사용합니다.</h3>
						</ul>
					</div>
					</div>
					
</body>
</html>