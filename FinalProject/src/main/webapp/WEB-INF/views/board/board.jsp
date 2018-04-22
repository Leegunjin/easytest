<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<script type="text/javascript">
		function messageSendFormOpen(id) {
			var id = document.getElementById('id');
			alert(id);
			window.open("../message/messageSendForm","newWindow","top=100,left=800,width=500,height=500");
		} 
		
		function pagingFormSubmit(currentPage) {
			alert("pagingFormSubmit");
			var form = document.getElementById("pagingForm");
			var page = document.getElementById("page");
			page.value = currentPage;
			form.submit(); //form이 서브밋이 된다. 버튼을 이용해서 폼을 서브밋 하는 방법
		}
		
		$(function() {
			var hashtagInputStr = '';
			hashtagInputStr += '<input type="text" id="hashTagValue" name="hashTagValue">';
			hashtagInputStr += '<input type="button" value="CHECK" id="check" name="check">';
			//var hashtagArr = [];
			
			/* hyeji */
			var getText = '';
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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style type="text/css">
		body{
			background-image: url("../resources/images/back1.jpg");
			background-size: cover;
		}
		.title{
			width: 300px;
		}
		.date{
			width: 150px;
		}
		a{
			 text-decoration:none; 
		}
		.boardTableFull{
			margin-left: 20%;
			margin-top: 5%;
		}
		.numstyle{
			width: 50px;
			text-align: center;
		}
		.titlestyle{
			width: 500px;
		}
		.idstyle{
			width: 50px;
			text-align: center;
		}
		.writedatestyle{
			width: 150px;
			text-align: center;
		}
		.hitsstyle{
			width: 30px;
			text-align: center;
		}
		.likeonestyle{
			width: 30px;
			text-align: center;
		}
		.move1{
			margin-left:28%;
		}
		.move2{
			margin-left: 25%;
		}
		.ta{
			/* background-color: white; */
			border-collapse: collapse;
			/* border: 1px solid black; */
			padding: 15px;
		}
		td{
			height: 30px;
		}
		th, td{
			border-bottom: 1px solid #777c84;
		}
	</style>
</head>
<body>
	<div class="writeDiv">
		<form method="post" action="write" onsubmit="return formCheck();">
			<input type="hidden" value="${sessionScope.loginId}" id="b_id" name="b_id">
			<input type="hidden" id="hashTag" value="" name="hashTag"> 
			<table class="writeFormStyle">
				<!-- <tr>
					<td class="tdCenter">TITLE</td>
				</tr> -->
				<tr>
					<td><input type="text" id="b_title" name="b_title" placeholder="TITLE"></td>
				</tr>
				<!-- <tr>
					<td class="tdCenter">CONTENT</td>
				</tr> -->
				<tr>
					<td><textarea rows="10" cols="100" id="b_contents" name="b_contents" placeholder="TEXT"></textarea></td>
				</tr>
				<tr>
					<td>
						<div id="hashtagDiv"></div>			<!-- 입력되어져있는 해시태그들 보여주는 곳 -->
						<div id="hashtagInputDiv"></div>	<!-- 해쉬태그 입력하려고 input text 여는데  -->
						<div id="addTagDiv"><input type="button" value="+ HashTag" id="addTag" name="addTag"></div>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="WRITE" class="button1"></td>
				</tr>
			</table>
		</form>
	</div>

	<div class="boardTableFull">
	<a href="writeForm">WRITE</a>
	<table class="ta">
		<tr>
			<td>NUM</td>
			<td class="title">TITLE</td>
			<td>ID</td>
			<!-- <td>GROUP</td> -->
			<td class="date">DATE</td>
			<td>HITS</td>
			<td>LIKE</td>
		</tr>
		<c:forEach var="temp" items="${list}">
		<tr>
			<td class="numstyle">${temp.b_num}</td>
			<td class="titlestyle"><a href="readContent?b_num=${temp.b_num}">${temp.b_title}</a></td>
			<td class="idstyle">
				<c:if test="${sessionScope.loginId != temp.b_id}">
					<a value="${temp.b_id}" onclick="messageSendFormOpen()">${temp.b_id}</a>
				</c:if>
				<c:if test="${sessionScope.loginId == temp.b_id}">
					${temp.b_id}
				</c:if>
			</td>
			<%-- <td>${temp.groupid}</td> --%>
			<td class="writedatestyle">${temp.b_date}</td>
			<td class="hitsstyle">${temp.hits}</td>
			<%-- <td class="likeonestyle">${temp.likeone}</td> --%>
		</tr>
		</c:forEach>
	</table>
	<div class="move1">
	<a href="javascript:pagingFormSubmit(1)">처음</a>
	<a href="javascript:pagingFormSubmit(${navi.startPageGroup }-${navi.pagePerGroup })">◁◁</a>
	<a href="javascript:pagingFormSubmit(${navi.currentPage-1 })">◀</a>
		<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="counter">
			<c:choose>
				<c:when test="${counter == navi.currentPage }">
					<a href="javascript:pagingFormSubmit(${counter })"><b>${counter }</b></a>
				</c:when>
				<c:otherwise>
					<a href="javascript:pagingFormSubmit(${counter })">${counter }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	<a href="javascript:pagingFormSubmit(${navi.currentPage+1 })">▶</a>
	<a href="javascript:pagingFormSubmit(${navi.startPageGroup }+${navi.pagePerGroup })">▷▷</a>
	<a href="javascript:pagingFormSubmit(${navi.totalPageCount })">끝</a>
	</div>
	<div class="move2">
	<form action="boardList" method="get" id="pagingForm">
		<input type="hidden" name="page" id="page">
		<select name="searchSelect">
			<option value="b_title" <c:if test="${searchSelect == b_title}">selected="selected"</c:if>>제목</option>
			<option value="b_contents" <c:if test="${searchSelect == b_contents}">selected="selected"</c:if> >본문</option>
			<option value="b_id" <c:if test="${searchSelect == b_id}">selected="selected"</c:if> >작성자</option>
		</select>
		<input type="text" name="searchText" value="${searchText}">
		<input type="button" value="검색" onclick="pagingFormSubmit(1)">
	</form>
	</div>
	
</form>

</div>
</body>
</html>