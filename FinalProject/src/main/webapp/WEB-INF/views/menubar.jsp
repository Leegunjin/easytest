<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>">

	$('ul li a').hover(function() {
		var x = $(this);
		$('.menuUnderline').stop().animate({
			'width' : x.width(),
			'left' : x.position().left
		}, 400);
	});
</script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

ul {
	background: #fff;
	margin: 40px;
	position: relative;
	overflow: hidden;
}

ul li {
	list-style: none;
	text-transform: uppercase;
	float: left;
	margin: 0 10px;
	padding: 0 5px 5px;
}

ul li a {
	color: #000;
	display: inline-block;
	font-size: 12px;
	text-decoration: none;
	display: inline-block;
}

.menuUnderline {
	background-color: #000;
	position: absolute;
	height: 3px;
	left: 0;
	bottom: 0;
}
</style>


</head>
<body>

	<!-- Navigation 
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"> Java Lingo </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><c:if test="${loginId == null }">
							<a class="nav-link"
								href="<c:url value="person/loginForm"></c:url>">Login</a>
						</c:if> <c:if test="${loginId != null }">
							<a class="nav-link" href="<c:url value="person/logout"></c:url>">Logout</a>
						</c:if></li>
					<li class="nav-item"><a class="nav-link" href="#">My Page</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Board</a></li>
				</ul>
			</div>
		</div>
	</nav>-->

		<ul>
			<li><a href="#" class="home">Home</a></li>

			<li><c:if test="${loginId == null}">
					<a class="login" href="<c:url value="person/loginForm"></c:url>">Login</a>
				</c:if></li>

			<li><c:if test="${loginId != null}">
					<a class="logout" href="<c:url value="person/logout"></c:url>">Logout</a>
				</c:if></li>


			<li><a href="#" class="mypage">MyPage</a></li>
			<li><a href="#" class="board">Board</a></li>

			<div class="menuUnderline"></div>
		</ul>
	</div>


</body>
</html>