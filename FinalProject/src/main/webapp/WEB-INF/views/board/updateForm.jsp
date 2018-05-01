<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
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
	<script type="text/javascript">
	$(function() {
		var hashtagInputStr = '';
		hashtagInputStr += '<input type="text" id="hashTagValue" name="hashTagValue">';
		hashtagInputStr += '<input type="button" value="CHECK" id="check" name="check">';
		//var hashtagArr = [];
		/* hyeji */
		var getText = '${board.hashTag}';
		/* end */
		var addTagStr = '<input type="button" value="+" id="addTag" name="addTag">';
		$('#addTag').on('click',addTag);
		function addTag() {
			$('#hashtagInputDiv').html(hashtagInputStr);
			$('#addTagDiv').html('');
			
			$('#check').on('click', function() {
				alert("check click success");
				var hashTagValue = "#"+$('#hashTagValue').val();
				getText += hashTagValue;
				//hashtagArr.push(hashTag);
				//alert("hashtagArr " + hashtagArr);
				$('#hashtagInputDiv').html('');
				$('#addTagDiv').html(addTagStr);
				$('#hashtagDiv').html(getText);
				$('#addTag').off().on('click',addTag);
				/* heyji */
				alert(getText);
				$('#hashTag').val(getText);
			});
		}
		
	});
	</script>
</head>
<body>
<%-- 	${board }
	${board.boardnum } --%>
	<form method="post" action="update" onsubmit="return formCheck();">
		<input type="hidden" name="b_num" value="${board.b_num}">
		<input type="hidden" id="hashTag" value="" name="hashTag"> 
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
			<%-- <tr>
					<td><input type="file" name="upload">
					<a href="download?b_num=${board.b_num }">	${board.originalFileName }</a>
					<img width="100px" src="download?b_num=${board.b_num }"></td>
			</tr> --%>
			<tr>
				<td>
					<div id="hashtagDiv">${board.hashTag}</div>			<!-- 입력되어져있는 해시태그들 보여주는 곳 -->
					<div id="hashtagInputDiv"></div>	<!-- 해쉬태그 입력하려고 input text 여는데  -->
					<div id="addTagDiv"><input type="button" value="+ HashTag" id="addTag" name="addTag"></div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="UPDATE" class="button1"></td>
			</tr>
		</table>
	</form>
</body>
</html>