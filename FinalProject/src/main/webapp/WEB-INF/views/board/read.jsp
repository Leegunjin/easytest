<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	<script type="text/javascript">
		$(function() {
			init();
			$('#replySaveButton').on('click', function() {
				var b_num = $('#b_num').val();
				var r_contents = $('#r_contents').val();
				//alert("replyBtnClick Success");
				$.ajax({
					url : "../reply/writeReply",
					type : "POST",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify({
						b_num : b_num,
						r_contents : r_contents
					}),
					success : function() {
						$('#r_contents').val('');
						init();
					},
					error : function(err) {
						console.log(err);
					}
				});
			});
			
			function init() {	
				//alert("reply init() Start!");
				var b_num = $('#b_num').val();
				//alert("b_num : " + b_num);
				$.ajax({
					url : "../reply/replyList",
					type : "GET",
					data : {
						b_num : b_num
					},
					dataType : "json",	
					success : function(obj){
						//alert("success obj : " + obj);
						var str = '';
						str += '<table class="replyListTable">';
						$.each(obj, function(index, item){
							str += '<tr>';
							str += '<td>'+item.r_num+'</td>';
							str += '<td>'+item.r_id+'</td>';
							str += '<td>'+item.r_contents+'</td>';
							str += '<td>'+item.r_date+'</td>';
							str += '<td><input type="button" value="DELETE" class="btnDel" data-num="'+item.r_num+'" ></td>';
							str += '</tr>';
						});
						str += '</table>';
						$('#listDiv').html(str);
						
						$('.btnDel').on('click', function() {
							var r_num = $(this).attr('data-num');
							$.ajax({
								url : "../reply/replyDelete",
								type : "POST",
								data : {
									r_num : r_num
								},
								success : function() {
									alert("삭제 되었습니다.");
									init();
								},
								error : function(err) {
									console.log(err);
								}
							});
							
						});
					},
					error : function(err){
						console.log(err);		
					}
				});
				}
		});
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<style type="text/css">
		body{
			background-image: url("../resources/images/read3.jpg");
			background-size: cover;
		}
		.readTable{
			width: 900px;
			margin: auto;
			border-collapse: collapse;
			margin-top: 3%;
			background-color: white;
		}
		.replyWriteTable{
			width: 900px;
			margin: auto;
			border-collapse: collapse;
			margin-top: 3%;
		}
		.replyListTable{
			width: 900px;
			margin: auto;
			border-collapse: collapse;
			margin-top: 3%;
			padding: 10px;
		}
		.rereplyListTable{
			width: 700px;
			margin: auto;
			border-collapse: collapse;
			margin-left: 10%;
		}
		.tdTitle{
			text-align: center;
		}
		.tdId{
			width: 100px;
		}
		.tdDate{
			width: 600px;
		}
		.tdHits{
			width: 100px;
		}
		.tdLike{
			width: 100px;
		}
		#replycontent{
			width: 800px;
		}
		.tdMenu{
			text-align: center;
		}
		.rereInsertStyle{
			width: 580px;
			margin-left: 10%;
		}
	</style>
</head>
<body>
	
	<input type="hidden" id="b_num" name="b_num" value="${board.b_num}">
	<%-- ${board} --%>
	<!-- 글 보기 -->
	<table border="1" class="readTable">
		<tr>
			<td colspan="4" class="tdTitle">${board.b_title}</td>
		</tr>
		<tr>
			<td class="tdId">	
				${board.b_id}
				<c:if test="${sessionScope.loginId != board.b_id}">
					<form>
						<input type="hidden" value="${board.b_id}" id=b_id name="b_id">
					</form>
				</c:if>
			</td>
			<td class="tdDate">${board.b_date}</td>
			<td class="tdHits">HITS | ${board.hits}</td>
			<%-- <td class="tdLike">LIKE | ${board.likeone}</td> --%>
		</tr>
		<tr>
			<td colspan="4">
				${board.b_contents}
			</td>
		</tr>
		<tr>
			<th>
				HashTag
			</th>
			<td colspan="3">
				<%-- <c:if test="${board.originalFileName != null }">
					<a href="download?b_num=${board.b_num }">	${board.originalFileName }</a>
					<img width="100px" src="download?b_num=${board.b_num }">
				</c:if>
				<c:if test="${board.originalFileName == null }">
					등록된 파일 없음
				</c:if> --%>
				${board.hashTag}
			</td>
		</tr>
		<tr>
			<c:if test="${sessionScope.loginId == board.b_id }">
				<td class="tdMenu" colspan="4">
					<a href="updateForm?b_num=${board.b_num}">RE WRITE</a>
					<a href="deleteBoard?b_num=${board.b_num}">DELETE</a>
					<!-- <input type="button" value="LIKE♡" id="likeIt"> -->
				</td>
			</c:if>
		</tr>
	</table>
	<!-- 리플 작성 -->
		<input type="hidden" id="b_num" name="b_num" value="${board.b_num}">
		<table class="replyWriteTable">
			<tr>
				<td>${sessionScope.loginId}</td>
				<td><input type="text" id="r_contents" > </td>
				<td><input type="button" value="SAVE" id="replySaveButton"></td>
			</tr>
		</table> 
	
	<!-- 리플 리스트 보기 -->
	<div id="listDiv"></div>
</body>
</html>