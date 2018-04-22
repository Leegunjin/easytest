<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		
		body{
			background-image: url("../resources/images/read3.jpg");
			background-size: cover;
		}
		.writeFormStyle{
			margin: auto;
			margin-top: 4%;
		}
		.tdCenter{
			text-align: center;
		}
		#title{
			width: 650px;
		}
		.button1 {
			text-align: center;
			width: 660px;
			height: 30px;
		}
	</style>
</head>
<body>
<%-- 	${board }
	${board.boardnum } --%>
	<form method="post" action="update" onsubmit="return formCheck();">
		<input type="hidden" name="b_num" value="${board.b_num}">
		<table class="writeFormStyle">
			<tr>
				<td class="tdCenter">TITLE</td>
			</tr>
			<tr>
				<td><input type="text" id="b_title" name="b_title" value="${board.b_title}"></td>
			</tr>
			<tr>
				<td class="tdCenter">CONTENT</td>
			</tr>
			<tr>
				<td><textarea rows="30" cols="100" id="b_contents" name="b_contents">${board.b_contents}</textarea></td>
			</tr>
			<tr>
					<td><input type="file" name="upload">
					<a href="download?b_num=${board.b_num }">	${board.originalFileName }</a>
					<img width="100px" src="download?b_num=${board.b_num }"></td>
			</tr>
			<tr>
				<td><input type="submit" value="UPDATE" class="button1"></td>
			</tr>
		</table>
	</form>
</body>
</html>