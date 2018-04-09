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
               console.log(droptitle);
               console.log($(this));
               if (dragid == droptitle) {
                  count++;
                  if (count == 4) {
                     //alert(count);
                     $('#showJava').show();
                     //$('#goNext').show();
                  }
                  ui.draggable.remove();
                  ui.draggable.draggable("option", "revert", false);
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

   <br>
   <br>


</body>
</html>