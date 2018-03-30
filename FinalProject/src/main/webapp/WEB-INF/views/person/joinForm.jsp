<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<c:url value="../resources/js/jquery-3.2.1.js"/>"> </script>

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
.btn-facebook
{
    background-color: #3F639E;
    color: #fff;
    font-weight:bold;
}
.btn-google
{
    background-color: #454545;
    color: #fff; 
    font-weight:bold;
    width: 220px;
    text-align: center;
}



</style>


<script type="text/javascript">

//가입폼 확인
function formCheck() {
	var id = document.getElementById('id');
	var pw = document.getElementById('password');
	var name = document.getElementById('name');
	var email = document.getElementById('email');
	
	if (id.value.length < 3 || id.value.length > 10) {
		alert("ID는 3~10자로 입력하세요.");
		id.focus();
		id.select();
		return false;
	}
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	/* if (pw.value != pw2.value) {
		alert("비밀번호를 정확하게 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	} */
	if (name.value == '') {
		alert("이름을 입력하세요.");
		name.focus();
		name.select();
		return false;
	}
	
	
	return true;
}


 
 $(function(){
   $('#id').on('focusout',function(){   //blur 말고 focusout 써봐
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
          
        	 
        	 
        	 if(flag == 0){
               $('#idCheck').removeClass('idCheck_false');
               $('#idCheck').addClass('idCheck_true');
               $('#idCheck').html("사용 가능한 아이디 입니다.");
            }else{
               $('#idCheck').removeClass('idCheck_true');
               $('#idCheck').addClass('idCheck_false');
               $('#idCheck').html("사용할 수 없습니다");
            }
         
         
            $('#submit').on('click',function(){   //blur 말고 focusout 써봐
            	/*  var id = $('#id').val(); */
            	var id = document.getElementById('id');
				
            	
            	if(flag == 0){ // 제가 만든 히오스 코드 
            		
            		
            		console.log("트루" + flag);
            		
            		return true;
                 }
            	else if(flag == 1){
            		
            		
                   alert("ss");
            		
                   id.focus();
           		   id.select();
           		
           		flag == 0;
           		console.log("펄스" + flag);
           		
           		
           		return false;
                 }
            });
        
         },
         error : function(){
            
         }
     
         
      });
   }); 
 }); 



</script>

</head>

<!------ Include the above in your HEAD tag ---------->
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3 col-md-offset-4">
            <div class="account-box">
                <div class="logo ">
                    <img src="http://placehold.it/90x38/fff/6E329D&text=LOGO" alt=""/>
                </div>
                
                <form class="form-signin" action="join" method="post" onsubmit="return formCheck();">
               
                
                
                <div class="form-group">
                    <input id="id" name="id" type="id" class="form-control" placeholder="id" 
                    required autofocus/>
              
                
                <div id="idCheck">　 </div>
                </div>
                
                
                
                <div class="form-group">
                    <input id="password" name="password" type="password" class="form-control" placeholder="Password" 
                    required />
                </div>
                
                <div class="form-group">
                    <input id="name" name="name" type="name" class="form-control" placeholder="name" required />
                </div>
                
                <div class="form-group">
                    <input id="email" name="email" type="email" class="form-control" placeholder="email" required />
                </div>
                
                
             
                <button id="submit" class="btn btn-lg btn-block purple-bg" type="submit">
                   		회원가입</button>
                
                </form>
                
                <div class="or-box">
                    <span class="or">OR</span>
                    <div class="row">
                        
                          
                        <div class="col-md-6 row-block">
                            <a href="/easycodingu" class="btn btn-google btn-block">
                          	메인으로 돌아가기
                            </a>
                        </div>
                    
                    </div>
                </div>
                
                
                <!-- <div class="or-box row-block">
                    <div class="row">
                        <div class="col-md-12 row-block">
                            <a href="http://www.jquery2dotnet.com" class="btn btn-primary btn-block">Create New Account</a>
                        </div>
                    </div>
                </div> -->
            
            
            </div>
        </div>
    </div>
</div>
</body>
</html>