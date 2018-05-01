<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
   <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
   <style type="text/css">
   	/* @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
	body        { font-family: 'NanumSquareRound', sans-serif; }
	.normal     { font-weight: 400 }
	.bold       { font-weight: 700 }
	.bolder     { font-weight: 800 }
	.light      { font-weight: 300 } */
   
   
   * {
   		font-family: 'Jua', sans-serif;
   }
   
	h2{
	  color: #393E46; 
	  font-family: 'Jua', sans-serif;
	  font-size: 40px;
	  margin: 0px 0 0 10px;
	  white-space: nowrap;
	  /* overflow: hidden; */
	  width: 30em;
	  animation: type 1s steps(40, end); 
	  margin-left: 20%;
	}
	
	h2:nth-child(2){
	  animation: type2 2s steps(60, end);
	}
	
	h2 a{
	  color: lime;
	  text-decoration: none;
	}
	
	span{
	  animation: blink 1s infinite;
	}
	
	@keyframes type{ 
	  from { width: 0; } 
	} 
	
	@keyframes type2{
	  0%{width: 0;}
	  50%{width: 0;}
	  100%{ width: 100; } 
	} 
	
	@keyframes blink{
	  to{opacity: .0;}
	}
	
	::selection{
	  background: black;
	}
   		/* .alert {
		    padding: 20px;
		    background-color: #f44336;
		    color: white;
		    opacity: 1;
		    transition: opacity 0.6s;
		    margin-bottom: 15px;
		}
		
		.alert.success {background-color: #4CAF50;}
		.alert.info {background-color: #2196F3;}
		.alert.warning {background-color: #ff9800;}
		
		.closebtn {
		    margin-left: 15px;
		    color: white;
		    font-weight: bold;
		    float: right;
		    font-size: 22px;
		    line-height: 20px;
		    cursor: pointer;
		    transition: 0.3s;
		}
		
		.closebtn:hover {
		    color: black;
		} */
   
      .home {
         margin-bottom: 10px;
         margin-left: 20px;
      }
      
      .javaCode {
         margin-left: 170px;
         margin-top: 10px;
      }
      
      .error {
         margin-left: 20px;
         margin-bottom: 30px;
      }
      
      .next {
         margin-left: 170px;
         margin-bottom: 30px;
      }
      
      .boxImg{
      	margin-left: 34%;
      }
      
      #answer0{
      	margin-left: 25%;
      }
      #answer1{
      	margin-left: 25%;
      }
      #answer2{
      	margin-left: 25%;
      }
      #cubeContainer{
      	margin-left: 25%;
      	font-weight: bold;
      	font-size: 30px;
      }
     
     [class^="answer"] {
	      margin: 0; 
	      padding: 0;
	      background-color: #f3fafd; 
	      border: solid 2px #217093; 
	      border-radius: 4px; 
	      box-sizing: border-box;
	      width: 45px; 
	      height: 45px;
	      text-align: center;
	      font-size: 18pt; 
	      color: #353538; 
	      font-weight: 600;
	      font-style: inherit;
	  }

	.errorReasonDiv{
		font-size: 14pt; 
      	color: #37B595; 
      	font-weight: bold;
	}
     /*  .answer {
         margin: 0; 
         padding: 0;
         background-color: #f3fafd; 
         border: solid 2px #217093; 
         border-radius: 4px; 
         box-sizing: border-box;
         width: 600px; 
         height: 50px;
         text-align: center;
         font-size: 20pt; 
         color: #353538; 
         font-weight: 600;
         font-style: inherit;
      } */
      
      .answer{
			margin: 0;
			width: 400px;
			height: 50px;
			font-size: large;
		}
      	
      	.answerShort{
      		margin: 0; 
		      padding: 0;
		      background-color: #f3fafd; 
		      border: solid 2px #217093; 
		      border-radius: 4px; 
		      box-sizing: border-box;
		      width: 80px; 
		      height: 60px;
		      text-align: center;
		      font-size: 18pt; 
		      color: #353538; 
		      font-weight: 600;
		      font-style: inherit;
      	}
      	
         @charset "UTF-8";
      *, html, body {
        font-family: 'Jua', sans-serif;
      }
      
      * {
        -webkit-box-sizing: border-box;
                box-sizing: border-box;
      }
      
      h1, h2, h4 {
        text-align: center;
      }
      
      
      
      h1 {
        font-size: 24px;
        line-height: 30px;
        font-weight: bold;
      }
      
      h2 {
        font-size: 18px;
        line-height: 25px;
        margin-top: 20px;
        margin-left: -15px;
      }
      
      button {
        -webkit-appearance: none;
           -moz-appearance: none;
                appearance: none;
        border: 0;
        padding: 14px 50px;
        border-radius: 4px;
        background-color: #37B595;
        color: #FFFFFF;
        text-transform: capitalize;
        font-size: 18px;
        line-height: 22px;
        outline: none;
        cursor: pointer;
        -webkit-transition: all 0.2s;
        transition: all 0.2s;
      }
      button:hover {
        background-color: #1A7F75;
      }
      button.previous {
        background-color: #A2ACAF;
      }
      button.previous:hover {
        background-color: #5A5F61;
      }
      
      .full-width-container {
        width: 100%;
        min-width: 320px;
      }
      
      .sized-container {
        max-width: 900px;
        width: 100%;
        margin: 0 auto;
      }
      
      .slide-container {
        position: relative;
        left: 0;
        overflow: hidden;
        height: 400px;
      }
      
      .slide {
        float: left;
      }
      .slide .sized-container {
        padding: 10px 25px;
      }
      
      .button-container {
        border-top: 1px solid black;
        overflow: hidden;
        padding-top: 30px;
      }
      .button-container button {
        float: right;
        margin-left: 30px;
      }
      
      .pagination-container {
        margin-top: 120px;
      }
      
      .pagination {
        width: 100%;
        text-align: center;
        padding: 0 25px;
      }
      
      .indicator {
        width: 25px;
        height: 25px;
        border: 4px solid lightgray;
        border-radius: 50%;
        display: inline-block;
        -webkit-transition: all 0.3s;
        transition: all 0.3s;
        position: relative;
      }
      .indicator .tag {
        position: absolute;
        top: -30px;
        left: 50%;
        -webkit-transform: translateX(-50%);
                transform: translateX(-50%);
        color: lightgray;
        white-space: nowrap;
      }
      .indicator.active, .indicator.complete {
        border-color: #37B595;
      }
      .indicator.active .tag, .indicator.complete .tag {
        color: #37B595;
      }
      .indicator.complete:after {
        content: "✓";
        position: absolute;
        color: #37B595;
        left: 4px;
        top: 3px;
        font-size: 14px;
      }
      
      .progress-bar-container {
        width: 10%;
        height: 4px;
        display: inline-block;
        background-color: lightgray;
        position: relative;
        top: -10px;
      }
      .progress-bar-container:last-of-type {
        display: none;
      }
      .progress-bar-container .progress-bar {
        width: 0;
        height: 100%;
        background-color: #37B595;
      }
      
      ul{
         list-style:none;
         padding-left:0px;
      }
      
      #showDiv{
      	background-color: #37B595;
      }
      /* 돌아가는박스 */
      .box_wrapper {
        position: absolute;
        top: 75%;
        left: 93%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
      }
      .box {
        margin: auto;
        position: relative;
        height: 200px;
        width: 200px;
        -webkit-transform-style: preserve-3d;
        -moz-transform-style: preserve-3d;
        -o-transform-style: preserve-3d;
        -ms-transform-style: preserve-3d;
        transform-style: preserve-3d;
        -webkit-animation: rotate 20s infinite linear;
        -moz-animation: rotate 20s infinite linear;
        -o-animation: rotate 20s infinite linear;
        -ms-animation: rotate 20s infinite linear;
        animation: rotate 20s infinite linear;
      }
      .box > div {
        position: absolute;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        height: 50%;
        width: 50%;
        opacity: 0.8;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=80)";
        filter: alpha(opacity=80);
        background-color: #37B595;
        border: solid 1px #eee;
        -webkit-transition: -webkit-transform 0.2s ease-in;
        -moz-transition: -moz-transform 0.2s ease-in;
        -o-transition: -o-transform 0.2s ease-in;
        -ms-transition: -ms-transform 0.2s ease-in;
        transition: transform 0.2s ease-in;
      }
      .front {
        /* -webkit-transform: translateZ(100px); */
        -webkit-transform: translateZ(50px);
        -moz-transform: translateZ(50px);
        -o-transform: translateZ(50px);
        -ms-transform: translateZ(50px);
        transform: translateZ(0px);
      }
      .back {
        -webkit-transform: translateZ(-100px) rotateY(180deg);
        -moz-transform: translateZ(-100px) rotateY(180deg);
        -o-transform: translateZ(-100px) rotateY(180deg);
        -ms-transform: translateZ(-100px) rotateY(180deg);
        transform: translateZ(-100px) rotateY(180deg);
      } 
      /* .back {
        -webkit-transform: translateZ(-50px) rotateY(90deg);
        -moz-transform: translateZ(-50px) rotateY(90deg);
        -o-transform: translateZ(-50px) rotateY(90deg);
        -ms-transform: translateZ(-50px) rotateY(90deg);
        transform: translateZ(-50px) rotateY(90deg);
      } */
      .right {
        -webkit-transform: rotateY(-270deg) translateX(100px);
        -moz-transform: rotateY(-270deg) translateX(100px);
        -o-transform: rotateY(-270deg) translateX(100px);
        -ms-transform: rotateY(-270deg) translateX(100px);
        transform: rotateY(-270deg) translateX(100px);
        -webkit-transform-origin: top right;
        -moz-transform-origin: top right;
        -o-transform-origin: top right;
        -ms-transform-origin: top right;
        transform-origin: top right;
      }
      .left {
        -webkit-transform: rotateY(270deg) translateX(-100px);
        -moz-transform: rotateY(270deg) translateX(-100px);
        -o-transform: rotateY(270deg) translateX(-100px);
        -ms-transform: rotateY(270deg) translateX(-100px);
        transform: rotateY(270deg) translateX(-100px);
        -webkit-transform-origin: center left;
        -moz-transform-origin: center left;
        -o-transform-origin: center left;
        -ms-transform-origin: center left;
        transform-origin: center left;
      }
      .top {
        -webkit-transform: rotateX(-270deg) translateY(-100px);
        -moz-transform: rotateX(-270deg) translateY(-100px);
        -o-transform: rotateX(-270deg) translateY(-100px);
        -ms-transform: rotateX(-270deg) translateY(-100px);
        transform: rotateX(-270deg) translateY(-100px);
        -webkit-transform-origin: top center;
        -moz-transform-origin: top center;
        -o-transform-origin: top center;
        -ms-transform-origin: top center;
        transform-origin: top center;
      }
      .bottom {
        -webkit-transform: rotateX(270deg) translateY(100px);
        -moz-transform: rotateX(270deg) translateY(100px);
        -o-transform: rotateX(270deg) translateY(100px);
        -ms-transform: rotateX(270deg) translateY(100px);
        transform: rotateX(270deg) translateY(100px);
        -webkit-transform-origin: bottom center;
        -moz-transform-origin: bottom center;
        -o-transform-origin: bottom center;
        -ms-transform-origin: bottom center;
        transform-origin: bottom center;
      }
      .box_wrapper:hover .front {
        -webkit-transform: translateZ(200px);
        -moz-transform: translateZ(200px);
        -o-transform: translateZ(200px);
        -ms-transform: translateZ(200px);
        transform: translateZ(100px);
      }
      /* .box_wrapper:hover .front {
        -webkit-transform: translateZ(100px);
        -moz-transform: translateZ(100px);
        -o-transform: translateZ(100px);
        -ms-transform: translateZ(100px);
        transform: translateZ(100px);
      } */
      .box_wrapper:hover .back {
        -webkit-transform: translateZ(-200px) rotateY(180deg);
        -moz-transform: translateZ(-200px) rotateY(180deg);
        -o-transform: translateZ(-200px) rotateY(180deg);
        -ms-transform: translateZ(-200px) rotateY(180deg);
        transform: translateZ(-200px) rotateY(180deg);
      }
      .box_wrapper:hover .right {
        -webkit-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        -moz-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        -o-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        -ms-transform: rotateY(-270deg) translateZ(100px) translateX(100px);
        transform: rotateY(-270deg) translateZ(100px) translateX(100px);
      }
      .box_wrapper:hover .left {
        -webkit-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        -moz-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        -o-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        -ms-transform: rotateY(270deg) translateZ(100px) translateX(-100px);
        transform: rotateY(270deg) translateZ(100px) translateX(-100px);
      }
      .box_wrapper:hover .top {
        -webkit-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        -moz-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        -o-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        -ms-transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
        transform: rotateX(-270deg) translateZ(100px) translateY(-100px);
      }
      .box_wrapper:hover .bottom {
        -webkit-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        -moz-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        -o-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        -ms-transform: rotateX(270deg) translateZ(100px) translateY(100px);
        transform: rotateX(270deg) translateZ(100px) translateY(100px);
      }
      @-moz-keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      @-webkit-keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      @-o-keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      @keyframes rotate {
        from {
          -webkit-transform: rotateX(0deg) rotateY(0deg);
          -moz-transform: rotateX(0deg) rotateY(0deg);
          -o-transform: rotateX(0deg) rotateY(0deg);
          -ms-transform: rotateX(0deg) rotateY(0deg);
          transform: rotateX(0deg) rotateY(0deg);
        }
        to {
          -webkit-transform: rotateX(360deg) rotateY(360deg);
          -moz-transform: rotateX(360deg) rotateY(360deg);
          -o-transform: rotateX(360deg) rotateY(360deg);
          -ms-transform: rotateX(360deg) rotateY(360deg);
          transform: rotateX(360deg) rotateY(360deg);
        }
      }
      
      
      /* resultMsg */
	.resultMsg{
	 /* position:fixed; */
	 /* top:50vh; */
	 margin-top:-10px;
	 /* left:50vw; */
	 /* margin-left:-78px; */
	 display:inline-block;
	 text-align:center;
	 /* background-color:yellow; */
	 /* padding:40px; */
	 font-size:30px;
	 /* border-radius:100px; */
	  transition:all 1s;
	  -webkit-transition:all 1s;
	}
	
	.resultMsg:hover{
	  /* background-color:#00FFFF; */
	  /* cursor:pointer; */
	}
	/* Gestion des évenements */
	
	.resultMsg:hover ~.errorReasonDiv
	{
	  /* margin-left:45px;
	  margin-top:-220px;
	  opacity:1; */
	}
	
	.errorReasonDiv{
	  position:fixed;
	  left:50vw;
	  margin-left:35px;
	  top:50vh;
	  margin-top:-210px;
	  opacity:0;
	  transition:all 1s;
	  -webkit-transition:all 1s;
	}
	
	
	.errorReasonDiv div
	{
	  width:120px;
	  font-size:20px;
	}
	
	.errorReasonDiv div
	{
	  padding:50px;
	  background-color:black;
	  border-radius:40px;
	  color:white;
	  text-align:center;
	}
	
	.page-wrapper{
	  width:100%;
	  height:100%;
	  /* background:url(https://i.imgur.com/2ZgHKbQ.jpg) center no-repeat; */
	  /* background-size:cover; */
	}
	a.btn{
	  width:150px;
	  height:50px;
	  display:block;
	  margin:-25px 0 0 -75px;
	  position:absolute;
	  top:86.5%; left:42%;
	  font:1.125em 'Arial', sans-serif;
	  font-weight:700;
	  text-align:center;
	  text-decoration:none;
	  color:#fff;
	  border-radius:5px;
	  background:rgba(217,67,86,1);
	  font-size: 30px;
	  padding-top: 10px;
	}
	
	.modal-wrapper{
	  width:100%;
	  height:100%;
	  position:fixed;
	  top:0; left:0;
	  /* background:rgba(255,257,153,0.75); */
	  visibility:hidden;
	  opacity:0;
	  -webkit-transition: all 0.25s ease-in-out;
	  -moz-transition: all 0.25s ease-in-out;
	  -o-transition: all 0.25s ease-in-out;
	  transition: all 0.25s ease-in-out;
	}
		
	.modal-wrapper.open{
	  opacity:1;
	  visibility:visible;
	}
	
	.modal{
	  width:600px;
	  height:400px;
	  display:block;
	  margin:50% 0 0 -300px;
	  position:relative;
	  top:50%; left:50%;
	  background:#EEEEEE;
	  opacity:0;
	  -webkit-transition: all 0.5s ease-in-out;
	  -moz-transition: all 0.5s ease-in-out;
	  -o-transition: all 0.5s ease-in-out;
	  transition: all 0.5s ease-in-out;
	}
	
	.modal-wrapper.open .modal{
	  margin-top:-200px;
	  opacity:1;
	}
	
	.head1{
	  width:100%;
	  height:40px;
	  padding:1.5em 5%;
	  overflow:hidden;
	  /* background:#01bce5; */
	  background-color: rgba(217,67,86,1);
	  font-size: 40px;
	  font-family:  'Jua', sans-serif;
	  color: white;
	}
	
	.btn-close{
	  width:32px;
	  height:32px;
	  display:block;
	  float:right;
	}
	
	.btn-close::before, .btn-close::after{
	  content:'';
	  width:32px;
	  height:6px;
	  display:block;
	  background:#fff;
	}
	
	.btn-close::before{
	  margin-top:12px;
	  -webkit-transform:rotate(45deg);
	  -moz-transform:rotate(45deg);
	  -o-transform:rotate(45deg);
	  transform:rotate(45deg);
	}
	
	.btn-close::after{
	  margin-top:-6px;
	  -webkit-transform:rotate(-45deg);
	  -moz-transform:rotate(-45deg);
	  -o-transform:rotate(-45deg);
	  transform:rotate(-45deg);
	}
	
	#contentErrDiv{
		font-family: 'Jua', sans-serif;
		font-size: 20px;
		color: #393E46;
		padding-left: 5%;
		padding-top: 5%;
	}
	
	#loading {
		 width: 100%;  
		 height: 100%;  
		 top: 0px;
		 left: 0px;
		 position: fixed;  
		 display: block;  
		 opacity: 0.7;  
		 background-color: #fff;  
		 z-index: 99;  
		 text-align: center; 
	} 
	  
	#loading-image {  
		 position: absolute;  
		 top: 50%;  
		 left: 50%; 
		 z-index: 100; 
	 }


	/* hint */
		.hint {
		  text-align: center;
		  margin: -50px 630px;
		  position: relative;
		  height: 46px;
		  width: 60px;
		  background: #37B595;
		  border-radius: 3px;
		  text-align: center;
		  line-height: 50px;
		  font-size: 20px;
		  font-weight: 900;
		  color: #FFF;
		  box-shadow: 0 2px 3px rgba(0, 0, 0, 0.4);
		  transition: all 150ms ease-in-out;
		  cursor: pointer;
		}
		.hint:hover {
		  text-align: center;
		  background: #FFF;
		  color: #37B595;
		  -webkit-transform: translateY(2px);
		          transform: translateY(2px);
		  box-shadow: none;
		}
		.hint:hover .hintModal {
		  text-align: center;
		  margin-bottom: 20px;
		  -webkit-transform: translateX(-50%) translateY(0) rotate(0deg);
		          transform: translateX(-50%) translateY(0) rotate(0deg);
		  opacity: 1;
		}
		.hint .hintModal {
		  position: absolute;
		  bottom: 100%;
		  margin-bottom: 18px;
		  left: 50%;
		  -webkit-transform: translateX(-50%) translateY(5px) rotate(180deg);
		          transform: translateX(-50%) translateY(5px) rotate(180deg);
		  -webkit-transform-origin: bottom;
		          transform-origin: bottom;
		  height: 150px;
		  padding: 50px;
		  width: 200px;
		  text-align: center;
		  background: #EEEEEE;
		  color : #393E46;
		  border-radius: 10px;
		  transition: all 150ms ease-in-out;
		  font-size: 16px;
		  font-weight: 300;
		  line-height: 1.5;
		  display: flex;
		  align-items: center;
		  opacity: 0;
		  pointer-events: none;
		}
		.hint .hintModal::before {
		  text-align: center;
		  content: "";
		  position: absolute;
		  height: 0;
		  width: 0;
		  border-left: 14px solid transparent;
		  border-right: 14px solid transparent;
		  border-top: 12px solid #EEEEEE;
		  top: 100%;
		  left: 50%;
		  -webkit-transform: translateX(-50%);
		          transform: translateX(-50%);
		}


		/* loading */
		.loader-ring {
		  top: calc(50% - 5px);
		  left: calc(50% - 5px);
		}
		/* Demo specific styles end */
		
		/* Loader ring with 6 dots */
		.loader-ring, .loader-ring:before, .loader-ring:after {
		  display: inline-block;
		  width: 15px;
		  height: 40px;
		  line-height: 80px;
		  transform-origin: 8px 0px;
		  color: teal;
		  font-size: 40px;
		  font-family: "Times New Roman";
		  position: absolute;
		  z-index: 100000;
		  content: '•';
		}
		.loader-ring:before, .loader-ring:after {
		  opacity: 0;
		  text-shadow: 12px -2px 0px teal, -12px -2px 0px teal;
		  transform: rotateZ(0deg);
		  animation: loading 4s cubic-bezier(.15,.65,.85,.35) infinite, loading-shadow 2s cubic-bezier(.25,.75,.35,1) infinite alternate, loading-opacity 1s infinite;
		}
		.loader-ring:after {
		  animation-delay: 1.35s;
		}
		@keyframes loading {
		  to {
		    transform: rotateZ(360deg);
		  }
		}
		@keyframes loading-shadow {
		  from {
		    text-shadow: 35px -15px 0px teal, -35px -15px 0px teal;
		  }
		}
		@keyframes loading-opacity {
		  from {
		    opacity: 1;
		  }
		  to {
		    opacity: 1;
		  }
		}
	</style>
	<script type="text/javascript">
   $(function() {
      var currentSlide = 0;
      var testCount = 0;
      
      var checkStr = '<button class="check">CHECK</button>';
      $('#checkBtnDiv').html(checkStr);
      
       $slideContainer = $('.slide-container'),
       $slide = $('.slide'),
       slideCount = $slide.length,
       animationTime = 300;

      function setSlideDimensions () {
        var windowWidth = $(window).width();
        $slideContainer.width(windowWidth * slideCount);
        $slide.width(windowWidth);
      }
   
      function generatePagination () {
        var $pagination = $('.pagination');
        for(var i = 0; i < slideCount; i ++){
          var $indicator = $('<div>').addClass('indicator'),
              $progressBarContainer = $('<div>').addClass('progress-bar-container'),
              $progressBar = $('<div>').addClass('progress-bar'),
              indicatorTagText = $slide.eq(i).attr('data-tag'),
              $tag = $('<div>').addClass('tag').text(indicatorTagText);
          $indicator.append($tag);
          $progressBarContainer.append($progressBar);
          $pagination.append($indicator).append($progressBarContainer);
        }
        $pagination.find('.indicator').eq(0).addClass('active');
      }
      
      var count = 0;
      $('.check').on('click', goToCheck);
      
      function goToCheck() {
            var test = null;
    	    var cNum = currentSlide + 1;
            var userAnswer = null;
            /* var loader = '<div class="loader-ring"></div>';
            $('.loaderDiv').html(loader); */
            
            var loaderGif = '<div id="loading" style="width : 20px; position: absolute; top:35%; left:40%; text-align:center;">';
            loaderGif += '<div class="loading_box"><img src="<c:url value="../resources/img/loader.gif"/>" style="width: 300px"/></div></div>';
            $('body').fadeTo( "slow", 1).append(loaderGif);
            
            if (cNum == 4) {
            	userAnswer = $('#answer31').val() +"/"+ $('#answer32').val() +"/"+ $('#answer33').val();
			} else {
            	userAnswer = $('#answer'+currentSlide).val();
			}
            if (userAnswer == "") {
				alert("답을 입력해 주세요");
				return;
			}
                  $.ajax({
                     url : "contents71",
                     type : "POST",
                     data : {
                        cNum : cNum,
                        userAnswer : userAnswer  
                     },
                     success : function(resultMap) {
                    	$('body').fadeTo( "slow", 1).find('#loading').remove(); 
                    	
                    	var err = resultMap.errorReason;
                        var resultStr = '';
                        /* $('.loaderDiv').html(""); */
                        if (resultMap.result == false) {
                        	count = count + 1;
                        	//alert("count : " + count + " / cNum : "+cNum);
                        	//alert("count : "+count);
                        	if (count == 3) {
                        		//alert("count == 3 진입");
                        		
								if (cNum == 1) {
									//alert("cNum : " + cNum);
									//alert("count ok, cnum ok");
									var intHintStr1 = '<div class="hint">HINT!<div class="hintModal">int형의 선언은 <br>int test = 1;과<br> 같습니다.</div></div>';
									$('.hintDiv').html(intHintStr1);
								} 
								if (cNum == 2) {
									//alert("cNum : " + cNum);
									//alert("count ok, cnum ok");
									var intHintStr2 ='<div class="hint">HINT!<div class="hintModal">int형은 숫자 중 1, 2, 3, ...<br> 같은 정수만 사용할 수 <br>있습니다.</div></div>';
									$('.hintDiv').html(intHintStr2);
								}
								if (cNum == 3) {
									//alert("cNum : " + cNum);
									//alert("count ok, cnum ok");
									var intHintStr3 ='<div class="hint">HINT!<div class="hintModal">변수명 규칙을 다시 떠올려 보세요!</div></div>';
									$('.hintDiv').html(intHintStr3);
								}
								if (cNum == 4) {
									//alert("cNum : " + cNum);
									//alert("count ok, cnum ok");
									var intHintStr4 ='<div class="hint">HINT!<div class="hintModal">지금까지 입력한 변수명들을 <br>잘 기억해 보세요!</div></div>';
									$('.hintDiv').html(intHintStr4);
								}
							}
		                	resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
		                	resultStr += '<div class="errorReasonDiv">'+resultMap.errorReason+'</div>';
		                	resultStr += '<div class="page-wrapper">';
		                	resultStr += '<a class="btn trigger" href="javascript:;">Error</a>';
		                	resultStr += '</div>';
		                    var temp = resultMap.errorReason;
		                    console.log(temp);
		                    $('#answerResultDiv').html(resultStr);
                      	} else if (resultMap.result == true) {
	                        resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"> </div>';
	                        $('#answerResultDiv').html(resultStr);
	                        $('#checkBtnDiv').html("");
	                        var str = '<button class="next">next</button>';
	                        $('.hintDiv').html("");
	                        count = 0;
                      	}
                        $('.trigger').click(function() {
	                        $('.modal-wrapper').toggleClass('open');
	                        $('.page-wrapper').toggleClass('blur');
	                        return false;
	                     });
                        var userAnswerFull = resultMap.userAnswerFull;
                        var errTxt = '';
                        $.each(err , function( i, val ) {
                        	errTxt += '✔  '+val + '<br>'; 
                    	});
                        
                        $('.head1').html('입력한 답 : '+userAnswerFull);
                        $('.head1').val('입력한 답 : '+userAnswerFull);
                        $('.content').html(errTxt);
                        $('.content').val(errTxt);
                        
                        /* $('.content').html(err);
                        $('.content').val(err); */
                        
                        $('#nextBtnDiv').html(str);
	                    $('.next').on('click', goToNextSlide);
	                    /* $('.trigger').click(function() {
	                        $('.modal-wrapper').toggleClass('open');
	                        $('.page-wrapper').toggleClass('blur');
	                        return false;
	                     }); */
                     },
                     error : function(err) {
                        console.log(err);
                        alert("fail");
                     }
                     
                });
         //} 
                  $('.trigger').click(function() {
                      $('.page-wrapper').toggleClass('blur');
                   });
      }
   
      function goToNextSlide () {
        $('#answerResultDiv').html("");
        if(currentSlide >= slideCount - 1){
          location.href = "clearChapter?c_num=711";
        }
        var windowWidth = $(window).width();
        currentSlide++;
        $slideContainer.animate({
          left: -(windowWidth * currentSlide)
        });
        setActiveIndicator();
        $('.progress-bar').eq(currentSlide - 1).animate({
          width: '100%'
        }, animationTime);
        $('#checkBtnDiv').html(checkStr);
        $('#nextBtnDiv').html("");
        $('.check').on('click', goToCheck);
        
      }
   
      function goToPreviousSlide () {
        if(currentSlide <= 0) return; 
        var windowWidth = $(window).width();
        currentSlide--;
        $slideContainer.animate({
          left: -(windowWidth * currentSlide)
        }, animationTime);
        setActiveIndicator();
        $('.progress-bar').eq(currentSlide).animate({
          width: '0%'
        }, animationTime);
      }
   
      function postitionSlides () {
        var windowWidth = $(window).width();
        setSlideDimensions();
        $slideContainer.css({
          left: -(windowWidth * currentSlide)
        }, animationTime);
      }
   
      function setActiveIndicator () {
        var $indicator = $('.indicator');
        $indicator.removeClass('active').removeClass('complete');
        $indicator.eq(currentSlide).addClass('active');
        for(var i = 0; i < currentSlide; i++){
          $indicator.eq(i).addClass('complete');
        }
      }
   
      setSlideDimensions();
      generatePagination();
      $(window).resize(postitionSlides);
      
      $('.previous').on('click', goToPreviousSlide);
      
      
      /* $(window).load(function() {    
    	     $('#loading').hide();  
      }); */

   });
   
   </script>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Trophy Quiz</title>
</head>
<body style="overflow-x:hidden"> 
<div class="pagination-container full-width-container">
  <div class="sized-container">
    <div class="pagination"></div>
  </div>
</div>
<div class="viewport full-width-container">
  <ul class="slide-container">
    <li class="slide" data-tag="Step1" id="slide1">
      <div class="sized-container">
      	<div class="loaderDiv"></div>
        <!-- <h2 style="font-size: 30px" class="question"> 가로, 세로, 높이의 길이가 모두 같은 상자가 있습니다.</h2>  -->
        <h2 style="font-size: 30px">상자의 '가로' 길이에 대해 자유롭게 변수명과 값을 정해보세요. </h2>
        <!-- <p class="question">가로, 세로, 높이의 길이가 모두 같은 상자가 있습니다.</p> -->
        <br>
        <!-- <div id="loading"><img id="loading-image" src="/images/loading.gif" alt="Loading..." /></div> -->
        <img src="../resources/img/cube5.png" width="250px" class="boxImg"><br>
        <div class="modal-wrapper">
		  <div class="modal">
		    <div class="head1" style="font-size: 40px">
		      Error Check
		      <a class="btn-close trigger" href="javascript:;"></a>
		    </div>
		    <div class="content" id="contentErrDiv">
		    </div>
		  </div>
		</div>
        <div id="container">
        	<div id="input"></div>
        	<input type="text" id="answer0" class="answer" placeholder="ex) int 가로 = 5;"><div class="hintDiv"></div>
        </div>
        <div class="box_wrapper">
         </div>
        <br><br><br>
      </div>
    </li>
    <li class="slide" data-tag="Step2">
      <div class="sized-container">
        <!-- <h1></h1> -->
        <h2 style="font-size: 30px" class="question">상자의 '세로' 길이에 대해 자유롭게 변수명과 값을 정해보세요. </h2>
        <!-- <h2 style="font-size: 30px" class="question">단, 세로는 가로와 길이가 같습니다. </h2> -->
        <br>
        <img src="../resources/img/cube5.png" width="250px" class="boxImg">
        <input type="text" id="answer1" class="answer" placeholder="ex) int 세로 = 5;"><div class="hintDiv"></div> 
        <div class="modal-wrapper">
		  <div class="modal">
		    <div class="head1" style="font-size: 40px">
		      Error Check
		      <a class="btn-close trigger" href="javascript:;"></a>
		    </div>
		    <div class="content" id="contentErrDiv">
		    </div>
		  </div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step3">
      <div class="sized-container">
        <h2 style="font-size: 30px" class="question">상자의 '높이' 길이에 대해 자유롭게 변수명과 값을 정해보세요. </h2><br>
        <!-- <h2 style="font-size: 30px" class="question">단, 높이는 가로, 세로와 값이 같습니다. </h2> -->
        <img src="../resources/img/cube5.png" width="250px" class="boxImg">
        <input type="text" id="answer2" class="answer" placeholder="ex) int 높이 = 5;"><div class="hintDiv"></div> 
        <div class="modal-wrapper">
		  <div class="modal">
		    <div class="head1" style="font-size: 40px">
		      Error Check
		      <a class="btn-close trigger" href="javascript:;"></a>
		    </div>
		    <div class="content" id="contentErrDiv">
		    </div>
		  </div>
		</div>
      </div>
    </li>
    <li class="slide" data-tag="Step4">
      <div class="sized-container">
        <h2  style="font-size: 30px" class="question">상자를 만들기 위해 지금까지 입력한 </h2>
        <h2  style="font-size: 30px" class="question">가로, 세로, 높이 변수를 곱해서 cube 변수에 담아주세요.</h2>
        <!-- 가로*세로*높이 -->
        <div class="modal-wrapper">
		  <div class="modal">
		    <div class="head1" style="font-size: 40px">
		      Error Check
		      <a class="btn-close trigger" href="javascript:;"></a>
		    </div>
		    <div class="content" id="contentErrDiv">
		    </div>
		  </div>
		</div>
        <br><br><br><br>
        <div id="cubeContainer" >
	        int cube = 
	        <input type="text" id="answer31" class="answerShort" placeholder="가로" width="30px"> 
	        *
	        <input type="text" id="answer32" class="answerShort" placeholder="세로" width="30px">
	        *
	        <input type="text" id="answer33" class="answerShort" placeholder="높이" width="30px">; <div class="hintDiv"></div>
        </div>
      </div>
    </li>
    <li class="slide" data-tag="Step5">
      <div class="sized-container">
      <h2 style="font-size: 30px" class="question">평면도가 만들어졌습니다. </h2> 
      <h2 style="font-size: 30px" class="question">상자를 클릭해서 조립하세요! </h2>
        <div id="showDiv" style="margin-top: 30%"> 
        	<%@ include file="cube.jsp" %> 
        </div>
      </div>
    </li>
    <li class="slide" data-tag="Step6">
      <div class="sized-container"> 
      <h2 style="font-size: 30px" class="question">상자가 완성되었습니다.</h2> 
      <h2 style="font-size: 30px" class="question">상자에 마우스를 올려보세요! </h2>
        <div class="box_wrapper">
           <div class="box">
             <div class="front"></div>
             <div class="back"></div>
             <div class="top"></div>
             <div class="bottom"></div>
             <div class="left"></div>
             <div class="right"></div>
           </div>
      	</div> 		
      </div>
    </li>
  </ul>
</div>
<div class="full-width-container">
  <div class="button-container sized-container">
     <!-- <button class="check">CHECK</button> -->
     <div id="checkBtnDiv"></div>
    <div id="nextBtnDiv"></div>
    <!-- <button class="next">next</button> -->
    <button class="previous">previous</button>
    <div id="answerResultDiv"></div>
  </div>
</div>

</body>
</html>