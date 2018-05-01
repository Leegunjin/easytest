<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>contents411q</title>
	
	<style type="text/css">
		h1, h2, h3, h4, h5, h6{
			font-weight: 200;
		}
		 
		h1{
			text-align: center;
			padding-bottom: 10px;
			border-bottom: 2px solid #2fcc71;
			max-width: 40%;
			margin: 20px auto;
		}
		
		/* CONTAINERS */
		
		.container {max-width: 850px; width: 100%; margin: 0 auto;}
		.four { width: 32.26%; max-width: 32.26%;}
		
		
		/* COLUMNS */
		
		.col {
		  display: block;
		  float:left;
		  margin: 1% 0 1% 1.6%;
		}
		
		.col:first-of-type { margin-left: 0; }
		
		/* CLEARFIX */
		
		.cf:before,
		.cf:after {
		    content: " ";
		    display: table;
		}
		
		.cf:after {
		    clear: both;
		}
		
		.cf {
		    *zoom: 1;
		}
		
		/* FORM */
		
		.form .plan input, .form .payment-plan input, .form .payment-type input{
			display: none;
		}
		
		.form label{
			position: relative;
			color: #fff;
			background-color: #aaa;
			font-size: 26px;
			text-align: center;
			height: 150px;
			line-height: 150px;
			display: block;
			cursor: pointer;
			border: 3px solid transparent;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
		}
		
		.form .plan input:checked + label, .form .payment-plan input:checked + label, .form .payment-type input:checked + label{
			border: 3px solid #fff;
			background-color: #37B595;
		}
		
		.form .plan input:checked + label:after, form .payment-plan input:checked + label:after, .form .payment-type input:checked + label:after{
			content: "\2713";
			width: 40px;
			height: 40px;
			line-height: 40px;
			border-radius: 100%;
			border: 2px solid #fff;
			background-color: #37B595;
			z-index: 999;
			position: absolute;
			top: -10px;
			right: -10px;
		}
		
		.submit{
			padding: 15px 60px;
			display: inline-block;
			border: none;
			margin: 20px 0;
			background-color: #37B595;
			color: #fff;
			border: 2px solid #fff;
			font-size: 18px;
			-webkit-transition: transform 0.3s ease-in-out;
			-o-transition: transform 0.3s ease-in-out;
			transition: transform 0.3s ease-in-out;
		}
		
		.submit:hover{
			cursor: pointer;
			transform: rotateX(360deg);
		}
		
		.question{
			font-size: 30px;
			text-align: center;
			color: #232931;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			var resultStr = '';
			$('input').on('click', function() {
				
				var clickBtn = $(this).val();
				var clickAns = $(this).attr('answer');
		        var slideAns = $(this).parent().attr('answer');
		        
		        if (clickAns == slideAns) {
		        	resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"> </div>';
				}
			});
		});
	</script>
</head>
<body>
	<div>
		<p class="question">다음 중 정확한 if문을 고르세요.</p>
	</div>
	<br>
	<div class="container">
		<form class="form cf">
			<section class="plan cf" answer="if1">
				<input type="radio" name="radio1" id="if1" value="if1" answer="if1"><label class="free-label four col" for="if1">if(조건){ 실행문 }</label>
				<input type="radio" name="radio1" id="if2" value="if2" answer="if2"><label class="basic-label four col" for="if2">if(실행문){ 조건 }</label>
				<input type="radio" name="radio1" id="if3" value="if3" answer="if3"><label class="premium-label four col" for="if3">if{조건}( 실행문 )</label>
			</section>
		</form>
	</div>
</body>
</html>