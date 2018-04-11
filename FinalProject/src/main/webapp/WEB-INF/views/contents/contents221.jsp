contents221
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Variable Tutorial - 1</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<style>
#images>div, #boards>div {
   float: right;
   margin: 40px;
   height: 30px;
   width: 40px;
}

#images div img {
   width: 70px;
   height: 70px;
}

#boards {
   clear: both;
   margin-left: 250px;
   margin: 50px;
}

#boards>div {
   font-size: 1.5em;
   text-align: center;
   float: left;
   margin-left: 70px;
}

#boards>div p {
   width: 40px;
   height: 30px;
   text-align: center;
}
</style>
</head>
<body>
   <br>
   <br>

   <div id="images">
      <!--  <div id="im">-->
      <div>
         <img src="../resources/img/calendar.png" title="int">
      </div>
      <div>
         <img src="../resources/img/pizza.png" title="double">
      </div>
      <div>
         <img src="../resources/img/name.png" title="string">
      </div>
      <div>
         <img src="../resources/img/ox.png" title="boolean">
      </div>

   </div>
   <div id="boards">

      <div title="int">
         <img src="../resources/img/basket.png" id="int"
            style="width: 140px; height: 140px; padding-left: 10px; padding-right: 10px;">
         <p style="font-weight: bolder; font-size: 10pt;">int</p>
      </div>
      <div title="double">
         <img src="../resources/img/basket.png" id="double"
            style="width: 140px; height: 140px; padding-left: 10px; padding-right: 10px;">
         <p style="font-weight: bolder; font-size: 10pt;">Double</p>
      </div>
      <div title="string">
         <img src="../resources/img/basket.png" id="string"
            style="width: 140px; height: 140px; padding-left: 10px; padding-right: 10px;">
         <p style="font-weight: bolder; font-size: 10pt;">String</p>
      </div>
      <div title="boolean">
         <img src="../resources/img/basket.png" id="boolean"
            style="width: 140px; height: 140px; padding-left: 10px; padding-right: 10px;">
         <p style="font-weight: bolder; font-size: 10pt;">Boolean</p>
      </div>

   </div>


   <script>
      $(function() {
         $("#images div img").draggable({
            start : function(event, ui) {
               $(this).draggable("option", "revert", true);
               $("#images div img").css("zIndex", 10);
               $(this).css("zIndex", 100);
            }
         });
         var count = 0;
         $("#boards img").droppable({
            drop : function(event, ui) {
               var droptitle = ui.draggable.attr("title");
               var dragid = $(this).attr("id");
               //console.log(droptitle);
               //console.log($(this));
               if (droptitle == dragid) {

                  ui.draggable.hide();
               }
               //ui.draggable.remove();
               ui.draggable.draggable("option", "revert", false);
               var droppableOffset = $(this).offset();
               var x = droppableOffset.left + 1;
               var y = droppableOffset.top + 1;
               ui.draggable.offset({
                  top : y,
                  left : x
               });
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

   <br>
   <br>


</body>
</html>


contents222
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Variable Tutorial - 2</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
   href="../resources/css/styleContents.css">

<script>
   $(function() {
      $("#name1").on('change', function() {
         var name1 = document.getElementById('name1').value;
         var name11 = document.getElementById('name11');
         name11.innerHTML = "int" + " " + name1 + " = ";
         console.log(name11);
      });
      $("#name2").on('change', function() {
         var name2 = document.getElementById('name2').value;
         var name22 = document.getElementById('name22');
         name22.innerHTML = "double" + " " + name2 + " = ";
         console.log(name22);
      });
      $("#name3").on('change', function() {
         var name3 = document.getElementById('name3').value;
         var name33 = document.getElementById('name33');
         name33.innerHTML = "String" + " " + name3 + " = ";
         console.log(name33);
      });
      $("#name4").on('change', function() {
         var name4 = document.getElementById('name4').value;
         var name44 = document.getElementById('name44');
         name44.innerHTML = "boolean" + " " + name4 + " = ";
         console.log(name44);
      });

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
                        //console.log(droptitle);
                        //console.log(ui.draggable.attr("value"));
                        //
                        //}
                        //ui.draggable.remove();
                        if (droptitle == dragid) {
                        
                           ui.draggable.hide();
                           if (droptitle == "boolean") {
                              document.getElementById('name44').innerHTML = "Boolean"
                                    + " "
                                    + document.getElementById('name4').value
                                    + " = "
                                    + ui.draggable.attr("value");
                           }
   
                           if (droptitle == "string") {
                              document.getElementById('name33').innerHTML = "String"
                                    + " "
                                    + document.getElementById('name3').value
                                    + " = "
                                    + ui.draggable.attr("value");
                           }
                           if (droptitle == "double") {
                              document.getElementById('name22').innerHTML = "Double"
                                    + " "
                                    + document.getElementById('name2').value
                                    + " = "
                                    + ui.draggable.attr("value");
                           }
                           if (droptitle == "int") {
                              document.getElementById('name11').innerHTML = "Int"
                                    + " "
                                    + document.getElementById('name1').value
                                    + " = "
                                    + ui.draggable.attr("value");
                           }
   
                           ui.draggable.draggable("option", "revert",
                                 false);
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
      /**var a = $(".test").attr("id");
      console.log(a);
      var a = $("#name").html();
      console.log(a);*/
      /* var a= $(".test").text();
      alert(a); */

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

   <div id="images">
      <div>
         <img src="../resources/img/true.png" title="boolean" value="true">
      </div>
      <div>
         <img src="../resources/img/false.png" title="boolean" value="false">
      </div>
      <div>
         <img src="../resources/img/num2.png" title="int" value="2">
      </div>
      <div>
         <img src="../resources/img/num3.png" title="int" value="3">
      </div>
      <div>
         <img src="../resources/img/num9.png" title="int" value="9">
      </div>
      <div>
         <img src="../resources/img/Stringa.png" title="string" value="A">
      </div>
      <div>
         <img src="../resources/img/Stringr.png" title="string" value="R">
      </div>
      <div>
         <img src="../resources/img/Strings.png" title="string" value="S">
      </div>
      <div>
         <img src="../resources/img/double1.png" title="double" value="1.25">
      </div>
      <div>
         <img src="../resources/img/double2.png" title="double" value="9.9">
      </div>

   </div>
   <div id="boards">
      <div title="int">

         <img src="../resources/img/basket.png" id="int">
         <p style="font-weight: bolder; font-size: 10pt;">int</p>
         <div>
            <input type="text" id="name1" size="6"
               style="width: max-content; font-size: 10pt; font-weight: bolder; border: 1px; text-align: center;"
               maxlength="5" placeholder="입력하세요">
         </div>
         <div id="name11" class="co"></div>
      </div>
      <div title="double">
         <img src="../resources/img/basket.png" id="double">
         <p style="font-weight: bolder; font-size: 10pt;">Double</p>
         <div>
            <input type="text" id="name2" size="6"
               style="width: max-content; font-size: 10pt; font-weight: bolder; border: 1px; text-align: center;"
               maxlength="5" placeholder="입력하세요">
         </div>
         <div id="name22" class="co"></div>
      </div>
      <div title="string">
         <img src="../resources/img/basket.png" id="string">
         <p style="font-weight: bolder; font-size: 10pt;">String</p>
         <div>
            <input type="text" id="name3" size="6"
               style="width: max-content; font-size: 10pt; font-weight: bolder; border: 1px; text-align: center;"
               maxlength="5" placeholder="입력하세요">
         </div>
         <div id="name33" class="co"></div>
      </div>
      <div title="boolean">
         <img src="../resources/img/basket.png" id="boolean">
         <p style="font-weight: bolder; font-size: 10pt;">Boolean</p>
         <div>
            <input type="text" id="name4" size="6"
               style="width: max-content; font-size: 10pt; font-weight: bolder; border: 1px; text-align: center;"
               maxlength="5" placeholder="입력하세요">
         </div>
         <div id="name44" class="co"></div>
      </div>
   </div>

</body>
</html>

contents22
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>변수 예제</title>
<style type="text/css">
@charset "UTF-8";

*, html, body {
   font-family: "TrebuchetMS", trebuchet, sans-serif;
}

* {
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}

h1, h2 {
   text-align: center;
}

h1 {
   font-size: 24px;
   line-height: 30px;
   font-weight: bold;
}

h2 {
   font-size: 15px;
   line-height: 25px;
   margin-top: 10px;
}

button {
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   border: 0;
   padding: 7px 25px;
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
   max-width: 1100px;
   width: 600px;
   margin: 0 auto;
   width: 80%;
}

.slide-container {
   position: relative;
   height: 500px;
   left: 0;
   overflow: hidden;
}

.slide {
   float: left;
}

.slide .sized-container {
   padding: 5px 10px;
}

.button-container {
   border-top: 1px solid black;
   overflow: hidden;
   padding-top: 15px;
}

.button-container button {
   float: right;
   margin-left: 30px;
}

.pagination-container {
   margin-top: 60px;
}

.pagination {
   width: 100%;
   text-align: center;
   padding: 45 25px;
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
   content: "?";
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
</style>
<script type="text/javascript"
   src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
   $(function() {
      var currentSlide = 0, $slideContainer = $('.slide-container'), $slide = $('.slide'), slideCount = $slide.length, animationTime = 300;

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

      function goToNextSlide() {
         if (currentSlide >= slideCount - 1)
            return;
         var windowWidth = $(window).width();
         currentSlide++;
         $slideContainer.animate({
            left : -(windowWidth * currentSlide)
         });
         setActiveIndicator();
         $('.progress-bar').eq(currentSlide - 1).animate({
            width : '100%'
         }, animationTime);
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
      $('.next').on('click', goToNextSlide);
      $('.previous').on('click', goToPreviousSlide);
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
         <li class="slide" data-tag="Chapter Info">
            <div class="sized-container">
               <div id="">
                  <jsp:include page="contents221.jsp" flush="true" />
               </div>
            </div>
         </li>
         <li class="slide" data-tag="Concept">
            <div class="sized-container">

               <div id="">
                  <jsp:include page="contents222.jsp" flush="true" />
               </div>
            </div>
      </ul>
   </div>
   <div class="full-width-container">

      <div class="button-container sized-container">
         <button class="javaCode">JAVACODE 보기</button>
         <button class="next">next</button>
         <button class="previous">previous</button>
      </div>
   </div>


</body>
</html>