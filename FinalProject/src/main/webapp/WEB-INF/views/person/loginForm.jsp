<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Input Form UI Design</title>
   <link rel="stylesheet" type="text/css" href="../resources/css/styleLogin.css">
   <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
   <!-- for Google Login -->
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="433159939394-gr0e19pif57u5474g78obq8lseijnfc7.apps.googleusercontent.com">
   <!-- for Google Login -->
   <script type="text/javascript">
   
   function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      var name=profile.getName();
      var email=profile.getEmail();
      var id = profile.getId();
      location.href = 'googleUser?email=' + email + '&name=' + name + '&id=' + id;
     }

   </script>
   
</head>

<body>

   <div class="box">
      <h2>Login</h2>
      
      <form action="login" method="post">
         
         <div class="inputBox">
            <input type="text" id="id" name="id" required="" autofocus>
            <label>User ID</label>
         </div>
         
         <div class="inputBox">
            <input type="password" id="password" name="password" required="">
            <label>Password</label>
         </div>
        
         
                       
         
         <input name="find" type="button" value="Find Id & Password" onclick="location.href='forgot'">
        
         
         <input type="submit" name="" value="Submit">
         
         <!-- div for Google Login -->
         <div class="g-signin2" data-onsuccess="onSignIn" id="my-signin2" data-theme="dark" 
          data-longtitle="true" style="width:auto; height:32px; background-size: cover; 
          border-radius:3px; box-shadow: 0px 0px 0px 2px #4285f4; margin: 1px 3px 1px 1px; 
          display: block;"> </div>  
         
         <input type="button" name="" value="Join" onclick="location.href='joinForm'">   
      
      
      </form>
   </div>
</body>
</html>