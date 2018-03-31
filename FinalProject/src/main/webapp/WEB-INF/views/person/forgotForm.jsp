<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<script src="https://smtpjs.com/smtp.js"></script>
<script type="text/javascript">
   $(function() {
      $("#findIdBtn").on("click", function() {
         var email = $('#email').val();
         $.ajax({
            url : "findId",
            type : "POST",
            data : {
               email : email
            },
            dataType : "json",
            success : function(person) {
               if (person != null) {
                  //alert(person.id);
                   var getId = "아이디 : "+person.id;
                     $('#idShowDiv').html(getId);
                     
               } else if (person == null) {
                  alert("존재하지 않는 이메일입니다. 다시 입력해 주세요.");
               }
            },
            error : function(err) {
               alert("존재하지 않는 이메일입니다. 다시 입력해 주세요.");
               console.log(err);
            }
         });
      });
      $("#findPwBtn").on("click", function() {
         var id = $("#id").val();

         $.ajax({
            url : "findPw",
            type : "POST",
            data : {
               id : id
            },
            dataType : "json",
            success : function(map) {
               var pw = '';
               var email = '';
               var randomNum ='';
               var sendTime = '';
               if (map != null) {
                  
                     pw += JSON.stringify(map.foundPw);
                     email += JSON.stringify(map.foundEmail);
                     randomNum += JSON.stringify(map.randomNum);
                     sendTime += JSON.stringify(map.sendTime);
                     
                     console.log("testPw"+pw);
                     console.log("testEmail"+email);
                     console.log("randomNum"+randomNum);
                     console.log("sendTime"+sendTime);
                  
                  
                     var trueemail=email.substring(1,email.length-1);
                     console.log(trueemail);
                        Email.send("kkkhs9216@naver.com",                   //보내는 이메일 계정
                                trueemail,                                //받는 이메일 계정
                                 "[Java Lingo]Password 찾기 Email 입니다. ",         //메일 제목
                                 "인증 번호 : " + randomNum,                   //메일 내용
                                 "smtp.naver.com",                        //네이버smtp
                                 "kkkhs9216@naver.com",                        //네이버 이메일 전체
                                 "scitlingo*");                           //네이버 계정 비밀번호   
                        alert("Email이 전송되었습니다. 인증번호를 입력해 주세요.");
                        
                        var str = '인증 번호 <input type="text" id="userInsertRandomNum" placeholder="인증번호는 5분만 유효합니다.">';
                        str += '<input type="button" id="randomNumCheckButton" value="CHECK">';

                        $('#emailDiv2').html(str);
                        $("#randomNumCheckButton").on("click", function() {
                        
                        var clickYear = new Date().getFullYear();
                        var clickMonth = new Date().getMonth() + 1;
                           if (clickMonth < 10) {
                              clickMonth  = '0' + clickMonth;
                           }
                        var clickDate = new Date().getDate();
                           if (clickDate < 10) {
                              clickDate = '0' + clickDate;
                           }
                        var clickHours = new Date().getHours();
                        var clickMinutes = new Date().getMinutes();
                        var clickSeconds = new Date().getSeconds();
                        
                        console.log("clickDate"+clickDate);
                        console.log("clickHours"+clickHours);
                        console.log("clickMinutes"+clickMinutes);
                        console.log("clickSeconds"+clickSeconds);
                        
                        var checkClickTime = clickDate +""+ clickHours +""+ clickMinutes +""+ clickSeconds;
                        sendTime = sendTime.substring(1,sendTime.length-1);
                        console.log("sendTime.substring : "+ sendTime);
                        console.log("typeof sendTime : "+typeof sendTime);
                        console.log("typeof checkClickTime : "+typeof checkClickTime);
                        var endTime = Number(sendTime);
                        var checkClickTimes = Number(checkClickTime);
                        console.log("typeof sendTime2 : "+typeof endTime);
                        console.log("typeof checkClickTimes : "+typeof checkClickTimes);                        
                        
                           var userInsertRandomNum = $('#userInsertRandomNum').val();
                           
                           console.log("checkClickTimes : " + checkClickTimes);
                           console.log("userInsertRandomNum : " + userInsertRandomNum);
                           
                           if (userInsertRandomNum == randomNum) {
                           console.log("난수와 사용자가 입력한 수가 같음");
                           console.log(endTime);
                           
                           if (checkClickTimes < (endTime + 500)) {
                              console.log("제한시간 5분 이내에 입력함");
                              var str2 = '비밀번호 재설정<input type="password" id="resetPw" placeholder="비밀번호 입력">';
                              str2 += '<input type="password" id="resetPw2" placeholder="비밀번호 재입력">';
                                 str2 += '<input type="button" id="resetPwBtn" value="재설정">';
                                 $('#pwResetDiv').html(str2);
                                 
                                $('#resetPwBtn').on('click', function() {
                                   var resetPw = $('#resetPw').val();
                                   var resetPw2 = $('#resetPw2').val();
                                   console.log("resetPw : "+resetPw);
                                   console.log("resetPw2 : "+resetPw2);
                                   if (resetPw == resetPw2) {
                                      $.ajax({
                                       url : "resetPw",
                                       type : "POST",
                                       data : {
                                          resetPw : resetPw,
                                          id : id
                                       },
                                       dataType : "json",
                                       success : function(result) {
                                          if (result == 1) {
                                             alert("성공적으로 변경되었습니다. 메인 페이지로 자동으로 이동합니다.");
                                          }
                                          
                                          setTimeout(location.href="../",5000);  
                                          
                                       },
                                       error : function(err) {
                                          alert("변경 실패하였습니다.");
                                          console.log(err);
                                       }
                                    });
                                 } else {
                                    alert("비밀번호가 맞지 않습니다. 다시 입력해주세요.");
                                 }
                                   
                              });
                           } 
                        } else if (userInsertRandomNum != randomNum) {
                           alert("인증번호가 맞지 않습니다. ");
                        }
                     });
               }
            },
            error : function(err) {
               alert("fail");
               console.log(err);
            }
         });
      });
   });
</script>
<title>ID, PW 찾기 페이지</title>
</head>
<body>
   <input type="text" id="email" name="email" placeholder="Email">
   <input type="button" value="아이디 찾기" id="findIdBtn">
   <div id="idShowDiv"></div>

   <input type="text" id="id" name="id" placeholder="ID">
   <input type="button" value="비밀번호 찾기" id="findPwBtn">
   <div id="emailDiv2"></div>
   <div id="pwResetDiv"></div>
   <div id="finishDiv"></div>
</body>
</html>