<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   
   <link rel="stylesheet" type="text/css" href="../resources/css/styleLogin.css">
   <script type="text/javascript" src="<c:url value="../resources/js/jquery-3.2.1.js"/>"> 
   </script>
   
   <title>Input Form UI Design</title>
   
   <script type="text/javascript">
   $(function(){
         if(${errMsg != null}){
            alert('${errMsg}');
         }
            
         $('#id').on('blur',function(){   //blur 말고 focusout 써봐
            var id = $('#id').val();
            $.ajax({
               url : "idCheck",
               type : "POST",
               dataType : "json",
               //contentType : "application/json; charset=utf-8",   
               data : {                        
                  id : id
               },
               success : function(flag){
                  if(flag == true){
                     $('#idCheck').removeClass('idCheck_false');
                     $('#idCheck').addClass('idCheck_true');
                     $('#idCheck').html("사용 가능한 아이디 입니다.");
                     $('#idCheck').css("color", "#85dafe");
                  }else{
                     $('#idCheck').removeClass('idCheck_true');
                     $('#idCheck').addClass('idCheck_false');
                     $('#idCheck').html("사용할 수 없는 아이디 입니다");
                     $('#idCheck').css("color", "#808080");
                  }
               },
               error : function(){
                  
               }
            });
         });
         
         
         $('#joinForm').on('submit',function(){
            var idCheck = $('#idCheck').attr('class');
            console.log(idCheck);
            
            if($('#idCheck').attr('class') == 'idCheck_false'){
               alert("사용 불가능한 아이디 입니다");
               $('#id').focus();
               return false;
            }
            else if($('#password').val() != $('#password2').val()){
               alert("비밀번호가 일치하지 않습니다");
               $('#password').val() = '';
               $('#password2').val() = '';
               $('#password').focus();
               return false;
               //왜 비번을 다르게 해도 회원가입이 되는가
            }
            else{
               return true;
            }
         });
      });
   </script>
   
</head>

<body>

   <div class="box">
      <h2>Join</h2>
      
      <form action="join" method="post" id="joinForm">
         
         <div class="inputBox">
            <input type="text" id="id" name="id" required autofocus>
            <label>User ID</label>
            <div id="idCheck">　</div>
         </div>
         
         <div class="inputBox">
            <input type="password" id="password" name="password" required>
            <label>Password</label>
         </div>
         
         <div class="inputBox">
            <input type="password" id="password2" name="password2" required>
            <label>Re Password</label>
         </div>
         
         <div class="inputBox">
            <input type="text" id="name" name="name" required>
            <label>Name</label>
         </div>
         
         <div class="inputBox">
            <input type="text" id="email" name="email" required>
            <label>Email</label>
         </div>
         
         <div class="inputBoxHalf">
            <input type="radio" name="radio" value="admin">admin   
            <input type="radio" name="radio" value="user" checked="checked">user
            
         </div>
         
         <input type="submit" name="" value="join">
         <input type="button" name="" value="Main Page" 
         onclick="location.href='../home'">   
      
      
      </form>
   </div>
</body>
</html>