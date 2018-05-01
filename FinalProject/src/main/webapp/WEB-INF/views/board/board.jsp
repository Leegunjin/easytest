<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	
	<head>
	   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	   
	   <title>보드보드 Main</title>
	   
	   <link rel="stylesheet" type="text/css" href="../resources/css/styleBoard.css">
	   <link rel="stylesheet" type="text/css" href="../resources/css/styleNav.css">
	   <link href="http://fonts.googleapis.com/css?family=Quicksand:500" 
	         rel="stylesheet">
	  
	   <script type="text/javascript" 
	   		   src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	   
	   
	   
	   
	   <script type="text/javascript">
	      $(window).on('scroll', function() {
	         if($(window).scrollTop()) {
	            $('nav').addClass('black');
	         }
	         else{   
	            $('nav').removeClass('black');
	         }
	      });
	           
	      function googleLogout(loginId) {
	         var result = loginId.includes('@gmail.com');
	         if(result) {
	            window.open('https://accounts.google.com/logout', 'popup', 
	                     'z-lock=yes, width=600, height=400');
	         }
	      } 
	            
	      $(document).ready(function(){
	         $('#dropDown').click(function(){
	            $('.drop-down').toggleClass('drop-down--active');
	         });
	      });
	      
	      function selectLevelPage() { location.href = "contents/contentsHome"; }
	      function joinForm() { location.href = "person/joinForm"; }  
	      function loginForm() { location.href = "person/loginForm"; }  
	      function logout() { location.href = "person/logout"; } 
	      function mypageUser() { location.href = "person/mypageUser"; } 
	      function board() { location.href = "board/boardList"; } 
	      function testPage() { location.href = "person/test67"; }
	      function goHome() { location.href = "../../easycodingu/home"; }
	      
	   </script>
	   
	   
	   <!-- 게시판 관련 스크립트 -->
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
	
	
	<script type="text/javascript">
		
		
		/* 글자 클릭하면 div 나왔다 들어갔다 관련하는 script */
		$(document).ready(function() {
			
			
			/* 정보수정 글자를 클릭하면 */
			 $(".openWriteForm").click(function() {
					
				 /* 왼쪽에서 div가 튀어나옴 */
				 $(".leftOpenDiv_1").animate({left:"40.5%"});
					
			 });
				
				
			 /* 튀어나온 div를 클릭하면 */	 
			$(".closeWriteForm").click(function() {
				
				/* 다시 들어감 */	
				$(".leftOpenDiv_1").animate({left:"0%"});
			});
			 
		
				
			 /* 튀어나온 div를 클릭하면 */	 
			$(".closeBoardList").click(function() {
				
				/* 다시 들어감 */	
				$(".rightOpenDiv_1").animate({left:"0%"});
			}); 
			 
		});
		
		
		</script>
		
		
		<!-- 리플 스크립트 -->
   		<script type="text/javascript">
   		
   		/* var bnum = '';
		 var test = '';
		 function numberCheck(num) {
			
			 bnum = num;
			 alert(bnum);
			 init();
			 $.ajax({
	            
				 url : "read",
				 async:false,
				 type : "POST",
				 data : {
					 bnum : bnum
				 },
	            
				 success : function(board) {
	            	 
					 $(".rightOpenDiv_1").animate({left:"-63%"});
					
					 $('.b_id').html(board.b_id);
					 $('.b_title').html(board.b_title);
					 $('.b_date').html(board.b_date);
					 $('.b_num').html(board.b_num);
					 $('.b_hits').html(board.hits);
					 $('.b_contents').html(board.b_contents);
					  
				 },
	            
				 error : function(err) {
	               alert("error");
	               alert(err);
				 }
			 });
		 } */
   		
   		
   		/* $(function() { */
   			
   		
   		/* function deleteBoard(b_num) {
	         alert("b_num !!!!! : "+b_num);
	         $.ajax({
	            url : "delBoard",
	            type : "POST",
	            data : {
	            	b_num : b_num
	            },
	            success : function(result) {
	               alert("success");
	               alert(result);
	            },
	            error : function(err) {
	               alert("error");
	               alert(err);
	            }
	         });
	      } */
   		
   	     var bnum = '';
		 var test = '';
   		 function numberCheck(num) {
   			 alert("numberCheck Click");
   			 bnum = num;
   			 alert(bnum);
   			 /* init(); */
   			 $.ajax({
   	            
   				 url : "read",
   				 async:false,
   				 type : "POST",
   				 data : {
   					 bnum : bnum
   				 },
   	            
   				 success : function(board) {
   	            	 
   					 $(".rightOpenDiv_1").animate({left:"-63%"});
   					
   					 $('.b_id').html(board.b_id);
   					 $('.b_title').html(board.b_title);
   					 $('.b_date').html(board.b_date);
   					 $('.b_num').html(board.b_num);
   					 $('.b_hits').html(board.hits);
   					 $('.b_contents').html(board.b_contents);
   					 init(); 
   				 },
   	            
   				 error : function(err) {
   	               alert("error");
   	               alert(err);
   				 }
   			 });
   			
   			 $('#boardDeleteBtn').on('click', function() {
				alert("boardDeleteBtn click");
				alert("삭제버튼 Bnum : "+ bnum);
				$.ajax({
		            url : "dBoard",
		            type : "GET",
		            data : {
		            	bnum : bnum
		            },
		            success : function(result) {
		               alert("success");
		               alert(result);
		            },
		            error : function(err) {
		               alert("error");
		               alert(err);
		            }
		         });
			});
   		 }
   		 
   		/* var hiddenBnum = $('#hiddenBnum').val();
   		alert("hiddenBnum : " + hiddenBnum); */
   		/* function dBoard() {
   			 alert("왜!!!");
	         alert("hiddenBnum !!!!! : "+hiddenBnum);
	         $.ajax({
	            url : "dBoard",
	            type : "POST",
	            data : {
	            	hiddenBnum : hiddenBnum
	            },
	            success : function(result) {
	               alert("success");
	               alert(result);
	            },
	            error : function(err) {
	               alert("error");
	               alert(err);
	            }
	         });
	      } */
			/* init(); */
			$(function () {
				$('#replySaveButton').on('click', function() {
					var b_num = bnum;
					var r_contents = $('#r_contents').val();
					alert("replyBtnClick Success");
					$.ajax({
						url : "../reply/writeReply",
						type : "POST",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify({
							b_num : b_num,
							r_contents : r_contents
						}),
						success : function() {
							alert("reply Write Success");
							$('#r_contents').val('');
							init();
						},
						error : function(err) {
							alert("reply Write Error");
							console.log(err);
						}
					});
				});
			});
			function init() {	
				alert("reply init() Start!");
				/* var b_num = $('#b_num').val(); */
				var b_num = bnum;
				alert("b_num : " + b_num);
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
							str += '<td>'+item.r_id+'</td>';
							str += '<td>'+item.r_contents+'</td>';
							str += '<td>'+item.r_date+'</td>';
							str += '<td><input type="button" value="DELETE" class="btnDel" data-num="'+item.r_num+'" ></td>';
							str += '</tr>';
						});
						str += '</table>';
						$('#listDiv').html(str);
						
						$('.btnDel').on('click', function() {
							alert("btnDELETE PLEASE~!~!~!");
							var r_num = $(this).attr('data-num');
							$.ajax({
								url : "../reply/replyDelete",
								type : "POST",
								data : {
									r_num : r_num
								},
								success : function(result) {
									alert("result : "+result);
									if (result == true) {
										alert("삭제 되었습니다.");
										init();
									} else if (result == false) {
										alert("삭제 실패하였습니다.");
										init();
									}
									
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
		/* }); */
   		
   		</script>
		

		 <script type="text/javascript">
		 
		 /* function deleteBoard(bnum) {
	         alert("bnum : "+bnum);
	         $.ajax({
	            url : "delBoard",
	            type : "POST",
	            data : {
	               bnum : bnum
	            },
	            success : function(result) {
	               alert("success");
	               alert(result);
	            },
	            error : function(err) {
	               alert("error");
	               alert(err);
	            }
	         });
	      } */
		 
		
   		</script>
   		
   		
   		
	
	
	</head>  

	<body style="overflow-x:hidden; overflow-y:hidden">
	
		<div class="wrapper">
	     
	     
	    	<!-- 상단 내비게이션 바 -->
	    	<nav>
	        
	        <!-- 로그아웃 -->
	        <c:if test="${sessionScope.loginId == null }">       
	        
	        	<div class="slogan">
				EasyCodingU
				  	<ul class="list">
					    <li> WelCome To Web Page </li>
					    <li> Thank You </li>
					    <li> WelCome To Web Page </li>
					    <li> Thank You </li>
					    <li> WelCome To Web Page </li>
				  	</ul>
				</div>
	            
	        </c:if> <!-- 로그아웃 끝 -->
	      
	        <!-- 로그인 -->
		         
		    <c:if test="${sessionScope.loginId != null }">
		          
		    	<div class="slogan">
				EasyCodingU
					<ul class="list">
					    <li> WelCome To Web Page </li>
					    <li> <span> Name : </span> ${sessionScope.loginName} </li>
					    <li> <span> Id : </span> ${sessionScope.loginId} </li>
					    <li> <span> Name : </span> ${sessionScope.loginName} </li>
					    <li>  Thank You </li>
					</ul>
				</div>
				
				<div class="displayLevel"> 
					<span> level : </span> 
					${person.grade} 
				</div>
				
				<div class="displayProgress"> 
					<span> progress : </span> 
					${person.grade * 10}%  
				</div>
		    
		     </c:if> <!-- 로그인 끝 -->  
	      	 
	      	 </nav> <!-- 상단 내비게이션바 끝 -->  
	      
	      
	      	 <!-- 메인화면 좌측 여우 나오는 부분 -->
	      	 <div class="box1"> 
			 	
			 	<div class="fox">
  
					<div class="leg-outer">
						<div class="leg">
							<div class="paw">
								<div class="log">
							    	<div class="log-inner"> </div>
							    </div>
						    </div>
					    </div>
				  	</div>
				  
				  	<div class="leg-outer">
					    <div class="leg">
					    	<div class="paw">
					        	<div class="log">
					        		<div class="log-inner"></div>
					        	</div>
						    </div>
					    </div>
				  	</div>
  
				  	<div class="hind-leg-outer">
				    	<div class="hind-leg-outer2">
							<div class="hind-paw">
						    	<div class="hind-log">
						        	<div class="hind-log-inner"> </div>
						        </div>
						    </div>
				    	</div>
				  	</div>
				  	
				  	
				  	<div class="hind-leg-outer">
				    	<div class="hind-leg-outer2">
				      		<div class="hind-paw">
				        		<div class="hind-log">
				          			<div class="hind-log-inner"> </div>
				        		</div>
				      		</div>
				    	</div>
				  	</div>
    
    				<div class="body">
    
    					<div class="head">
      						<div class="ears">
						        <div class="ear"></div>
						        <div class="ear"></div>
      						</div>
      
      						<div class="face"></div>
      						<div class="snout"></div>
    					</div>
					    
					    <div class="tail">
					      <div class="tail">
					        <div class="tail">
					          <div class="tail">
					            <div class="tail">
					              <div class="tail">
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					      
					      <div class="tail2">
					        <div class="tail">
					          <div class="tail">
					            <div class="tail">
					              <div class="tail">
					                <div class="tail">
					                </div>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
  					</div> <!-- body 끝 -->
				</div> <!-- fox 끝 -->

				<div class="snow"></div> <!-- 메인화면 좌측 여우 나오는 부분 끝 -->	 
			 	
			 	
			 	
			 	<div class="leftOpenDiv_1">
			 	
			 		
					
			 		<!-- <div class="leftOpenDiv_Inner"> -->
			 		
			 			<!-- <div class="leftOpenDiv_Wrapper"> -->
			 			
				 			
				<div id="form-main">
	  	
	  				<div id="form-div">
	    			
	    			<form class="form" id="form1" action="write" method="post" onsubmit="return formCheck();">
	      
	      			<input type="hidden" value="${sessionScope.loginId}" id="b_id" name="b_id">
		  			<input type="hidden" id="hashTag" value="" name="hashTag"> 
	      
				    	
				    	<div class="closeWriteForm button">
				        	<input type="button" value="Close Page" class="button1 button-blue" id="button-blue"/>
				        	<div class="ease"></div>
				      	</div>
	      
	      				<p class="title">
	        				<input type="title" name="b_title" id="b_title" 
	        				       class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" 
	        				       placeholder="title"/>
	      				</p> <!-- 여기 id name에서 title로 바뀜 -->
	      
				      	<p class="comment">
				        	<textarea id="b_contents" name="b_contents" 
				        	          class="validate[required,length[6,300]] feedback-input" 
				        	          placeholder="Comment"></textarea>
				      	</p> <!-- 클래스 text 에서 comment로 id랑 네임 b_contents로 바꿈 -->
	      
				      	<p>
							<!-- 입력되어져있는 해시태그들 보여주는 곳 -->
							<div id="hashtagDiv"></div>			
							<!-- 해쉬태그 입력하려고 input text 여는데  -->
							<div id="hashtagInputDiv"></div>	
							<div id="addTagDiv"><input type="button" 
								 value="+ HashTag" id="addTag" name="addTag" class="button-blue2"></div>
					  	</p>
	      
					    <div class="submit">
					    	<input type="submit" value="WRITE" class="button1 button-blue"/>
					        <div class="ease"></div>
					    </div>
	      
	    
	   				 </form>
	  				</div>
				 			
				</div> <!-- form-main 끝 -->	 		
			 			
			 			<!-- </div> -->	<!-- leftOpenDiv_Wrapper 끝 -->
			 		<!-- </div> --> <!-- leftOpenDiv_Inner 끝 -->
			 	
			 	</div> <!-- leftOpenDiv_1 끝 -->
			 	
			 	
			 	<div class="leftOpenDiv_2">
			 	
			 		<div class="leftOpenDiv2_Inner">
			 		
			 			<button class="closeReplyList">
							<a> Close </a>
						</button>
			 			
			 			
			 			<div class="leftOpenDiv2_MidBReply">
			 			
			 				<div class="leftOpenDiv2_MidBReplyInner">



			 				</div>
			 			
			 			</div>
			 			
			 		
			 		</div>
			 		
			 	
			 	</div>
			 	
			 	
			 	<!-- <div class="box1Inner"> </div>	 -->
		  
	 		 </div> <!-- box1 끝 -->
	 
	 
			<!-- 로그아웃 -->
			<c:if test="${sessionScope.loginId == null }"> 
	 
	 		<!-- 메인화면 중간 버튼 부분 -->
		 	<div class="box2"> 
		  
		  		<div class="box2Inner">
		  		
		  		
		  		</div>	
		  	
		  	</div> <!-- box2 끝 -->
			
			</c:if> <!-- 로그아웃 끝 -->
		
		
			<!-- 로그인 -->
			<c:if test="${sessionScope.loginId != null }"> 
	 
				<div class="box2"> 

				
					<div class="box2Inner">
			  		
			  			<div class="topButtonArea">
			  			
				  			
				  			
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
				  			
				  			
				  			
				  			<button class="openWriteForm">
								<!-- <a href="writeForm"> WRITE </a> -->
								<a> WRITE </a>
							</button>
								
							<button class="btnBackMain" onclick="goHome();">
								<a> Back Main </a>
							</button>
							
							
							
							
							
						
						</div>
			  			
			  			
			  			<div class="boardTableFull">
								
							<table class="ta">
								<tr>
									<td>NUM</td>
									<td class="title">TITLE</td>
									<td>ID</td>
									<!-- <td>GROUP</td> -->
									<td class="date">DATE</td>
									<td>HITS</td>
									<!-- <td>LIKE</td> -->
								</tr>
			
								<c:forEach var="temp" items="${list}">
										
								<tr>
									<td class="numstyle" >${temp.b_num}</td>
										
									<td class="titlestyle"> 
										<a class="boardTitle" href="javascript:numberCheck(${temp.b_num})">${temp.b_title}</a> <br>
										<input type="hidden" id="hiddenBnum" name="hiddenBnum" value="${temp.b_num }">
										<c:forTokens items="${temp.hashTag}" delims="#" var="sel">
                						<a class="hashTag" href="boardList?searchText=${sel}&searchSelect=hashTag">#${sel}</a>
            							</c:forTokens>
										
										
									</td>
									
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
							
	
						</div> <!-- boardTableFull 끝 -->
	
						
						<div class="pagingArea"> 
								
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
	
								
						</div>
								
			  		</div> <!-- box2Inner 끝 -->
			  		
			  		
			  		<div class="rightOpenDiv_1" style="overflow-y: scroll;">
		  				
		  				<div class="rightOpenDiv_Inner">
		  					
		  					<div class="rightOpenDiv_NavLeft">
		  						<div class="idWrapper">
				  					<a class="b_id"> </a>
				  				</div>
		  					</div>
		  					
		  					<div class="rightOpenDiv_NavMid">
		  						<div class="hitsWrapper">
				  					<a> 조회수 </a> <a class="b_hits"> </a>
				  				</div>
		  					</div>
		  					
		  					<div class="rightOpenDiv_NavRight">
		  						<div class="dateWrapper">
				  					<a class="b_date"> </a>
				  				</div>
		  					</div>
		  					
		  					<div class="rightOpenDiv_Top">
				  				<div class="titleWrapper">
				  					<a class="b_title"> </a>
				  				</div>
				  			</div>
		  		
		  					<div class="rightOpenDiv_Bottom">
		  						<div class="contentsWrapper">
		  							<a class="b_contents"> </a>
		  						</div>
		  					</div> 
		  				
		  					<div class="rightOpenDiv_ButtonArea">
		  						<button class="closeBoardList">
									<a> Close </a>
								</button>
								
								<button class="closeBoardList">
									<a >Modify</a>
								</button>
								
								<button class="closeBoardList">
									<%-- <a href="javascript:dBoard(${board.b_num})"> Delete </a>  --%>
									<!-- <a href="javascript:dBoard()"> Delete </a> -->
									<a id="boardDeleteBtn"> Delete </a>
								</button>
								
								
		  					</div> 
		  		
		  		
		  				</div> <!-- rightOpenDiv_Inner 끝 -->
		  			
		  			
		  			
		  			<!-- 리플 작성 -->
						<input type="hidden" id="b_num" name="b_num" value="${board.b_num}">
						<table class="replyWriteTable">
							<tr>
								
								<td class="replyWriteLeft">
								${sessionScope.loginId}
								</td>
								
								<td class="replyWriteMid">
								<input type="text" id="r_contents" > 
								</td>
								
								<td class="replyWriteRight">
								<input type="button" value="SAVE" id="replySaveButton">
								</td>
								
							</tr>
						</table> 
			 		
						
						<div class="replyViewWrapper">
						
							<div class="replyViewArea">
				 		
				 				<div id="listDiv"> </div>
				 		
				 			</div>
						
						</div>
						
						
					
		  			</div> <!-- rightOpenDiv_1 끝 -->
		  				
			  	</div> <!-- box2 끝 -->
			 
			</c:if> <!-- 로그인 끝 -->  
		      
		</div> <!-- wrapper를 안 쓰고는 있지만 혹시 몰라서 그냥 남겨놓음 -->
		
	</body>
	
</html>
