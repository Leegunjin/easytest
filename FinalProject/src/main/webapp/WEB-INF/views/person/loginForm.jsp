<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- for Google Login -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="433159939394-gr0e19pif57u5474g78obq8lseijnfc7.apps.googleusercontent.com">

<style type="text/css">
.account-box
{
    border: 2px solid rgba(153, 153, 153, 0.75);
    border-radius: 2px;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    -khtml-border-radius: 2px;
    -o-border-radius: 2px;
    z-index: 3;
    font-size: 13px !important;
    font-family: "Helvetica Neue" ,Helvetica,Arial,sans-serif;
    background-color: #ffffff;
    padding: 20px;
}

.logo
{
    width: 138px;
    height: 30px;
    text-align: center;
    margin: 10px 0px 27px 40px;
    background-position: 0px -4px;
    position: relative;
}

.forgotLnk
{
    margin-top: 10px;
    display: block;
}

.purple-bg
{
    background-color: #6E329D;
    color: #fff;
}
.or-box
{
    position: relative;
    border-top: 1px solid #dfdfdf;
    padding-top: 20px;
    margin-top:20px;
}
.or
{
    color: #666666;
    background-color: #ffffff;
    position: absolute;
    text-align: center;
    top: -8px;
    width: 40px;
    left: 90px;
}
.account-box .btn:hover
{
    color: #fff;
}

</style>

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

<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
        <div class="col-md-3 col-md-offset-4">
            <div class="account-box">
                <div class="logo ">
                    <img src="http://placehold.it/90x38/fff/6E329D&text=LOGO" alt=""/>
                </div>
                <form action="login" id="login" method="post" class="form-signin">
	                <div class="form-group">
	                    <input type="text" class="form-control" id="id" name="id" placeholder="Id or Email" required autofocus />
	                </div>
	                <div class="form-group">
	                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
	                </div>
	                <label class="checkbox">
	                    <input type="checkbox" value="remember-me" />
	                    Keep me signed in
	                </label>
	                <button class="btn btn-lg btn-block purple-bg" type="submit">
	                    Sign in</button>
                </form>
                <a class="forgotLnk" href="forgot">ID, Password 찾기</a>
                <div class="or-box">
                    <span class="or">OR</span>
                         <!-- div for Google Login -->
                    	<div class="g-signin2" data-onsuccess="onSignIn" id="my-signin2" data-theme="dark" data-longtitle="true"></div>
                </div>
                <div class="or-box row-block">
                    <div class="row">
                        <div class="col-md-12 row-block">
                            <a href="joinForm" class="btn btn-primary btn-block">회원가입 할래?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</html>