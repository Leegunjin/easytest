<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="google-signin-client_id" content="1013973861169-6idj98k689u967kkqnd3fhcs6n4icjrk.apps.googleusercontent.com">
<!-- <script src="https://apis.google.com/js/api.js"></script> -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="<c:url value="resources/js/jquery-3.2.1.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<c:url value="resources/js/script.js"/>"></script>
<style>
	.g-signin2{
		margin-left: 500px;
		margin-top: 200px;
	}
</style>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="google-signin-client_id" content="285598325955-7nv3156ff0214a3uk2ujfmq8sjtktuta.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value="/resources/js/script.js"/>"></script>

<style type="text/css">
	.g-signin2{
		margin-left: 500px;
		margin-top: 200px;
	}
	
</style>
</head>

<body>

	<!-- <div class="g-signin2" data-onsuccess="onSignIn">
	
	</div>
	<div class="data">
		<p>Profile Details</p>
		<img id="pic" class="img-circle" width="100" height="100"/>
		<p>Email Address</p>
		<p id="email" class="alert alert-danger"></p>
		<button onclick="signOut()" class="btn btn-danger">Sign Out</button>
	</div> -->
	
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<div class="data">
		<p>Profile Details</p>
		<img id="pic" class="img-circle" width="100" height="100"/>
		<p>Email Address</p>
		<div id="email" class="alert alert-danger"></div>
		<!-- <p id="email" class="alert alert-danger"></p> -->
		<button onclick="signOut()" class="btn btn-danger">Sign Out</button>
	</div>

</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ index.jsp ]</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="433159939394-gr0e19pif57u5474g78obq8lseijnfc7.apps.googleusercontent.com">

</head>
<body>
   <div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
      <img id="myImg"><br>
      <p id="name"></p>
      <div id="status">
   </div>
   
   <script type="text/javascript">
      function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      var imagurl=profile.getImageUrl();
      var name=profile.getName();
      var email=profile.getEmail();
      document.getElementById("myImg").src = imagurl;
      document.getElementById("name").innerHTML = name;
      document.getElementById("myP").style.visibility = "hidden";
      document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=success.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>'
   }
   </script>
   
   <button onclick="myFunction()">Sign Out</button>
   
   <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>
</body>
</html>