<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script>
	$(function(){
		$("#images div img").draggable({
			start: function(event,ui) {
				$(this).draggable( "option", "revert", true );
				$("#images div img").css("zIndex",10);
				$(this).css("zIndex",100);
			}
		});
		var count = 0;
		$("#boards div").droppable({
			drop: function(event,ui) {
				var droptitle = $(this).attr("title");
				var drophtml = $(this).html();
				var dragid = ui.draggable.attr("id");
				if( dragid == droptitle ) {
					count++;
					if(count == 4){
						//alert(count);
						$('#showJava').show();
						$('#goNext').show();
					}
					$(this).html('');
					ui.draggable.draggable( "option", "revert", false );
					var droppableOffset = $(this).offset();
					var x = droppableOffset.left + 1;
					var y = droppableOffset.top + 1;
					ui.draggable.offset({ top: y, left: x });
				}
			}
		});
	});
	$(document).ready(function(){
		$("#images div").sort(function(){
			return Math.random()*10 > 5 ? 1 : -1;
		}).each(function(){
			$(this).appendTo( $(this).parent() );    
		});
		$("#boards div").sort(function(){
			return Math.random()*10 > 5 ? 1 : -1;
		}).each(function(){
			$(this).appendTo( $(this).parent() );    
		});
	});
</script>
<style type="text/css">
.home {
	margin-bottom: 10px;
	margin-left: 20px;
}

.javaCode {
	margin-left: 170px;
	margin-top: 10px;
}
.error{
margin-left: 20px;
margin-bottom: 30px;
}
.next{
	margin-left: 170px;
	margin-bottom: 30px;
}
#images > div, #boards > div {float:left;width:100px;height:100px;border:1px solid #000;margin:5px;}
#images div img {width:100px;height:100px;}
#boards {clear:both;}
#boards > div {font-size:2em;line-height:100px;text-align:center;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>Chapter 1 tutorial</title>
</head>
<body style="overflow-x:hidden">
	<form action="contents13" method="get" id="contents13">

		<button id="home" value="home" class="home">HOME</button>
		<button id="javaCode" value="JAVACODE 보기" class="javaCode">JAVACODE
			보기</button>
		<br>
		<br>
		
		<div id="images">
			<div><img src="../resources/img/number2.png" id="int"></div>
			<div><img src="../resources/img/double1.png" id="double"></div>
			<div><img src="../resources/img/ox.png" id="boolean"></div>
			<div><img src="../resources/img/string.png" id="String"></div>
			<!-- <div><img src="http://lorempixel.com/100/100/city" id="city"></div>
			<div><img src="http://lorempixel.com/100/100/sports" id="sports"></div>
			<div><img src="http://lorempixel.com/100/100/animals" id="animals"></div> -->
		</div>
		<div id="boards">
			<div title="int" id="test1">int</div>
			<div title="double" id="test2">double</div>
			<div title="boolean" id="test3">boolean</div>
			<div title="String" id="test3">String</div>
		</div>
		
		<input type="button" id="showJava" value="자바코드로 보기" style="display: none">
		<input type="button" id="goNext" value="다음단계로" style="display: none">
		
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<button id="error" value="Error 확인" class="error">Error 확인</button>
		<button id="next" value="다음 단계로" class="next">다음 단계로</button>
	</form>
</body>
</html>