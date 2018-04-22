<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title>JavaLingo Main</title>
   <link href="http://fonts.googleapis.com/css?family=Quicksand:500" rel="stylesheet">
   <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
   
   <style type="text/css">


.profile {
  width: 330px;
  height: 100px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 5px;
  background-color: #fafafa;
  box-shadow: 0 0 2rem #babbbc;
  animation: show-profile 0.5s forwards ease-in-out;
}
@keyframes show-profile {
  0% {
    width: 0;
  }
}
.profile .photo, .profile .content {
  box-sizing: border-box;
}
.profile .photo {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  overflow: hidden;
  border: 5px solid #fafafa;
  background-color: #fafafa;
  margin-left: -50px;
  box-shadow: 0 0 0.5rem #babbbc;
  animation: rotate-photo 0.5s forwards ease-in-out;
}
@keyframes rotate-photo {
  100% {
    transform: rotate(-360deg);
  }
}
.profile .photo img {
  width: 100%;
}

/* .profile .content {
  padding: 10px;
  overflow: hidden;
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}
 */

/* .profile .content::before {
  content: "";
  position: absolute;
  width: 230px;
  height: 150px;
  background-color: #e9f3e6;
  left: 0;
  top: -20px;
  z-index: -1;
  transform: rotate(-8deg);
} */


.profile .content .text {
  margin-top: 20px;
  margin-left: 50px;
}
.profile .content .text h3, .profile .content .text h6 {
  font-weight: normal;
  margin: 3px 0;
  letter-spacing: 0.5px;
  white-space: nowrap;
}
.profile .content .btn {
  background-color: #abc;
  width: 50px;
  height: 50px;
  position: absolute;
  right: 25px;
  top: 25px;
  border-radius: 50%;
  z-index: 1;
  cursor: pointer;
  transition-duration: 0.3s;
  animation: pop-btn 0.3s both ease-in-out 0.5s;
}
@keyframes pop-btn {
  0% {
    transform: scale(0);
  }
  80% {
    transform: scale(1.2);
  }
  100% {
    transform: scale(1);
  }
}
.profile .content .btn:hover {
  box-shadow: 0 0 0 5px rgba(170, 187, 204, 0.5);
}
.profile .content .btn span {
  width: 60%;
  height: 2px;
  position: absolute;
  background-color: white;
  top: 50%;
  left: 20%;
  transform: translateY(-50%);
  animation: to-hamburger 0.3s forwards ease-in-out;
}

.profile .content .btn span::before, .profile .content .btn span::after {
  content: "";
  width: 100%;
  height: 2px;
  position: absolute;
  background-color: white;
  transition-duration: 0.3s;
  transform: rotate(0deg);
  right: 0;
}

.profile .content .btn span::before {
  margin-top: -7px;
}
.profile .content .btn span::after {
  margin-top: 7px;
}
.profile .content .btn.active span {
  animation: to-arrow 0.3s forwards ease-in-out;
}
.profile .content .btn.active span::before, .profile .content .btn.active span::after {
  width: 60%;
  right: -1px;
}
.profile .content .btn.active span::before {
  transform: rotate(45deg);
}
.profile .content .btn.active span::after {
  transform: rotate(-45deg);
}
@keyframes to-hamburger {
  from {
    transform: translateY(-50%) rotate(-180deg);
  }
}
@keyframes to-arrow {
  from {
    transform: translateY(-50%) rotate(0deg);
  }
  to {
    transform: translateY(-50%) rotate(180deg);
  }
}
.profile .box {
 width: 150px;
    height: 150px;
    opacity: 0;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.7);
    position: absolute;
    top: 50%;
    right: -40%;
    transform: translate(0%, -50%);
    transition-duration: 0.3s;
}
.profile .box i {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: #ececec;
  font-size: 26px;
  text-align: center;
  line-height: 50px;
  position: absolute;
  left: 18px;
  top: calc(75px - 50px/2);
  box-shadow: 0 0 0.5rem #babbbc;
  transition-duration: 0.3s;
}
.profile .box i:hover {
  transition-delay: initial !important;
  box-shadow: 0 0 0 5px #babbbc;
}
.profile .box.open {
  opacity: 1;
}
.profile .box.open i {
  left: 60px;
}
.profile .box.open i:nth-of-type(1) {
  transform: rotate(-90deg) translateX(120px) rotate(90deg);
  transition-delay: 0s;
}
.profile .box.open i:nth-of-type(2) {
  transform: rotate(-45deg) translateX(120px) rotate(45deg);
  transition-delay: 0.1s;
}
.profile .box.open i:nth-of-type(3) {
  transform: rotate(0deg) translateX(120px) rotate(0deg);
  transition-delay: 0.2s;
}
.profile .box.open i:nth-of-type(4) {
  transform: rotate(45deg) translateX(120px) rotate(-45deg);
  transition-delay: 0.3s;
}
.profile .box.open i:nth-of-type(5) {
  transform: rotate(90deg) translateX(120px) rotate(-90deg);
  transition-delay: 0.4s;
}
   
   </style>
   
   <script type="text/javascript">
 
   $(function() {
	   $('.btn').click(function() {
	     $(this).toggleClass('active');
	     return $('.box').toggleClass('open');
	   });

	 }).call(this);

	 //# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiPGFub255bW91cz4iXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7RUFBQSxDQUFBLENBQUUsTUFBRixDQUFTLENBQUMsS0FBVixDQUFnQixRQUFBLENBQUEsQ0FBQTtJQUNmLENBQUEsQ0FBRSxJQUFGLENBQU8sQ0FBQyxXQUFSLENBQW9CLFFBQXBCO1dBQ0EsQ0FBQSxDQUFFLE1BQUYsQ0FBUyxDQUFDLFdBQVYsQ0FBc0IsTUFBdEI7RUFGZSxDQUFoQjtBQUFBIiwic291cmNlc0NvbnRlbnQiOlsiJCgnLmJ0bicpLmNsaWNrIC0+XG5cdCQodGhpcykudG9nZ2xlQ2xhc3MgJ2FjdGl2ZSdcblx0JCgnLmJveCcpLnRvZ2dsZUNsYXNzICdvcGVuJyJdfQ==
	 //# sourceURL=coffeescript

   </script>
   
</head>
<body>


<div class="profile">
  <div class="content">
    <div class="btn"><span></span></div>
  </div>
  <div class="box"><i class="fa fa-codepen"></i><i class="fa fa-facebook"></i><i class="fa fa-github"></i><i class="fa fa-tumblr"></i><i class="fa fa-twitter"></i></div>
</div>
		
		



</body>
</html>