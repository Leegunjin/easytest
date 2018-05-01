<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Contents414</title>
	<script type="text/javascript">
		
	</script>
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
			transition: all 1s ease-in-out;
			float: left;
			margin-left: 50px;
			margin-right: 20px;
			margin-top: 50px;
			margin-bottom: 50px;
		}
		.card:hover{
			transform: rotatey(180deg);
		}
		
		.card > div{
			width: 100%;
			height: 100%;
			background-color: #dce0e8;
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
			width: 100%;
			height: 100px;
			margin-bottom: 30px; 
			background-color: #37B595;
			position: relative;
			border-radius: 10px 10px 0 0;
		}
		.front header img{
			width: 100px;
			height: 100px;
			margin-top: 20px;
			border-radius: 50%;
		}
		.front p{
			padding: 10px 10px 5px;
			line-height: 1.2em;
		}
		.front span{
			font-weight: bold;
			color: #22a89f;
		}
		
		
		/* Back style */
		.card .back{
			z-index: 1;
			transform: rotateY(180deg);
			font-size: 20px;
			text-align: left;
			padding: 10px;
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
			font-weight: 300;
		} 
		
		.cardTop{
			font-size: 40px;
		}
		header{
			padding : 10px;
			font-size: 60px;
			font-weight: bold;
		}
	</style>
</head>
<body>
	
					<div class="fullContainer">
						<div class="card">
							<div class="front">
								<header>
									연속 if
								</header>
								<h2 class="cardTop">what</h2>
								<p></p>
								<span></span>
							</div>
							<div class="back" style="text-align: center">
								<br><br>
								if문을 <br>
								두 번 이상 <br>
								연속해서 <br>
								사용하는 것 <br>
							</div>
						</div>
						<div class="card">
							<div class="front">
								<header>
									연속 if
								</header>
								<h2 class="cardTop">when</h2>
								<p></p>
								<span></span>
							</div>
							<div class="back" style="text-align: center">
								<br><br>
								여러개의 <br>
								조건식이 <br>
								이어질 때 <br>
								사용<br>
							</div>
						</div>
						<div class="card">
							<div class="front">
								<header>
									연속 if
								</header>
								<h2 class="cardTop">how</h2>
								<p></p>
								<span></span>
							</div>
							<div class="back" >
								<br>
								if(조건식){<br>
									&nbsp;&nbsp;&nbsp;문장;<br>
								} <br>
								if(조건식){<br>
									&nbsp;&nbsp;&nbsp;문장;<br>
								} <br>
								<!-- if(조건식){<br>
									&nbsp;&nbsp;&nbsp;문장;<br>
								} -->
							</div>
						</div>
						
					</div>
					
					
</body>
</html>