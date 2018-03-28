<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<script type="text/javascript">
		$(function() {
			$("#findIdBtn").on("click", function() {
				alert("test!!!");
				var email = $('#email').val();
				
				$.ajax({
					url : "findId",
					type : "POST",
					data : {
						email : email
					},
					dataType : "json",
					success : function (person) {
						if (person != null) {
							alert("success");
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
	<input type="button" value="찾기" id="findIdBtn">
	
	<!-- <form action="findId" method="post">
		<input type="text" id="email" name="email" placeholder="Email">
		<input type="submit" value="아이디 찾기" id="findIdBtn">
	</form> -->
</body>
</html>