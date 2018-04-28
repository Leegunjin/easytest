<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
       <title>My Page </title>
      
       <link rel="stylesheet" type="text/css" href="../resources/css/styleMyPage.css">
       <link href="http://fonts.googleapis.com/css?family=Quicksand:500" 
              rel="stylesheet">
       <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
   
       <script type="text/javascript">

      function goHome() { location.href = "../../easycodingu/home"; }
      function myPage() { location.href = "../person/mypageUser"; } 
       
       </script>
       
       <!-- 프로필 사진 바꾸는 스크립트 -->
       <script type="text/javascript">
         
         $(document).ready(function() {
            var acceptInput = true;

            /* CLASSES */
            var Images = new function() {
                  var urls = {
                        1: 'https://semantic-ui.com/images/avatar2/large/matthew.png',
                        2: 'https://semantic-ui.com/images/avatar2/large/elyse.png',
                        3: 'https://semantic-ui.com/images/avatar2/large/kristy.png',
                        4: 'https://semantic-ui.com/images/avatar2/large/rachel.png',
                        5: 'https://semantic-ui.com/images/avatar2/large/mark.png',
                        6: 'https://semantic-ui.com/images/avatar2/large/lena.png',
                        7: 'https://semantic-ui.com/images/avatar2/large/eve.png'
                  };

                  this.get = function(i) {
                        return urls[i];
                  }
            };

            var Storage = new function() {
                  this.put = function(key, value) {
                        if (typeof Storage !== "undefined") {
                              localStorage.setItem(key, value);
                        } else {
                              console.warn('localStorage is not supported on your browser!');
                              return false;
                        }
                  }

                  this.get = function(key) {
                        if (typeof Storage !== "undefined") {
                              if (localStorage[key]) {
                                    return localStorage[key];
                              } else {
                                    console.warn('The requested key "' + key + '" doesn\'t exist in localStorage!');
                                    return false;
                              }
                        } else {
                              console.warn('localStorage is not supported on your browser!');
                              return false;
                        }
                  }
            };

            var User = new function() {
                  this.username = 'Schlipak';
                  this.image = 1;
                  this.imageURL = Images.get(this.image);

                  this.setUsername = function(n) {
                        this.username = n;
                  }

                  this.setImage = function(i) {
                        this.image = i;
                  }

                  this.refreshFromStorage = function() {
                        this.username = Storage.get('devwars2_username');
                        if (!this.username || this.username == 'false') {
                              this.username = '';
                        }
                        this.image = Storage.get('devwars2_image');
                        this.imageURL = Images.get(this.image);
                  }

                  this.update = function() {
                        $('.ls-image').attr('src', this.imageURL);
                        $('.sidebar-user-image').css({
                              backgroundImage: 'url(' + this.imageURL + ')'
                        });

                        $('.ls-username').val(this.username).html(this.username);
                  }
            };

            var Login = new function() {
                  this.container = $('.login-container');
                  this.box = $('.login-box');
                  this.imageSelector = $('.pp-select');
                  this.signIn = $('.signin-confirm');
                  this.usernameInput = $('.signin-username');

                  this.getInputUsername = function() {
                        return this.usernameInput.val();
                  }

                  this.onImageSelect = function(callback) {
                        this.imageSelector.click(callback);
                  }

                  this.onSignIn = function(callback) {
                        this.signIn.click(callback);
                  }

                  this.setUsernameError = function(b) {
                        if (b) {
                              this.usernameInput.css({
                                    borderBottom: ''
                              });
                        } else {
                              this.usernameInput.css({
                                    borderBottom: '2px solid #F44336'
                              });
                        }
                  }

                  this.display = function(t) {
                        this.box
                              .removeClass('dismissing')
                              .parent()
                              .animate({
                                    opacity: 1
                              }, t);
                  }

                  this.dismiss = function(t) {
                        this.box
                              .addClass('dismissing')
                              .parent()
                              .animate({
                                    opacity: 0
                              }, t);
                  }

                  this.hide = function() {
                        this.container.addClass('hidden');
                  }

                  this.show = function() {
                        this.container.removeClass('hidden');
                  }
            };

            var OS = new function() {
                  this.taskbar = $('.os.taskbar');
                  this.userLogin = $('.relogin');
                  this.hangoutsIcon = $('.icon.hangouts');

                  this.hideTaskbar = function() {
                        this.taskbar.addClass('hidden');
                  }

                  this.showTaskbar = function() {
                        this.taskbar.removeClass('hidden');
                  }

                  this.onUserLogin = function(callback) {
                        this.userLogin.click(callback);
                  }

                  this.setHangoutsState = function(b) {
                        if (b) {
                              this.hangoutsIcon.addClass('opened');
                        } else {
                              this.hangoutsIcon.removeClass('opened');
                        }
                  }

                  this.toggleHangoutsState = function() {
                        this.setHangoutsState(!this.getHangoutsState());
                  }

                  this.getHangoutsState = function() {
                        return this.hangoutsIcon.hasClass('opened');
                  }
            };

            var Hangouts = new function() {
                  this.acceptInput = true;

                  this.container = $('section.hangouts-container');
                  this.contents = $('.hangouts-global-contents');
                  this.ripple = $('.ripple.window');

                  this.hideContainer = function() {
                        this.container.addClass('hidden');
                  }

                  this.showContainer = function() {
                        this.container.removeClass('hidden');
                  }

                  this.setContainerVisible = function() {
                        this.container.addClass('visible');
                  }

                  this.setContainerInvisible = function() {
                        this.container.removeClass('visible');
                  }

                  this.showContents = function() {
                        this.contents.addClass('visible');
                  }

                  this.hideContents = function() {
                        this.contents.removeClass('visible');
                  }

                  this.activateRipple = function() {
                        this.ripple.addClass('active');
                  }

                  this.deactivateRipple = function() {
                        this.ripple.removeClass('active');
                  }

                  this.toggle = function() {
                        if (!this.acceptInput) return;

                        this.acceptInput = false;
                        OS.toggleHangoutsState();

                        if (OS.getHangoutsState()) {
                              this.showContainer();
                              this.activateRipple();

                              setTimeout(function() {
                                    Hangouts.setContainerVisible();
                                    Hangouts.showContents();

                                    Hangouts.acceptInput = true;
                              }, 400);
                        } else {
                              this.deactivateRipple();
                              this.setContainerInvisible();
                              this.hideContents();

                              setTimeout(function() {
                                    Hangouts.hideContainer();
                                    Hangouts.acceptInput = true;
                              }, 400);
                        }

                  }

                  this.close = function() {
                        OS.setHangoutsState(false);
                        this.deactivateRipple();
                        this.setContainerInvisible();
                        this.hideContents();

                        setTimeout(function() {
                              Hangouts.hideContainer();
                        }, 400);
                  }
            };

            /* SCRIPT */

            (function() {
                  User.refreshFromStorage();
                  User.update();
            })();

            Login.onImageSelect(function() {
                  var imgid = $(this).attr('data-imageid');
                  var imgurl = Images.get(imgid);
                  Storage.put('devwars2_image', imgid);

                  User.refreshFromStorage();
                  User.update();
            });

            Login.onSignIn(function() {
                  var username = Login.getInputUsername();
                  Login.setUsernameError(username.length != 0);

                  if (username.length != 0) {
                        Storage.put('devwars2_username', username);
                        User.refreshFromStorage();
                        User.update();

                        Login.dismiss(600);

                        OS.showTaskbar();

                        setTimeout(function() {
                              Login.hide();
                        }, 600);
                  }
            });

            OS.onUserLogin(function() {
                  Login.show();
                  Login.display(600);

                  Hangouts.close();

                  OS.hideTaskbar();
            });
      
         });
         
         </script>
       
       
       
       <!-- 상단 내비게이션바에 출력하는 실시간 시계 -->
       <script>
          setInterval("dpTime()",1000);
           
             function dpTime(){
               
                var now = new Date();
               
                hours = now.getHours();
                minutes = now.getMinutes();
                seconds = now.getSeconds();
        
               /* 여기 주석을 풀면 12시간제로 표기 
                if (hours > 12){
                   hours -= 12;
                   ampm = "오후 ";
                } 
                else {
                   ampm = "오전 ";
                    }
                
                if (hours < 10) {
                   hours = "0" + hours;
                  } */
               
                if (minutes < 10) {
                   minutes = "0" + minutes;
                  }
                
                  if (seconds < 10){
                   seconds = "0" + seconds;
                  }
       
                  document.getElementById("timeNav").innerHTML = hours + ":" + minutes + ":" + seconds;
             }
      </script>
      
      
      
      <script type="text/javascript">
      
      
      /* 글자 클릭하면 div 나왔다 들어갔다 관련하는 script */
      $(document).ready(function() {
         
         /* 정보수정 글자를 클릭하면 */
          $("#liClick_Modify").click(function() {
               
             /* 왼쪽에서 div가 튀어나옴 */
             $(".btmMain").fadeIn(400);
             $(".btmOpenDiv_Modify").animate({left:"-30.5%"});
               
          });
            
            
          /* 튀어나온 div를 클릭하면 */    
         $(".modifyClose").click(function() {
            
            /* 다시 들어감 */   
            $(".btmOpenDiv_Modify").animate({left:"0%"});
         });
          
          
          
          
          
         /* 정보수정 글자를 클릭하면 */
          $("#liClick_Mail").click(function() {
               
             /* 왼쪽에서 div가 튀어나옴 */
             $(".btmMain").fadeIn(400);
             $(".btmOpenDiv_Mail").animate({left:"-30.5%"});
               
          });
            
            
          /* 튀어나온 div를 클릭하면 */    
         $(".mailClose").click(function() {
            
            /* 다시 들어감 */   
            $(".btmOpenDiv_Mail").animate({left:"0%"});
         }); 
          
          
          
         
         
         /* 뱃지 글자를 클릭하면 */
         $("#liClick_1").click(function() {
            
            /* 왼쪽에서 div가 튀어나옴 */
            $(".btmMain").fadeIn(400);
            $(".btmOpenDiv_1").animate({left:"70%"});
            
         });
         
         /* 화면 안에 오른쪽 버튼 클릭하면 */
         $(".badgeClosePage").click(function() {
            
            /* 다시 들어감 */
            $(".btmOpenDiv_1").animate({left:"0%"});
         }); 
          
         /* 트로피 글자를 클릭하면 */
          $("#liClick_2").click(function() {
               
             /* 왼쪽에서 div가 튀어나옴 */
             $(".btmMain").fadeIn(400);
             $(".btmOpenDiv_2").animate({left:"70%"});
               
          });
            
          /* 화면 안에 오른쪽 버튼 클릭하면 */    
         $(".trophyClosePage").click(function() {
            
            /* 다시 들어감 */   
            $(".btmOpenDiv_2").animate({left:"0%"});
         });  
          
      });
      
      </script>

   
      <!-- 수정폼 유효성 체크 -->
      <script type="text/javascript">
      
      $(function() 
      {
              
         $('#modifyCheck').submit(function() {
            var name = $('#name').val();
            var name2 = $('#name2').val();
            var password = $('#password').val();
            var password2 = $('#password2').val();
               
            if(name == "") { 
               alert('오류 : id칸에 공백이 있습니다.'); 
               name.focus(); return false; 
            }   
               
            if(name == name2) { 
               alert('오류 : 같은 id는 입력 할 수 없습니다.'); 
               return false; 
            }                                                                                                           
               
               
            if(password == "") {
               alert('오류 : 비밀번호칸에 공백이 있습니다.'); 
               return false; 
            }
            
            if(password != password2) {
               alert('오류 : 같은 비밀번호를 입력해주세요.'); 
               return false; 
            }
               
         });
              
         return true;
      });
      
      </script>
      
      
      
      <script type="text/javascript">
      
      
      var curry = function curry(f) {
           return function () {
             for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {if (window.CP.shouldStopExecution(1)){break;}
               args[_key] = arguments[_key];
             }
         window.CP.exitedLoop(1);


             return args.length >= f.length ? f.apply(undefined, args) : curry(f.bind.apply(f, [f].concat(args)));
           };
         };

         var compose = function compose(f, g) {
           return function (x) {
             return f(g(x));
           };
         };
         var composeN = function composeN() {
           for (var _len2 = arguments.length, fns = Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {if (window.CP.shouldStopExecution(2)){break;}
             fns[_key2] = arguments[_key2];
           }
         window.CP.exitedLoop(2);


           return function () {
             for (var _len3 = arguments.length, args = Array(_len3), _key3 = 0; _key3 < _len3; _key3++) {if (window.CP.shouldStopExecution(3)){break;}
               args[_key3] = arguments[_key3];
             }
         window.CP.exitedLoop(3);


             return fns.reverse().reduce(function (x, f) {
               return f.apply(f, [].concat(x));
             }, args);
           };
         };
      
      
      </script>
   
   
   </head>  
    
   <body style="overflow-x:hidden; overflow-y:hidden">
  
        <!-- 여기에 내비게이션 바가 들어갈거임 -->
        <div class="topArea">
  
           <div class='login-container'>
          
             <div class='login-box'>
                            
                  <div class='login-cover'>
                    <span> ${sessionScope.loginName } </span>
                       <div class='login-pp-container'>
                         <img class='login-pp ls-image' 
                         src='https://semantic-ui.com/images/avatar2/large/matthew.png'>
                       </div>
                  </div>
              
               <div class='login-form'>
                 
                    <div class='line'>
                         <img class='pp-select button' data-imageid='1' 
                             src='https://semantic-ui.com/images/avatar2/large/matthew.png'>
                         <img class='pp-select button' data-imageid='2' 
                             src='https://semantic-ui.com/images/avatar2/large/elyse.png'>
                         <img class='pp-select button' data-imageid='3' 
                             src='https://semantic-ui.com/images/avatar2/large/kristy.png'>
                         <img class='pp-select button' data-imageid='4' 
                             src='https://semantic-ui.com/images/avatar2/large/rachel.png'>
                         <img class='pp-select button' data-imageid='5' 
                             src='https://semantic-ui.com/images/avatar2/large/mark.png'>
                         <img class='pp-select button' data-imageid='6' 
                             src='https://semantic-ui.com/images/avatar2/large/lena.png'>
                         <img class='pp-select button' data-imageid='7' 
                             src='https://semantic-ui.com/images/avatar2/large/eve.png'>
                    </div>
                 
                    <!-- 얘를 없애면 버튼을 눌러도 프로필이 수정되지 않는다 -->
                    <div class='line ls-username' style="display: none;">
                      <input class='signin-username ls-username' type='text' placeholder="Name" >
                    </div>
                 
                    <!-- 프로필 바꾸는 버튼 -->
                    <div class='line centered'>
                      
                      <button class='waves-effect waves-classic waves-light waves-button waves-float signin-confirm'>
                        Change Profile
                        <i class='zmdi zmdi-sign-in'></i>
                      </button>
                    
                    </div>
               
                  </div> <!-- login-form 끝 -->
             </div> <!-- login-box 끝 -->
           </div> <!-- login-container 끝 -->
  
           <nav class='os taskbar hidden'>
   
             <div class='right'>
              
                 <div class='right-container'>
        
                    <!-- 왼쪽에 있는 버튼 -->
                    <div class='user button relogin'>
                      <img class='ls-image' 
                            src='https://semantic-ui.com/images/avatar2/large/matthew.png'>
                    </div>
                    
                    <div class="navFix">
                        
                        <div class="stage">
                        
                        <div class="navWrapper">
                         
                            <div class="slash"></div>
                            
                               <div class="sides">
                                    <div class="side"></div>
                                    <div class="side"></div>
                                    <div class="side"></div>
                                    <div class="side"></div>
                               </div>
                               
                               <div class="text">
                                 
                                  <div class="text--backing"> ${sessionScope.loginName }</div>
                                 
                                    <div class="text--left">
                                      <div class="inner"> ${sessionScope.loginName }</div>
                                    </div>
                                 
                                    <div class="text--right">
                                      <div class="inner"> ${sessionScope.loginName }</div>
                                    </div>
                               
                               </div>
                         </div>
                     </div> 
                    </div> <!-- navFix 끝 (세션스코프 이름) -->
            
                  
                  
                  <!-- <div class="navProgress">
                  
                  
                  </div> -->
                  
                  <!-- 시간을 띄워 줄 div -->        
                    <div id='timeNav'> </div>
      
                  </div>
                </div>
           </nav>
       </div>　<!-- topArea 끝 -->
  
  
      <!-- 실제 컨텐츠는 여기 -->
      <div class="bottomArea"> 
      
         <div class="btmOpenDiv_Modify">
         
            <div class="modify">   
            
               <form action="modify" method="post" id="modifyCheck"> 
                  <input type="hidden" id="name2" name="name2" value="${sessionScope.loginName }">
       
                  <label> Name </label>
                  <input type="text" id="name" name="name" value="${sessionScope.loginName }">
      
                  <label> Password </label>
                  <input type="password" id="password" name="password" value="${person.password }">
      
                  <label> Re Password  </label>
                  <input type="password" id="password2">
      
                  <input type="submit" value="Submit">
               </form>

               <button class="modifyClose"> Close </button>

             </div> <!-- modify 끝 -->
         </div> <!-- btmOpenDiv_Modify 끝 -->
         
         
         <div class="btmOpenDiv_Mail">
         
            <div class="mail">   
            한솔씨 수료증 보내는 페이지 만들어 놨스빈다.

               <button class="mailClose"> Close </button>

             </div> <!-- mail 끝 -->
         </div> <!-- btmOpenDiv_Mail 끝 -->
         
         
         
         
         <div class="btmOpenDiv_1">
            
         
            <div class="badgeWrapper">
            
               <div class="badgeOutLine">
               
                  <div class="badge_1">
               
                     <div class="Project">
                       <img src="../resources/img/icon1.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_1"></div>
                       <div class="Project-hail2 circleGroup_1"></div>
                       <p class="Project-name displayName_1"> Level 1 </p>
                     </div>
                     
               
                  </div>
                  
                  <div class="badge_2">
               
                     <div class="Project">
                       <img src="../resources/img/icon2.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_1"></div>
                       <div class="Project-hail2 circleGroup_1"></div>
                       <p class="Project-name displayName_1"> Level 2 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_3">
               
                     
                     <div class="Project">
                       <img src="../resources/img/icon3.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_2"></div>
                       <div class="Project-hail2 circleGroup_2"></div>
                       <p class="Project-name displayName_2"> Level 3 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_4">
               
               
                     <div class="Project">
                       <img src="../resources/img/icon4.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_2"></div>
                       <div class="Project-hail2 circleGroup_2"></div>
                       <p class="Project-name displayName_2"> Level 4 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_5">
               
               
                     <div class="Project">
                       <img src="../resources/img/icon5.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_3"></div>
                       <div class="Project-hail2 circleGroup_3"></div>
                       <p class="Project-name displayName_3"> Level 5 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_6">
               
               
                     <div class="Project">
                       <img src="../resources/img/icon6.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_3"></div>
                       <div class="Project-hail2 circleGroup_3"></div>
                       <p class="Project-name displayName_3"> Level 6 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_7">
               
               
                     <div class="Project">
                       <img src="../resources/img/icon7.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_4"></div>
                       <div class="Project-hail2 circleGroup_4"></div>
                       <p class="Project-name displayName_4"> Level 7 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_8">
               
               
                     <div class="Project">
                       <img src="../resources/img/icon8.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_4"></div>
                       <div class="Project-hail2 circleGroup_4"></div>
                       <p class="Project-name displayName_4"> Level 8 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_9">
               
                     <div class="Project">
                       <img src="../resources/img/icon9.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_5"></div>
                       <div class="Project-hail2 circleGroup_5"></div>
                       <p class="Project-name displayName_5"> Level 9 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_10">
               
                     <div class="Project">
                       <img src="../resources/img/icon10.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_5"></div>
                       <div class="Project-hail2 circleGroup_5"></div>
                       <p class="Project-name displayName_5"> Level 10 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_11">
               
                     <div class="Project">
                       <img src="../resources/img/icon11.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_6"></div>
                       <div class="Project-hail2 circleGroup_6"></div>
                       <p class="Project-name displayName_6"> Level 11 </p>
                     </div>
               
                  </div>
                  
                  <div class="badge_12">
               
                     <div class="Project">
                       <img src="../resources/img/icon13.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_6"></div>
                       <div class="Project-hail2 circleGroup_6"></div>
                       <p class="Project-name displayName_6"> Level 12 </p>
                     </div>
               
                  </div>

               </div>
            
               <div class="badgeClosePage"> <a> ◀ </a> </div>
            
            </div>
         
         
         </div>
         
         <div class="btmOpenDiv_2">
            
            <div class="trophyWrapper">
            
               <div class="trophyOutLine">
               
                  <div class="trophy_1">
               
                     <div class="Project">
                       <img src="../resources/img/icon12.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_1"></div>
                       <div class="Project-hail2 circleGroup_1"></div>
                       <p class="Project-name displayName_1"> Trophy 1 </p>
                     </div>
                     
               
                  </div>
                  
                  <div class="trophy_2">
               
                     <div class="Project">
                       <img src="../resources/img/icon12.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_2"></div>
                       <div class="Project-hail2 circleGroup_2"></div>
                       <p class="Project-name displayName_2"> Trophy 2 </p>
                     </div>
               
                  </div>
                  
                  <div class="trophy_3">
               
                     
                     <div class="Project">
                       <img src="../resources/img/icon12.png" alt="" class="imgMasked" />
                       <div class="Project-hail circleOut_3"></div>
                       <div class="Project-hail2 circleGroup_3"></div>
                       <p class="Project-name displayName_3"> Trophy 3 </p>
                     </div>
               
                  </div>
                  
               </div>
            
               <div class="trophyClosePage"> <a> ◀ </a>    </div>
            
            </div>
            

         </div>
      
         
         <div class="btmMain">
         
            <div class="logoSection">
               
               <div class="logoSectionInner">   
                  
                  <div class="wrapper">
                     <div class="border-circle" id="one"></div>
                      <div class="border-circle" id="two"></div>
                      
                         <!-- 동그란 뒷배경 부분 -->
                         <div class="background-circle">
                             <div class="triangle-light"></div>
                             <div class="body"></div>
                             
                             <!-- 여기에 글자 입력하면 바뀝니다 -->
                             <span class="shirt-text">I</span>
                             <span class="shirt-text">♥</span>
                             <span class="shirt-text">J</span>
                             <span class="shirt-text">A</span>
                             <span class="shirt-text">V</span>
                             <span class="shirt-text">A</span>
                             <div class="triangle-dark"></div>
                           </div>
                           
                           <!-- 머리 전체 -->
                           <div class="head">
                           <div class="ear" id="left"></div>
                            <div class="ear" id="right"></div>
                            
                            <div class="hair-main">
                               <div class="sideburn" id="left"></div>
                                <div class="sideburn" id="right"></div>
                                <div class="hair-top"></div>
                            </div>
                             
                            <!-- 얼굴 부분 --> 
                            <div class="face">
                               <div class="hair-bottom"></div>
                                <div class="nose"></div>
                                  
                                  <div class="eye-shadow" id="left">
                                   <div class="eyebrow"></div>
                                    <div class="eye"></div>
                                  </div>
                                  
                                  <div class="eye-shadow" id="right">
                                   <div class="eyebrow"></div>
                                    <div class="eye"></div>
                                  </div>
                                  
                                  <div class="mouth"></div>
                                  
                                  <div class="shadow-wrapper">
                                   <div class="shadow"></div>
                                  </div>
                           </div> <!-- face 끝 -->
                           
                           </div> <!-- 머리 전체 끝 -->
                     
                           <span class="music-note" id="one">&#9835;</span>
                           <span class="music-note" id="two">&#9834;</span>
                   
                   </div> <!-- wrapper 끝 -->    
                              
               </div> <!-- logoSectionInner 끝 -->   
               
            </div> <!-- logoSection 끝 -->
         
            <div class="MenuSection">
            
               <ul>
                  
                  <li onmouseover="anim('badge')" id="liClick_1">
                     <div id="badge" class="menu"> 
                     BADG
                     <div class="rotate">E</div> 
                     </div>
                  </li>
                  
                  
                  <li onmouseover="anim('trophy')" id="liClick_2">
                     <div id="trophy" class="menu"> 
                     TROPH 
                     <div class="rotate">Y</div>
                     </div>
                  </li>
                  
                  <li onmouseover="anim('modify')" id="liClick_Modify">
                     <div id="modify" class="menu"> 
                     MODIF 
                     <div class="rotate">Y</div>
                     </div>
                  </li>
                  
                  <li onmouseover="anim('sendmail')" id="liClick_Mail">
                     <div id="sendmail" class="menu"> 
                     SENDMAI 
                     <div class="rotate">L</div>
                     </div>
                  </li>
                  
                  <li onmouseover="anim('backMain')" onclick="goHome()">
                     <div id="backMain" class="menu"> 
                     BACKMAI 
                     <div class="rotate">N</div>
                     </div>
                  </li>
               
               </ul>
            
            </div> <!-- MenuSection 끝 -->
         
         </div> <!-- btmMain 끝 -->  
        
      </div> <!-- bottomArea 끝 -->

   </body>
   
   
   <!-- 끝에 글자 바뀌는 효과에 관련한 script -->
   <script type="text/javascript">
   
   function anim(targetedDiv) {
      
      var targetedLetter = $("#" + targetedDiv + " .rotate").text();
      var asciiValue = targetedLetter.charCodeAt(0);
      var pointer = 65;
      changeChar();
       
      function changeChar() {
         
         if(pointer <= asciiValue) {
            
            $("#" + targetedDiv + " .rotate").text(String.fromCharCode(pointer));
            pointer++;
            setTimeout(changeChar, 20);
         }
         else {
            $(this).stop;
         }
      }
   }
   
   </script>
   
</html>