<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ contents52.jsp ]</title>
   
   <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<!-- CSS -->
<style type="text/css">
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
   font-family: 'Jua', sans-serif;
   font-weight: 500;
   font-size: 15px;
   margin : 0px;
}

h1 {
   font-size: 24px;
   line-height: 30px;
   font-weight: bold;
}

h2 {
   font-size: 18px;
   line-height: 25px;
   margin-top: 10px;
}

/* CHECK & NEXT BUTTON */
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
   margin: 0; 
   padding: 0 1em 0;
   padding-left: 0px;
   position: relative;
   left: 0;
   overflow: hidden;
   width: 6860px;
   height: 575px;
}

.slide {
   float: left;
   list-style-type: none;
}
.slide .sized-container {
   padding: 20px 0px;
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
   margin-top: 50px;
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
   width: 6%;
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

[class^="answer"] {
      margin: 0; 
      padding: 0;
      background-color: #f3fafd; 
      border: solid 2px #4ECCA3; 
      border-radius: 4px; 
      box-sizing: border-box;
      width: 35px; 
      height: 35px;
      text-align: center;
      font-size: 13pt; 
      color: #393E46; 
      font-weight: 600;
      font-style: 'Jua', sans-serif;
}

ul{
   list-style:none;
   padding-left:0px;
}

[class^="question_div"] {
   max-width : 700px;
   border: solid 5px #4ECCA3;
    border-radius: 5px;
   padding: 5px;
   margin-left: 90px;
}

.question_div1 {
    padding-left: 90px;
}

.question_div2 {
    padding-left: 20px;
}

/* .question_div6 {
    padding-left: 20px;
}
.question_div7 {
    padding-left: 20px;
}
.question_div8 {
    padding-left: 20px;
}
.question_div9 {
    padding-left: 20px;
} */


.forToWhile_table {
   margin-left : 20px;
}

.forToWhile_td {
   border: solid 5px #4ECCA3;
   border-radius: 5px;
   margin: 15px;
   padding: 20px;
   width: 420px;
}

/* Select Box - 몇 단인지 선택하는 셀렉트 박스 */
[include*="form-input-select()"] {
   display: block;
   padding: 0;
   position: relative;
   color: #005BA6;
   display: inline-block;
   border-radius: 0;
   box-shadow: none;
   font-size: 15px;
   margin-top: 0px;
   margin-bottom: 0px;
   width: 100px;
}
[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
   content: '';
   display: block;
   position: absolute;
   pointer-events: none;
   z-index: 2;
}
[include*="form-input-select()"] select {
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   background: none;
   box-sizing: border-box;
   width: 100%;
   margin: 0;
   border: 1px solid transparent;
   font-size: 16px;
   outline: none;
}
[include*="form-input-select()"] select:focus {
   background-color: transparent;
   outline: none;
}
[include*="form-input-select()"] option {
   font-weight: normal;
}
[include*="form-input-select()"] x:-o-prefocus, [include*="form-input-select()"]::after {
   display: none;
}
   @media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
   [include*="form-input-select()"] select::-ms-expand {
      display: none;
   }   
   [include*="form-input-select()"] select:focus::-ms-value {
         background: transparent;
       color: #000;
   }
}
@-moz-document url-prefix() {
   [include*="form-input-select()"] {
      overflow: hidden;
   }
   [include*="form-input-select()"] select {
      width: 120%;
      width: calc(100% + 3em);
  }
  @supports (-moz-appearance: none) {
    [include*="form-input-select()"] select {
      width: 100%;
   }
}
   [include*="form-input-select()"] select:-moz-focusring {
      color: transparent;
      text-shadow: 0 0 0 #000;
   }
}
@supports (-moz-appearance: none) {
   [include*="form-input-select()"] {
      width: 100%;
   }
}
[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
   content: '';
   display: block;
     position: absolute;
   pointer-events: none;
   border: 1px solid transparent;
   width: 0;
   height: 0;
   right: 16px;
}
[include*="form-input-select()"]::before {
   bottom: 55%;
   border-width: 0 6.5px 8px 6.5px;
   border-bottom-color: #D6D6D6;
}
[include*="form-input-select()"]::after {
   border-width: 8px 6.5px 0 6.5px;
   border-top-color: #D6D6D6;
   top: 55%;
}
@-moz-document url-prefix() {
   [include*="form-input-select()"] {
      border-right: 3px solid #E6E6E6;
   }
   [include*="form-input-select()"]:hover {
      border-right: 3px solid #005BA6;
   }
}
[include*="form-input-select()"]:hover select {
   box-shadow: 0 2px 3px rgba(0, 91, 166, 0.1) inset;
    border-color: #005BA6;
}
[include*="form-input-select()"]:hover select:focus {
   outline-color: transparent;
}
[include*="form-input-select()"]:hover::before {
   border-bottom-color: #005BA6;
}
[include*="form-input-select()"]:hover::after {
   border-top-color: #005BA6;
}
[include*="form-input-select()"] select {
   border: 3px solid #E6E6E6;
   border-radius: 0;
   font-weight: 400;
   color: inherit;
   padding: 5px 5px;
   line-height: normal;
   transition: border-color 0.2s ease, outline 0.2s ease;
}
[include*="form-input-select()"] select:focus {
   box-shadow: 0 3px 4px rgba(0, 91, 166, 0.3) inset;
   outline: 3px solid #005BA6;
   outline-offset: -3px;
}
[include*="form-input-select()"] select[disabled], [include*="form-input-select()"] select:disabled {
   opacity: 0.4;
   cursor: not-allowed;
}
[include*="form-input-select()"] select:invalid {
   color: #C7C7C7;
}

/* PRINT - 출력화면 보여주기 */
.print {
   position: absolute;
   height: 160px;
   overflow: hidden;
   font-family: 'Jua', sans-serif;
   font-size: 25px;
   line-height: 40px;
   color: #353538;
   margin-left : 95px;
}

.print__container {
   font-weight: 600;
    overflow: hidden;
   height: 50px;
   padding: 0 40px;
   margin : 5px;
}

.print__container:before {
   content: '[';
   left: 0;
}

.print__container:after {
   content: ']';
   position: absolute;
   right: 0;
}

.print__container:after, .print__container:before {
   position: absolute;
   top: 0;
   color: #16a085;
   font-size: 42px;
     line-height: 50px;
   -webkit-animation-name: opacity;
   -webkit-animation-duration: 2s;
   -webkit-animation-iteration-count: infinite;
   animation-name: opacity;
   animation-duration: 2s;
   animation-iteration-count: infinite;
}

.print__container__text {
   display: inline;
   float: left;
   margin-top: 5px;
}

.print__container__list {
   margin-top: 5px;
   padding-left: 50px;
   text-align: left;
   list-style: none;
   -webkit-animation-name: change;
   -webkit-animation-duration: 15s;
   -webkit-animation-iteration-count: infinite;
   animation-name: change;
   animation-duration: 15s;
   animation-iteration-count: infinite;
}

.print__container__list1 {
   margin-top: 5px;
   padding-left: 50px;
   text-align: left;
   list-style: none;
   -webkit-animation-name: change;
   -webkit-animation-duration: 100s;
   -webkit-animation-iteration-count: infinite;
   animation-name: change2;
   animation-duration: 100s;
   animation-iteration-count: infinite;

}

.print__container__list__item,
.print__container__list1__item {
   line-height: 40px;
   margin: 0;
}

/* @-webkit-keyframes opacity {
   0%, 100% {
      opacity: 0;
   }
   50% {
      opacity: 1;
   }
}

@-webkit-keyframes change {
   0%, 12.66%, 100% {
      -webkit-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
   }
   16.66%, 29.32% {
      -webkit-transform: translate3d(0, -25%, 0);
      transform: translate3d(0, -25%, 0);
     }
   33.32%, 45.98% {
      -webkit-transform: translate3d(0, -50%, 0);
      transform: translate3d(0, -50%, 0);
     }
   49.98%, 62.64% {
      -webkit-transform: translate3d(0, -75%, 0);
      transform: translate3d(0, -75%, 0);
     }
   66.64%, 79.3% {
      -webkit-transform: translate3d(0, -50%, 0);
      transform: translate3d(0, -50%, 0);
   }
   83.3%, 95.96% {
      -webkit-transform: translate3d(0, -25%, 0);
      transform: translate3d(0, -25%, 0);
   }
} */

@keyframes opacity {
   0%, 100% {
      opacity: 0;
   }
   50% {
      opacity: 1;
   }
}

/* 리스트 9개 */
@keyframes change {
   0%, 10.00%{
      -webkit-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
   }
   15.00%, 20.00% {
      -webkit-transform: translate3d(0, -11.3%, 0);
      transform: translate3d(0, -11.3%, 0);
   }
   25.00%, 30.00% {
      -webkit-transform: translate3d(0, -22.2%, 0);
      transform: translate3d(0, -22.2%, 0);
   }
   35.00%, 40.00% {
      -webkit-transform: translate3d(0, -33.5%, 0);
      transform: translate3d(0, -33.5%, 0);
   }
    45.00%, 50.00% {
      -webkit-transform: translate3d(0, -44.5%, 0);
      transform: translate3d(0, -44.5%, 0);
   }
   55.00%, 60.00% {
      -webkit-transform: translate3d(0, -55.5%, 0);
      transform: translate3d(0, -55.5%, 0);
   } 
   65.00%, 70.00% {
      -webkit-transform: translate3d(0, -66.4%, 0);
      transform: translate3d(0, -66.4%, 0);
   } 
   75.00%, 80.00% {
      -webkit-transform: translate3d(0, -78%, 0);
      transform: translate3d(0, -78%, 0);
   } 
   85.00%, 90.00% {
      -webkit-transform: translate3d(0, -89%, 0);
      transform: translate3d(0, -89%, 0);
   } 
   95.00%, 100.00% {
      -webkit-transform: translate3d(0, -99.5%, 0);
      transform: translate3d(0, -99.5%, 0);
   } 
} 

/* 리스트 81개 */
@keyframes change2 {
   0%, 50.00%{
      -webkit-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
   }
   50.00%, 100.00% {
      -webkit-transform: translate3d(0, -100%, 0);
      transform: translate3d(0, -100%, 0);   
   }
   
   /* 1.850%, 2.469% {
      -webkit-transform: translate3d(0, -1.235%, 0);
      transform: translate3d(0, -1.235%, 0);
   }
   3.1%, 3.659% {
      -webkit-transform: translate3d(0, -2.469%, 0);
      transform: translate3d(0, -2.469%, 0);
   }
   4.2%, 4.878% {
      -webkit-transform: translate3d(0, -3.659%, 0);
      transform: translate3d(0, -3.659%, 0);
   }
   5.4%, 6.097% {
      -webkit-transform: translate3d(0, -4.878%, 0);
      transform: translate3d(0, -4.878%, 0);
   }
   6.7%, 7.407% {
      -webkit-transform: translate3d(0, -6.097%, 0);
      transform: translate3d(0, -6.097%, 0);
   }
   8.0%, 8.642% {
      -webkit-transform: translate3d(0, -7.407%, 0);
      transform: translate3d(0, -7.407%, 0);
   } 
   9.25%, 9.877% {
      -webkit-transform: translate3d(0, -8.642%, 0);
      transform: translate3d(0, -8.642%, 0);
   } 
   10.45%, 11.11% {
      -webkit-transform: translate3d(0, -9.877%, 0);
      transform: translate3d(0, -9.877%, 0);
   } 
   11.7%, 12.346% {
      -webkit-transform: translate3d(0, -11.11%, 0);
      transform: translate3d(0, -11.11%, 0);
   } 
   12.95%, 13.58% {
      -webkit-transform: translate3d(0, -12.346%, 0);
      transform: translate3d(0, -12.346%, 0);
   }
   14.1%, 14.815% {
      -webkit-transform: translate3d(0, -13.58%, 0);
      transform: translate3d(0, -13.58%, 0);
   }
   15.4%, 16.05% {
      -webkit-transform: translate3d(0, -14.815%, 0);
      transform: translate3d(0, -14.815%, 0);
   }
   16.65%, 17.284% {
      -webkit-transform: translate3d(0, -16.05%, 0);
      transform: translate3d(0, -16.05%, 0);
   }
   17.90%, 18.518% {
      -webkit-transform: translate3d(0, -17.284%, 0);
      transform: translate3d(0, -17.284, 0);
   }
   19.10%, 19.753% {
      -webkit-transform: translate3d(0, -18.518%, 0);
      transform: translate3d(0, -18.518%, 0);
   }
   20.3%, 20.988% {
      -webkit-transform: translate3d(0, -19.753%, 0);
      transform: translate3d(0, -19.753%, 0);
   }
   21.5%, 22.22% {
      -webkit-transform: translate3d(0, -20.988%, 0);
      transform: translate3d(0, -20.988%, 0);
   }
   22.8%, 23.457% {
      -webkit-transform: translate3d(0, -22.22%, 0);
      transform: translate3d(0, -22.22%, 0);
   }
   24.0, 24.691% {
      -webkit-transform: translate3d(0, -23.457%, 0);
      transform: translate3d(0, -23.457%, 0);
   }
   25.3%, 25.926% {
      -webkit-transform: translate3d(0, -24.691%, 0);
      transform: translate3d(0, -24.691%, 0);
   }
   26.6%, 27.16% {
      -webkit-transform: translate3d(0, -25.926%, 0);
      transform: translate3d(0, -25.926%, 0);
   }
   27.8%, 28.395% {
      -webkit-transform: translate3d(0, -27.16%, 0);
      transform: translate3d(0, -27.16%, 0);
   }
   29.0%, 29.63% {
      -webkit-transform: translate3d(0, -28.395%, 0);
      transform: translate3d(0, -28.395%, 0);
   }
   30.25%, 30.864% {
      -webkit-transform: translate3d(0, -29.63%, 0);
      transform: translate3d(0, -29.63%, 0);
   }
   31.45%, 32.1% {
      -webkit-transform: translate3d(0, -30.864%, 0);
      transform: translate3d(0, -30.864%, 0);
   }
   32.7%, 33.33% {
      -webkit-transform: translate3d(0, -32.1%, 0);
      transform: translate3d(0, -32.1%, 0);
   }
   34.0%, 34.568% {
      -webkit-transform: translate3d(0, -33.33%, 0);
      transform: translate3d(0, -33.33%, 0);
   }
   35.1%, 35.802% {
      -webkit-transform: translate3d(0, -34.568%, 0);
      transform: translate3d(0, -34.568%, 0);
   }
   36.45%, 37.037% {
      -webkit-transform: translate3d(0, -35.802%, 0);
      transform: translate3d(0, -35.802%, 0);
   }
   37.65%, 38.272% {
      -webkit-transform: translate3d(0, -38.272%, 0);
      transform: translate3d(0, -38.272%, 0);
   } */
} 

.page-wrapper{
     width:100%;
     height:100%;
     /* background:url(https://i.imgur.com/2ZgHKbQ.jpg) center no-repeat; */
     /* background-size:cover; */
   }
   

/* Error Button */
a.btn{
     width:150px;
     height:50px;
     display:block;
     margin: 30px  0 0 -75px;
     position:absolute;
     top:86.5%; left:42%;
     font:'Jua', sans-serif;
     font-weight:700;
     text-align:center;
     text-decoration:none;
     color:#fff;
     border-radius:5px;
     background:rgba(217,67,86,1);
     font-size: 30px;
     padding-top: 5px;
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
     background:#f4f5f7;
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
      font-size: 25px;
      color: #393E46;
      padding-left: 5%;
      padding-top: 5%;
      }


/* <RADIO BUTTON> */
.radio_h1 {
   font-weight: 200;
   text-align: left;
   padding-bottom: 10px;
   max-width: 70%;
   margin: 20px;
}
      
/* CONTAINERS */
.container {max-width: 850px; width: 100%; margin: 0 auto;}
.four { width: 32.26%; max-width: 32.26%;}
      
/* COLUMNS */
.col {
   display: block;
   float:left;
   margin: 5px 0px;
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
    *zoom: 0;
}

section {
   margin-left: 63px;
}
      
/* FORM */
.form .plan input, .form .payment-plan input, .form .payment-type input{
   display: none;
}
.form label{
   width : 700px;
   position: relative;
   color: #fff;
   background-color: #aaa;
   font-size: 26px;
   text-align: center;
   height: 40px;
   line-height: 40px;
   display: table;
   cursor: pointer;
   border: 3px solid transparent;
   margin-top: 5px 0px;
    
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
   width: 30px;
   height: 30px;
   line-height: 30px;
   border-radius: 100%;
   border: 2px solid #fff;
   background-color: #37B595;
   z-index: 999;
      position: absolute;
   top: -10px;
   right: -10px;
   margin: 5px 0px;
    margin-bottom: 5px;
}
      
.question{
   font-size: 30px;
   text-align: center;
   color: #232931;
}
     
</style>

<!-- JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script type="text/javascript">
   
   $(function() {
     /* 변수 선언 */
     // 현재 슬라이드 숫자
      var currentSlide = 0;
      
      // 체크 버튼 생성
      var checkStr = '<button class="check">CHECK</button>';
      $('#checkBtnDiv').html(checkStr);
      
       // ul 태그
      var $slideContainer = $('.slide-container'),
       // li 태그
       $slide = $('.slide'),
       // 슬라이드 개수 = li 태그의 개수
       slideCount = $slide.length,
       // array
       answerArr = [],
       // 애니메이션 시간 = 0.3초
       animationTime = 300;
       
       var selectNum = 0;
       var answer = '';

     // 슬라이드 크기(면적) Set
      function setSlideDimensions () {
        // 현재 윈도우 창의 가로 길이
      var windowWidth = $(window).width();
        // 슬라이드 컨테이너(ul)의 가로 길이를 (현재 윈도우 창 가로 길이 * 슬라이드의 개수)
        $slideContainer.width(windowWidth * slideCount);
          // 슬라이드(li)의 가로 길이는 윈도우창 가로 길이 
        $slide.width(windowWidth);
      }
   
     // 상단 페이징처리 Set
      function generatePagination () {
      // pagination 클래스의 태그를 가져옴
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
     
     $('.check').on('click', goToCheck);
     
     // 정답 체크
     function goToCheck() {
       
        var NextBtnstr = '<button class="next">next</button>';
        var errTxt = '';
        
        if (currentSlide < 5) {
        
         // answer+각 슬라이드 숫자 로 지정된 클래스를 가져온다 
         var $answerClass = $('.answer' + currentSlide);
         // $answerClass에 저장된 클래스 개수를 가져온다.
         var answerCount = $answerClass.length;

         for(var i = 1; i <= answerCount; i++) {
               // answer01, answer02
               answer = $('#answer' + currentSlide + i).val();
               answerArr.push(answer);
            }
        
            var cNum = currentSlide + 1;
         
             $.ajax({
                url : "contents10",
                type : "POST",
                contentType : "application/json; charset=utf-8",
                dataType : "json",
                data : JSON.stringify ({
                   cNum : cNum
                   , answerArr : answerArr
                }),
                success : function(blankMap) {
                    alert('success');
                    answerArr = [];
                      alert(blankMap.result);
                      var resultStr = '';
                   /* 4. 결과 값이 false인 경우 */
                   if (blankMap.result == false) {
                      
                      resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"></div><br>';
                      resultStr += '<div class="page-wrapper"><a class="btn trigger" href="javascript:;">Error</a></div>';
                      
                      $('#answerResultDiv').html(resultStr); 
                      
                      var errorReason = blankMap.errorReasonArr;
                      
                      $.each(errorReason , function( i, val ) {
                          errTxt += '✔  '+ val + '<br>'; 
                           });
                       
                       $('.content').html(errTxt);
                       $('.content').val(errTxt);
                      
                       $('.trigger').click(function() {
                           $('.modal-wrapper').toggleClass('open');
                          $('.page-wrapper').toggleClass('blur');
                           return false;
                        });
                      
                   /* 4. 결과 값이 true인 경우 */   
                    } else if (blankMap.result == true) {
                        resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"></div>';
                           $('#answerResultDiv').html(resultStr);
                       
                         /* 5. 현재 슬라이드에 따른 출력 Box 관련 설정 */  
                         if(currentSlide == 0 || currentSlide == 1) {
                            for (var int = 1; int < 10; int++) {
                                  $('.print__container__text').html(selectNum);
                                  var result = int * selectNum;
                                 var liStr = "<li class='print__container__list__item'> * &nbsp; " + int +  " &nbsp; = &nbsp;" + result + "</li>";
                                 $('.print__container__list').append(liStr);
                            }
                         } else if(currentSlide == 2 ) {
                              $('.print__container__text').html("");
                              
                              for (var left = 2; left <= 9; left++) {
                                for (var right = 1; right <= 9; right++) {
                                   var result = left * right;
                                   var str = "<li class='print__container__list1__item'>" + left + " &nbsp; * &nbsp; " + right +  " &nbsp; = &nbsp;" + result + "</li>";
                                    $('.print__container__list1').append(str);
                                 }
                              }
                        }
                       
                    }
                 
               $('#checkBtnDiv').html("");
                      $('#nextBtnDiv').html(NextBtnstr);
                     $('.next').on('click', goToNextSlide);
                },
                error : function(err) {
                   console.log(err);
                   answerArr = [];
                   alert("fail");
                }
                
             });
             
        } else if( currentSlide >= 5 ) {
               var sectionAnswer = $('#q' + currentSlide).attr('answer');
               var userAnswer = $(':radio[name="radio'+ currentSlide +'"]:checked').val();
               
               /* 2. 섹션의 answer값과  사용자 answer값이 같을 경우] */
               if (sectionAnswer == userAnswer) {
                  resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png" width="250px"> </div>';
                 $('#answerResultDiv').html(resultStr);
                /* 2. 섹션 값과 사용자 값이 다를 경우 */
                 } else {
                    resultStr = '<div class="resultMsg"><img src="../resources/img/noanswer.png" width="250px"> </div>';
                       resultStr += '<div class="page-wrapper"><a class="btn trigger" href="javascript:;">Error</a></div>';

                    $('#answerResultDiv').html(resultStr);
                    
                    /* 3. 슬라이드 번호에 따라 에러 메세지 저장 */
                       if(currentSlide == 5) {
                    errTxt = '✔  '+ '2로 나누어 나머지가 0이 되는 숫자는 짝수 입니다. <br>';
                    errTxt += '따라서 0부터 10까지 숫자 중 짝수를 순서대로 출력한 두 번째 답이 정답입니다. <br>';
                       } else if (currentSlide == 6) {
                    errTxt = '✔  '+ '2로 나누어 나머지가 1이 되는 숫자는 홀수 입니다. <br>';
                    errTxt += '따라서 10부터 0까지 숫자 중 홀수를 순서대로 출력한 첫 번째 답이 정답입니다. <br>';
                 } else if (currentSlide == 7) {
                    errTxt = '✔  '+ '2로 나누어 나머지가 0이 되는 숫자는 짝수 입니다. <br>';
                    errTxt += '따라서 1부터 10까지 숫자 중 짝수만 더한 값인 30이 정답입니다. <br>';
                    errTxt += '0 + 2 + 4 + 6 + 8 + 10 = 30 <br>';
                 } else if (urrentSlide == 8) {
                    errTxt = '✔  '+ '2로 나누어 나머지가 1이 되는 숫자는 홀수 입니다. <br>';
                    errTxt += '따라서 1부터 5까지 숫자 중 홀수만 곱한 값인 15가 정답입니다. <br>';
                    errTxt += '1 * 3 * 5 = 15 <br>';
                 }
                 /* 3. END */
                    
                    $('.content').html(errTxt);
                    $('.content').val(errTxt);
                    
                    $('.trigger').click(function() {
                          $('.modal-wrapper').toggleClass('open');
                         $('.page-wrapper').toggleClass('blur');
                          return false;
                       });
                 } 
               /* 2. END */
               
               $('#checkBtnDiv').html("");
                   $('#nextBtnDiv').html(NextBtnstr);
                   $('.next').on('click', goToNextSlide);
                   
             
             }
         
     }
     
     $("#selectNum" + currentSlide).on("change", function(){
          var testNum = "#selectNum" + currentSlide;
          alert(testNum);
            selectNum = $("#selectNum" + currentSlide + " option:selected").val();
        });

     
     // 다음 슬라이드로 이동
      function goToNextSlide () {
       $('#answerResultDiv').html("");
        // 현재 슬라이드가 슬라이드 카운트 -1보다 작거나 같으면 Return  
      if(currentSlide >= slideCount - 1) {
         location.href = "contentsHome";
         return
         }; 
         
      // 현재 윈도우 창의 가로 길이
        var windowWidth = $(window).width();

      // 현재 슬라이드 숫자를 하나씩 증가시킴
        currentSlide++;
      
        $("#selectNum" + currentSlide).on("change", function(){
          var testNum = "#selectNum" + currentSlide;
          alert(testNum);
            selectNum = $("#selectNum" + currentSlide + " option:selected").val();
        });
      
      // 출력 div를 비워준담!
      $('.print__container__text').html("");
      $('.print__container__list').html("");
      selectNum = 0;
      
      //ul 태그에 효과를 준닷!
        $slideContainer.animate({
          // 왼쪽으로 (윈도우 창의 가로길이 * 현재 슬라이드)의 숫자만큼 이동시킴d
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
      // $('.check').on('click', goToNextSlide);
      $('.previous').on('click', goToPreviousSlide);
   });
   

     

</script>
</head>

<body style="overflow-x:hidden">
   
<div class="pagination-container full-width-container">
   <div class="sized-container">
      <div class="pagination"></div>
   </div>
</div>

<div class="viewport full-width-container">
   <ul class="slide-container">
   
<!-- STEP 1 : while문 사용해서 구구단 출력하기 -->
      <li class="slide" data-tag="Step1">
         <div class="sized-container">         
            <h1> while문을 사용해서 구구단을 출력해보아요! </h1>
            <h2> int left = 
               <div include="form-input-select()" style="display: inline-block;">
                  <select id="selectNum0">
                     <option value="" hidden="" >몇 단?</option>
                     <c:forEach var="num" begin="2" end="9">
                        <option value="${num}">${num}</option>
                     </c:forEach>
                    </select>
                 </div>
                 ; 
              </h2>
              
              <h2> int right = <input type="text" class="answer0" id="answer01" maxlength="1"> ; </h2>
              <h2> int result = &nbsp; 0 &nbsp; ; </h2>
              <br>
              
              <!-- STEP1 문제 STRAT -->
              <div class="question_div1">
                 <h2 style="text-align: left;">
                    while ( right <input type="text" class="answer0" id="answer02" maxlength="2" style="width:60px"> 9 ) { 
                       <br><br>
                       &emsp; &emsp; &emsp;
                       result = <input type="text" class="answer0" id="answer03" maxlength="7" style="width: 80px"> * right ;
                       <br><br>
                       &emsp; &emsp; &emsp;
                       System.out.println ( left + "*" + right + "=" + result ) ; 
                       <br><br>
                       &emsp; &emsp; &emsp;
                       right <input type="text" class="answer0" id="answer04" maxlength="2" style="width: 60px;"> &nbsp;;
                       <br><br>
                    }
                 </h2>
              </div>
              <!-- STEP1 문제 END -->
              
              <!-- STEP1 출력 div START -->
            <div class="print" style="display: block;">
                 <div class="print__container">
                   <p class="print__container__text"></p>
                  <ul class="print__container__list"></ul>
                 </div>   
            </div>
            <!-- STEP1 출력 div END -->
            
            <!-- STEP1 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                        <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                      <div class="content" id="contentErrDiv"></div>
                 </div>
               </div>
               <!-- STEP1 Error Message END -->
         </div>
       </li>
<!-- STEP 1 END -->


<!-- STEP 2 : for문 사용해서 구구단 출력하기 -->       
      <li class="slide" data-tag="Step2">
         <div class="sized-container">
            <h1> for문을 사용해서 구구단을 출력해 보아요! </h1>
            <h2> int left = 
               <div include="form-input-select()" style="display: inline-block;">
                  <select id="selectNum1">
                     <option value="" hidden="" >몇 단?</option>
                     <c:forEach var="num" begin="2" end="9">
                        <option value="${num}">${num}</option>
                     </c:forEach>
                    </select>
                 </div>
                 ; 
              </h2>
        
            <h2> int result = 0 ; </h2>
              <br><br>
                          <!-- STEP2 문제 START -->
              <div class="question_div2">
                 <h2 style="text-align: left;">
                    for (
                       int right = <input type="text" class="answer1" id="answer11" maxlength="1"> ; 
                       &nbsp; right <input type="text" class="answer1" id="answer12" maxlength="2" style="width: 60px">  9 ; &nbsp;
                     right <input type="text" class="answer1" id="answer13" maxlength="2" style="width: 60px">             
                       ) { 
                          <br><br>
                          &emsp; &emsp; &emsp;
                          result = <input type="text" class="answer1" id="answer14" maxlength="6" style="width: 80px"> * right ;
                          <br><br>
                          &emsp; &emsp; &emsp;
                          System.out.println ( left &nbsp; + &nbsp; "*" &nbsp; + &nbsp; right &nbsp; + &nbsp; "=" &nbsp; + &nbsp; result ) &nbsp; ; 
                          <br><br>
                       }
                 </h2>
              </div>
              <br><br>
              <!-- STEP2 문제 END -->
              
              <!-- STEP2 출력화면 START -->
            <div class="print" style="display: block;">
                 <div class="print__container">
                   <p class="print__container__text"></p>
                  <ul class="print__container__list"></ul>
                 </div>   
            </div>
            <!-- STEP2 출력화면 END -->
            
            <!-- STEP2 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                        <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                      <div class="content" id="contentErrDiv"></div>
                 </div>
               </div>
              <!-- STEP2 Error Message END -->
         </div>
      </li>
<!-- STEP 2 END -->       
      
         
<!-- STEP 3 : 이중 for문 사용해서 구구단 출력하기 -->         
      <li class="slide" data-tag="Step3">
         <div class="sized-container">
            <h1> 이중 for문을 사용해서 전체 구구단을 출력해 보아요! </h1><br>
              <h2> int result = 0 ; </h2>
              <br><br>
              
              <!-- STEP 3 문제  START -->
              <div class="question_div">
                 <h2 style="text-align: left;">
                    for (
                       int left = 2 ; &nbsp;
                       left &lt;= <input type="text" class="answer2" id="answer21" maxlength="1"> ; &nbsp; 
                       left <input type="text" class="answer2" id="answer22" maxlength="2" style="width: 60px"> &nbsp;) {<br><br>
                       &emsp; &emsp; 
                       for (
                          int right = 1 ; &nbsp;
                          right <input type="text" class="answer2" id="answer23" maxlength="2" style="width: 60px"> 9 ; &nbsp;
                          right <input type="text" class="answer2" id="answer24" maxlength="2" style="width: 60px"> &nbsp;) {<br><br>
                          &emsp; &emsp;
                          &emsp; &emsp; 
                          <input type="text" class="answer2" id="answer25" maxlength="7" style="width: 80px"> = left * right;
                          <br><br>
                          &emsp; &emsp; 
                          &emsp; &emsp; 
                          System.out.println ( left &nbsp; + &nbsp; "*" &nbsp; + &nbsp; right &nbsp; + &nbsp; "=" &nbsp; + &nbsp; result ) &nbsp; ; 
                          <br><br>
                          &emsp; &emsp; 
                       }<br><br>
                    }<br>
                 </h2>
              </div>
              <!-- STEP 3 문제  END -->
              
              <!-- STEP 3 출력화면 START -->
            <div class="print" style="display: block;">
                 <div class="print__container">
                   <ul class="print__container__list1" style = "padding-left: 20px;"></ul>
                 </div>   
            </div>
            
              <!-- STEP 3 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                        <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                      <div class="content" id="contentErrDiv"></div>
                 </div>
               </div>
              <!-- STEP 3 Error Message END -->
         </div>
       </li>
<!-- STEP 3 END -->

       
<!-- STEP 4 : for문  while문으로 바꾸기 -->   
      <li class="slide" data-tag="Step4">
         <div class="sized-container">
            <h1> for문을 while문으로 바꿔볼까요? </h1>
            <h1> 1부터 5까지 숫자를 더해봅시다!</h1>
            <br><br>
            <!-- STEP 4 문제 START -->
            <table class="forToWhile_table">
               <tr>
                  <td class="forToWhile_td">
                     <div class="forToWhile_question">
                        <h2 style="text-align: left;">
                           int sum = 0 ;<br><br>
                           for (int num = 1; num &lt;= 5; num++) { <br>
                              <br>
                              &emsp; &emsp;
                              sum = sum + num ; <br><br>
                              &emsp; &emsp;
                              System.out.println(sum);<br>
                              <br>
                           }
                        </h2>
                     </div>
                  </td>
                  <td class="forToWhile_td">
                     <div class="forToWhile_answer" >
                        <h2 style="text-align: left;">
                           int sum = 0 ;<br>
                           int num = <input type="text" class="answer3" id="answer31" maxlength="1"> &nbsp;; <br><br>
                           
                           while ( 
                              <input type="text" class="answer3" id="answer32" maxlength="7" style="width: 80px"> 
                              &lt;= 
                              <input type="text" class="answer3" id="answer33" maxlength="1"> ) { <br><br>
                              &emsp; &emsp; &emsp;
                              sum = sum + <input type="text" class="answer3" id="answer34" maxlength="7" style="width: 80px"> &nbsp;; <br><br>
                              &emsp; &emsp; &emsp;
                              num <input type="text" class="answer3" id="answer35" maxlength="7" style="width: 60px"> &nbsp; ;<br><br>
                              &emsp; &emsp; &emsp;
                              System.out.println(sum);<br><br>
                           }
                        </h2>
                     </div>
                  </td>
               </tr>
            </table>
            <!-- STEP 4 문제테이블 END -->
         </div>
         
         <!-- STEP 4 Error Message START -->
           <div class="modal-wrapper">
              <div class="modal">
                   <div class="head1" style="font-size: 40px">
                     Error Check
                       <a class="btn-close trigger" href="javascript:;"></a>
                   </div>
                  <div class="content" id="contentErrDiv"></div>
               </div>
            </div>
         <!-- STEP 4 Error Message END -->
      </li>
<!-- STEP 4 END -->      


<!-- STEP 5 : while문 for문으로 바꾸기 -->
      <li class="slide" data-tag="Step5">
         <div class="sized-container">
            <h1> 이번엔 while문을 for문으로 바꿔볼까요? </h1>
            <h1> 5부터 1까지의 숫자를 곱해봅시다!</h1>
            <br><br>
            <!-- STEP 5 문제 START -->
            <table class="forToWhile_table">
               <tr>
                  <td class="forToWhile_td" style="width: 370px">
                     <div class="forToWhile_div">
                        <h2 style="text-align: left;">
                           int multiply = 1 ;<br>
                           int num = 5 ; <br><br>
                            while ( num >= 1 ) {
                               <br><br>
                              &emsp; &emsp; &emsp;
                              multiply = multiply * num ; <br><br>
                              &emsp; &emsp; &emsp;
                              num-- ; <br><br>
                              &emsp; &emsp; &emsp;
                              system.out.println(multiply) ; <br><br> 
                  
                           }
                        </h2>
                     </div>
                  </td>
                  <td class="forToWhile_td" style="width: 470px">
                     <div class="forToWhile_answer" >
                        <h2 style="text-align: left;">
                           int multiply = <input type="text" class="answer4" id="answer41" maxlength="1"> ;<br><br>
                           
                           for ( int num = <input type="text" class="answer4" id="answer42" maxlength="1"> ; 
                              num &gt;= <input type="text" class="answer4" id="answer43" maxlength="1"> ; 
                              num <input type="text" class="answer4" id="answer44" maxlength="2" style="width: 60px"> ) { <br><br>
                              
                              &emsp; &emsp;
                              multiply = <input type="text" class="answer4" id="answer45" maxlength="10" style="width: 100px"> * num ; 
                              <br><br>
                              &emsp; &emsp;
                              system.out.println(multiply) ;<br>
                              <br>
                           }
                        </h2>
                     </div>
                  </td>
               </tr>
            </table>
            
            <!-- STEP 5 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                          <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                     <div class="content" id="contentErrDiv"></div>
                  </div>
               </div>
            <!-- STEP 5 Error Message END -->
         </div>
      </li>
<!-- STEP 5 END -->
      
      
<!-- STEP 6 : 라디오버튼 선택 문제 -->      
      <li class="slide" data-tag="Step6">
         <div class="sized-container">
            <!-- STEP 6 문제 START -->
            <div class="question_div6">
               <h2 class="radio_h1">
               int num = 0;<br><br>
               while ( num &lt;= 10 ) { <br>
                  &emsp; &emsp;
                  if ( num % 2 == 0 ) {<br>
                     &emsp; &emsp;&emsp; &emsp;
                     System.out.print( num + " " );<br>
                     
                  &emsp; &emsp;
                  }<br>
                  &emsp; &emsp;
                  num++;<br>
               }
               </h2>
            </div>
            <!-- STEP 6 문제 END -->
            
            <!-- STEP 6 라디오버튼 START -->
            <div class="container">
               <br>
               <h1> while 문의 결과는? </h1>
               <form class="form cf">
                  <section class="plan cf" id="q5" answer="answer52">
                     <input type="radio" name="radio5" id="answer51" value="answer51">
                     <label class="free-label four col" for="answer51">0 1 2 3 4 5</label>
                     <input type="radio" name="radio5" id="answer52" value="answer52">
                     <label class="basic-label four col" for="answer52">0 2 4 6 8 10</label>
                     <input type="radio" name="radio5" id="answer53" value="answer53">
                     <label class="premium-label four col" for="answer53">0 1 2 3 4 5 6 7 8 9 10</label>
                  </section>      
               </form>
            </div>
            <!-- STEP 6 라디오버튼 END -->
            
            <!-- STEP 6 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                          <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                     <div class="content" id="contentErrDiv"></div>
                  </div>
               </div>
            <!-- STEP 6 Error Message END -->
         </div>
      </li>
<!-- STEP 6 END -->   

<!-- STEP 7 : 라디오버튼 선택 문제 -->      
      <li class="slide" data-tag="Step7">
         <div class="sized-container">
            <!-- STEP 7 문제 START -->
            <div class="question_div7">
               <h2 class="radio_h1">
               for ( int num = 10 ; num &gt; 0 ; num-- ) { <br>
                  &emsp; &emsp;
                  if ( num % 2 == 1 ) {<br>
                     &emsp; &emsp;&emsp; &emsp;
                     System.out.print( num + " " );<br>
                  &emsp; &emsp;
                  }<br>
               }
               </h2>
            </div>
            <!-- STEP 7 문제 END -->
            
            <!-- STEP 7 라디오버튼 START -->
            <div class="container">
            <br>
               <h1> for문의 결과는? </h1>
               <form class="form cf">
                  <section class="plan cf" id="q6" answer="answer63">
                     <input type="radio" name="radio6" id="answer61" value="answer61">
                     <label class="free-label four col" for="answer61" >1 3 5 7 9</label>
                     <input type="radio" name="radio6" id="answer62" value="answer62">
                     <label class="basic-label four col" for="answer62">10 8 6 4 2 0</label>
                     <input type="radio" name="radio6" id="answer63" value="answer63">
                     <label class="premium-label four col" for="answer63">9 7 5 3 1</label>
                  </section>      
               </form>
            </div>
            <!-- STEP 7 라디오버튼 END -->
            
            <!-- STEP 7 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                          <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                     <div class="content" id="contentErrDiv"></div>
                  </div>
               </div>
            <!-- STEP 7 Error Message END -->
         </div>
      </li>
<!-- STEP 7 END -->   

<!-- STEP 8 : 라디오버튼 선택 문제 -->      
      <li class="slide" data-tag="Step8">
         <div class="sized-container">
            <!-- STEP 8 문제 START -->
            <div class="question_div8">
               <h2 class="radio_h1">
               int num = 0;<br>
               int sum = 0;<br><br>
               while ( num &lt;= 10 ) { <br>
                  &emsp; &emsp;
                  if ( num % 2 == 0 ) {<br>
                     sum = sum + num;<br>
                     System.out.print( "sum : " + sum );<br>
                  &emsp; &emsp;
                  }<br>
                  &emsp; &emsp;
                  num++;<br>
               }
               </h2>
            </div>
            <!-- STEP 8 문제 END -->
            
            <!-- STEP 8 라디오버튼 START -->
            <div class="container">
               <br>
               <h1> while 문의 결과는? </h1>
               <form class="form cf">
                  <section class="plan cf" id="q7" answer="answer71">
                     <input type="radio" name="radio7" id="answer71" value="answer71">
                     <label class="free-label four col" for="answer71">30</label>
                     <input type="radio" name="radio7" id="answer72" value="answer72">
                     <label class="basic-label four col" for="answer72">15</label>
                     <input type="radio" name="radio7" id="answer73" value="answer73">
                     <label class="premium-label four col" for="answer73">55</label>
                  </section>      
               </form>
            </div>
            <!-- STEP 8 라디오버튼 END -->
            
            <!-- STEP 8 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                          <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                     <div class="content" id="contentErrDiv"></div>
                  </div>
               </div>
            <!-- STEP 8 Error Message END -->
         </div>
      </li>
<!-- STEP 8 END -->

<!-- STEP 9 : 라디오버튼 선택 문제 -->      
      <li class="slide" data-tag="Step9">
         <div class="sized-container">
            <!-- STEP 9 문제 START -->
            <div class="question_div9">
               <h2 class="radio_h1">
               int multiply = 1;
               for ( int num = 5 ; num &gt;= 0 ; num-- ) { <br>
                  &emsp; &emsp;
                  if ( num % 2 == 1 ) {<br>
                     &emsp; &emsp;&emsp; &emsp;
                     multiply = multiply * num ;
                     &emsp; &emsp;&emsp; &emsp;
                     System.out.print( "multiply : " + multiply );<br>
                  &emsp; &emsp;
                  }<br>
               }
               </h2>
            </div>
            <!-- STEP 9 문제 END -->
            
            <!-- STEP 9 라디오버튼 START -->
            <div class="container">
               <br>
               <h1> for문의 결과는? </h1>
               <form class="form cf" id="q8" answer="answer81">
                  <section class="plan cf" answer="answer81">
                     <input type="radio" name="radio8" id="answer81" value="answer81">
                     <label class="free-label four col" for="answer81">15</label>
                     <input type="radio" name="radio8" id="answer82" value="answer82">
                     <label class="basic-label four col" for="answer82">120</label>
                     <input type="radio" name="radio8" id="answer83" value="answer83">
                     <label class="premium-label four col" for="answer83">30</label>
                  </section>      
               </form>
            </div>
            <!-- STEP 9 라디오버튼 END -->
            
            <!-- STEP 9 Error Message START -->
              <div class="modal-wrapper">
                 <div class="modal">
                      <div class="head1" style="font-size: 40px">
                        Error Check
                          <a class="btn-close trigger" href="javascript:;"></a>
                      </div>
                     <div class="content" id="contentErrDiv"></div>
                  </div>
               </div>
            <!-- STEP 9 Error Message END -->
         </div>
      </li>
<!-- STEP 9 END -->   
   
   
   </ul>
</div>

<div class="full-width-container">
   <div class="button-container sized-container">
      <div id="checkBtnDiv"></div>
      <div id="nextBtnDiv"></div>
      <button class="previous">previous</button>
      <div id="answerResultDiv"></div>
   </div>
</div>

</body>
</html>