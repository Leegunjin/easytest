<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua"
   rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
   href="../resources/css/styleContents22.css?ver=1">
<script type="text/javascript"
   src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>

<style type="text/css">
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

.answer {
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
   font-family: 'Jua', sans-serif;
   color: #353538;
   font-weight: 600;
   font-style: inherit;
}

@charset "UTF-8";

*, html, body {
   font-family: 'Jua', sans-serif;
   margin-left: -3px;
}

* {
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}

h1, h2 {
   text-align: center;
}

h1 {
   font-size: 25px;
   font-family: 'Jua', sans-serif;
   line-height: 25px;
   margin-top: -6px;;
}

h2 {
   font-size: 23px;
   font-family: 'Jua', sans-serif;
   line-height: 25px;
   margin-top: -14px;
   margin-left: 37px;
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
   font-family: 'Jua', sans-serif;
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
   max-height: 440px;
}

.sized-container {
   max-width: 1000px;
   height: 30px;
   width: 100%;
   margin: 0 auto;
}

.slide-container {
   position: relative;
   width: 5580px;
   left: 0;
   overflow: hidden;
   height: 380px;
}

.slide {
   float: left;
   height: 400px;
}

.slide .sized-container {
   padding: 16px 25px;
}

.button-container {
   border-top: 1px solid black;
   height: 70px;
   overflow: hidden;
}

.button-container button {
   float: right;
   margin-left: 30px;
   margin-top: 20px;
}

.pagination-container {
   margin-top: 120px;
}

.pagination {
   width: 100%;
   text-align: center;
   padding: 0 25px;
   margin-top: -65px;
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
   font-family: 'Jua', sans-serif;
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

ul {
   list-style: none;
   padding-left: 0px;
}

#javaCodeDiv {
   font-size: 40px;
   font-weight: bolder;
   font-family: 'Jua', sans-serif;
   width: 300px;
   margin-left: 290px;
   margin-top: -62px;
   height: 80px;
}

#c22 {
   height: 400px;
   width: 1200px;
   margin-top: 9px;
   margin-left: -149px;
}

#c23 {
   margin-left: -8px;
}

input {
   margin: 0;
   padding: 0;
   background-color: #f3fafd;
   border: solid 2px #217093;
   border-radius: 4px;
   box-sizing: border-box;
   width: 120px;
   height: 24px;
   text-align: center;
   font-size: 15pt;
   color: #353538;
   font-weight: 600;
   font-style: inherit;
}

#names {
   margin-left: 100px;
   margin-top: 100px;
}
</style>

<script type="text/javascript">
   $(function() {
      var currentSlide = 0;
      var testCount = 0;
      $slideContainer = $('.slide-container'), $slide = $('.slide'),
            slideCount = $slide.length, animationTime = 300;

      function setSlideDimensions() {
         var windowWidth = $(window).width();
         $slideContainer.width(windowWidth * slideCount);
         $slide.width(windowWidth);
      }
      function generatePagination() {
         var $pagination = $('.pagination');
         for (var i = 0; i < slideCount; i++) {
            var $indicator = $('<div>').addClass('indicator'), $progressBarContainer = $(
                  '<div>').addClass('progress-bar-container'), $progressBar = $(
                  '<div>').addClass('progress-bar'), indicatorTagText = $slide
                  .eq(i).attr('data-tag'), $tag = $('<div>').addClass(
                  'tag').text(indicatorTagText);
            $indicator.append($tag);
            $progressBarContainer.append($progressBar);
            $pagination.append($indicator).append($progressBarContainer);
         }
         $pagination.find('.indicator').eq(0).addClass('active');
      }
      function goToCheck() {
         var cNum = currentSlide + 1;
         var checkedValue = $('#checkedValue' + currentSlide).val();

      }
      function goToNextSlide() {
         $('#answerResultDiv').html("");
         if (currentSlide >= slideCount - 1) {
            location.href = "clearChapter?c_num=220";
         }
         var windowWidth = $(window).width();
         currentSlide++;
         $slideContainer.animate({
            left : -(windowWidth * currentSlide)
         });
         setActiveIndicator();
         $('.progress-bar').eq(currentSlide - 1).animate({
            width : '100%'
         }, animationTime);
         $('#nextBtnDiv').html("");
         $('#javaCodeDiv').html("");

      }
      function goToPreviousSlide() {
         if (currentSlide <= 0)
            return;
         var windowWidth = $(window).width();
         currentSlide--;
         $slideContainer.animate({
            left : -(windowWidth * currentSlide)
         }, animationTime);
         setActiveIndicator();
         $('.progress-bar').eq(currentSlide).animate({
            width : '0%'
         }, animationTime);
      }
      function postitionSlides() {
         var windowWidth = $(window).width();
         setSlideDimensions();
         $slideContainer.css({
            left : -(windowWidth * currentSlide)
         }, animationTime);
      }
      function setActiveIndicator() {
         var $indicator = $('.indicator');
         $indicator.removeClass('active').removeClass('complete');
         $indicator.eq(currentSlide).addClass('active');
         for (var i = 0; i < currentSlide; i++) {
            $indicator.eq(i).addClass('complete');
         }
      }
      setSlideDimensions();
      generatePagination();
      $(window).resize(postitionSlides);
      $('.previous').on('click', goToPreviousSlide);

      /*$("#name1").on('change', function() {
         var name1 = document.getElementById('name1').value;
         var name11 = document.getElementById('names');
         name11.innerHTML = "int" + " " + name1 + " = ";

      });
      $("#name2").on('change', function() {
         var name2 = document.getElementById('name2').value;
         var name22 = document.getElementById('names');
         name22.innerHTML = "double" + " " + name2 + " = ";
      });
      $("#name3").on('change', function() {
         var name3 = document.getElementById('name3').value;
         var name33 = document.getElementById('names');
         name33.innerHTML = "string" + " " + name3 + " = ";
      });
      $("#name4").on('change', function() {
         var name4 = document.getElementById('name4').value;
         var name44 = document.getElementById('names');
         name44.innerHTML = "boolean" + " " + name4 + " = ";
      });*/

      $("#images div img").draggable({
         start : function(event, ui) {
            $(this).draggable("option", "revert", true);
            $("#images div img").css("zIndex", 10);
            $(this).css("zIndex", 100);

         }
      });

      var count = 0;
      $("#boards img")
            .droppable(
                  {
                     drop : function(event, ui) {
                        var droptitle = ui.draggable.attr("title");
                        var dragid = $(this).attr("id");
                        //alert(droptitle); - 스티커
                        //alert(dropid);- 박스
                        //console.log(ui.draggable);

                        var dropid = ui.draggable.attr("id");
                        var resultStr = '';
                        // div에 값 출력하기
                        //alert(dragid+names+"="+dropid);
                        //console.log(event);
                        //alert(droptitle); - 스티커
                        //alert(dropid);- 박스
                        ///alert(dragid+"="+dropid);

                        if (dragid == droptitle) {
                           ui.draggable.hide();
                           //'<div class="javaCodeDiv"></div>'
                           //$('#javaCodeDiv').html(dragid + "=" + dropid);

                           resultStr = '<div class="resultMsg"><img src="../resources/img/yesanswer.png"  width="270px"></div>';
                           $('#answerResultDiv').html(resultStr);
                           $('.next').removeAttr('disabled');
                           $('.next').off().on('click', goToNextSlide);
                           $('#javaCodeDiv').html("");
                           //alert(dropid); 

                           
                           if (droptitle == "boolean") {
                              /*document.getElementById('names').innerHTML = "boolean"
                                    + " "
                                    + document
                                          .getElementById('name4').value
                                    + " = "
                                    + ui.draggable.attr("value");*/
                              //$('#javaCodeDiv').html(names+name+"="+value);
                              $('#javaCodeDiv').html("boolean"+ " "+ document.getElementById('name4').value
                                 + " = "+ ui.draggable.attr("value"));
                           }
                              if (droptitle == "string") {
                                 /*   document.getElementById('names').innerHTML = "string"
                                          + " "
                                          + document
                                                .getElementById('name3').value
                                          + " = "
                                          + ui.draggable.attr("value");*/
                              
                              $('#javaCodeDiv').html("string"+ " "+ document.getElementById('name3').value
                                    + " = "+ ui.draggable.attr("value"));
                              }
                              if (droptitle == "double") {
                                 /*document.getElementById('names').innerHTML = "double"
                                       + " "
                                       + document
                                             .getElementById('name2').value
                                       + " = "
                                       + ui.draggable.attr("value");*/
                                       
                                 $('#javaCodeDiv').html("double"+ " "+ document.getElementById('name2').value
                                       + " = "+ ui.draggable.attr("value"));
                                 
                              }
                              if (droptitle == "int") {
                                 /*document.getElementById('names').innerHTML = "int"
                                       + " "
                                       + document
                                             .getElementById('name1').value
                                       + " = "
                                       + ui.draggable.attr("value");*/
                                 $('#javaCodeDiv').html("int"+ " "+ document.getElementById('name1').value
                                       + " = "+ ui.draggable.attr("value"));
                                       
                              }else{
                                 $('#javaCodeDiv').html(dragid+"="+dropid);
                              }

                              ui.draggable.draggable("option",
                                    "revert", false);
                              var droppableOffset = $(this).offset();
                              var x = droppableOffset.left + 1;
                              var y = droppableOffset.top + 1;
                              ui.draggable.offset({
                                 top : y,
                                 left : x
                              });
                           
                        }
                     }

                  });
   });

   $(document).ready(function() {
      $("#images div").sort(function() {
         return Math.random() * 10 > 5 ? 1 : -1;
      }).each(function() {
         $(this).appendTo($(this).parent());
      });
      $("#boards div").sort(function() {
         return Math.random() * 10 > 5 ? 1 : -1;
      }).each(function() {
         $(this).appendTo($(this).parent());
      });

   });
</script>
</head>
<body>

   <div class="pagination-container full-width-container">
      <div class="sized-container">
         <div class="pagination"></div>
      </div>
   </div>
   <div class="viewport full-width-container" style="padding: 5px;">
      <ul class="slide-container">


             <li class="slide" data-tag="page1">
            <div class="sized-container">
            
                  <jsp:include page="contents224.jsp" flush="true" />
               
            </div>
         </li>
         <li class="slide" data-tag="page2">
            <div class="sized-container">
               <div id="c24">
                  <jsp:include page="contents225.jsp" flush="true" />
               </div>
            </div>
         </li>

         <li class="slide" data-tag="page3">
            <div class="sized-container">
               <div id="c25">
                  <jsp:include page="contents223.jsp" flush="true" />
               </div>
            </div>
         </li>
         <li class="slide" data-tag="page4">
            <div class="sized-container">
               <div id="c26">
                  <jsp:include page="contents226.jsp" flush="true" />
               </div>
            </div>
         </li> 
         <li class="slide" data-tag="page5">
            <div class="sized-container">
               <div id="c21">
                  <jsp:include page="contents221.jsp" flush="true" />
               </div>
            </div>
         </li>
         <li class="slide" data-tag="page6">
            <div class="sized-container">

               <div id="c22">
                  <jsp:include page="contents222.jsp" flush="true" />
               </div>
            </div>
         </li>
      </ul>
   </div>


   <div class="full-width-container">
      <div class="button-container sized-container">
         <div id="nextBtnDiv"></div>
         <button class="next">next</button>
         <div id="answerResultDiv"></div>
         <div id="javaCodeDiv"></div>


      </div>
   </div>
</body>
</html>