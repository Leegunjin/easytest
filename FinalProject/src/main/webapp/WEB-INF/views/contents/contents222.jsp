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
      $("#name1").on('blur', function() {
         var name1 = document.getElementById('name1').value;
         var name11 = document.getElementById('name11');
         name11.innerHTML = "int" + " " + name1 + " = ";
      });
      $("#name2").on('blur', function() {
         var name2 = document.getElementById('name2').value;
         var name22 = document.getElementById('name22');
         name22.innerHTML = "Double" + " " + name2 + " = ";
      });
      $("#name3").on('blur', function() {
         var name3 = document.getElementById('name3').value;
         var name33 = document.getElementById('name33');
         name33.innerHTML = "String" + " " + name3 + " = ";
      });
      $("#name4").on('blur', function() {
         var name4 = document.getElementById('name4').value;
         var name44 = document.getElementById('name44');
         name44.innerHTML = "Boolean" + " " + name4 + " = ";
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
                        if (dragid == droptitle) {
                           count++;
                           if (count == 8) {
                              //alert(count);
                              $('#showJava').show();
                              $('#goNext').show();
                           }
                           //ui.draggable.remove();
                           ui.draggable.hide();
                           if (droptitle == "boolean") {
                              document.getElementById('name44').innerHTML += ui.draggable
                                    .attr("value");
                           }

                           if (droptitle == "string") {
                              document.getElementById('name33').innerHTML += ui.draggable
                                    .attr("value");
                           }
                           if (droptitle == "double") {
                              document.getElementById('name22').innerHTML += ui.draggable
                                    .attr("value");
                           }
                           if (droptitle == "int") {
                              document.getElementById('name11').innerHTML += ui.draggable
                                    .attr("value");
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
         <!--    <div  class="test" contenteditable="true" placeholder="여기에 글자를 입력해주세요."
            style="display: table-cell; vertical-align: middle;" id="name1"></div> -->
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
            <input type="text" id="name2" size="5"
               style="width: max-content; font-size: 10pt; border: 1px; font-weight: bolder; text-align: center;"
               maxlength="5" placeholder="입력하세요">
         </div>
         <div id="name22" class="co"></div>
      </div>
      <div title="string">
         <img src="../resources/img/basket.png" id="string">
         <p style="font-weight: bolder; font-size: 10pt;">String</p>
         <div>
            <input type="text" id="name3" size="5"
               style="width: max-content; font-size: 10pt; font-weight: bolder; border: 1px; text-align: center;"
               maxlength="5" placeholder="입력하세요">
         </div>
         <div id="name33" class="co"></div>
      </div>
      <div title="boolean">
         <img src="../resources/img/basket.png" id="boolean">
         <p style="font-weight: bolder; font-size: 10pt;">Boolean</p>
         <div>
            <input type="text" id="name4" size="5"
               style="width: max-content; font-size: 10pt; font-weight: bolder; border: 1px; text-align: center;"
               maxlength="5" placeholder="입력하세요">
         </div>
         <div id="name44" class="co"></div>
      </div>
   </div>

   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
</body>
</html>