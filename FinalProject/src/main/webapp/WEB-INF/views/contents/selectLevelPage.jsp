<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>셀렉트 레벨 페이지</title>

<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

$(function(){
   $('img').each(function(){
      $(this).addClass('notClear');
      var thisLevel = $(this).attr('id');
      //클리어 했으면
      if(thisLevel < ${clearLevel}){
         $(this).removeClass('notClear');
         $(this).addClass('clear');
         $(this).attr('disabled', true);
         $(this).on('click',function(){
            var level = $(this).attr('id');
            location.href = 'contents' + level;
            //alert(level);
         })
      }
   })
   
});
</script>

<style type="text/css">
.background{
   background-color: yellow;
   width: auto;
   height: auto;
   padding-top: 100px;
   padding-left: 20%;
   padding-right: 20%;
}

.left{
   background-color: green;
   display: block;
}

.trophy3{
   margin-left: 80px;
}

.trophy {
   float: left;
   margin-left: 150px;
   /* background-color: #ebeef4; */
}

.notClear{
   opacity: 0.5;
}

.clear{
   width: 150px;
   height: 150px;
   opacity: 1;
}

.trophy img{
   width: 150px;
   height: 150px;
}

</style>
</head>
<body>

<form action="selectLevelPage" method="get" id="selectLevelPage" class="level">
   <!-- 전체 div -->
   <div class="background">
      <!-- 왼쪽 div -->
      <div class="left">
         <div id="trophy" class="trophy">
            <img alt="icon1" src="../resources/img/icon1.png" id="11"> 
            <img alt="icon2" src="../resources/img/icon2.png" id="12">
            <br> <br> 
            <img alt="icon3" src="../resources/img/icon3.png" id="21"> 
            <img alt="icon4" src="../resources/img/icon4.png" id="22">
            <br> <br> 
            <img alt="icon5" src="../resources/img/icon5.png" id="31"> 
            <img alt="icon6" src="../resources/img/icon6.png" id="32">
            <br> <br> 
            <img alt="icon12" src="../resources/img/icon12.png" id="71" class="trophy3"> 
            <br> <br> 
            <img alt="icon7" src="../resources/img/icon7.png" id="41">
            <img alt="icon8" src="../resources/img/icon8.png" id="42"> 
            <br> <br> 
            <img alt="icon9" src="../resources/img/icon9.png" id="51">
            <img alt="icon10" src="../resources/img/icon10.png" id="52"> 
            <br> <br> 
            <img alt="icon12" src="../resources/img/icon12.png" id="72" class="trophy3"> 
            <br> <br> 
            <img alt="icon11" src="../resources/img/icon11.png" id="61">
            <img alt="icon1" src="../resources/img/icon1.png" id="62"> 
            <br> <br> 
            <img alt="icon12" src="../resources/img/icon12.png" id="73" class="trophy3"> 
            <br> <br>
         </div>
      </div>
      <!-- 오른쪽 div -->
      <div class="right">
         
         <div>
         
         </div>
      </div>
   </div>
</form>
</body>
</html>