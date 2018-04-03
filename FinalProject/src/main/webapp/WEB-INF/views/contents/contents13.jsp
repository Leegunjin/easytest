<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.home {
	margin-bottom: 10px;
	margin-left: 20px;
}

.javaCode {
	margin-left: 170px;
	margin-top: 10px;
}
.error{
margin-left: 20px;
margin-bottom: 30px;
}
.next{
	margin-left: 170px;
	margin-bottom: 30px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trophy Quiz</title>
</head>
<body>
	<form action="contents13" method="get" id="contents13">

		<button id="home" value="home" class="home">HOME</button>
		<button id="javaCode" value="JAVACODE 보기" class="javaCode">JAVACODE
			보기</button>
		<br>
		<br>
		<div id="quizQuestion">
			다음 네모를 보고 네모의 넓이를 구하세요<br><br>
			 1. 가로 길이를 나타내는 자료형과 변수명을 선언,생성 하세요.
		</div><br>
		<div id="quizSession">
			<input type="text" id="quiz1" name="quiz1">
		</div><br><br>
		<div id="quizQuestion">
			2. 세로 길이를 나타내는 자료형과 변수명을 선언,생성 하세요.
		</div><br>
		<div id="quizSession">
			<input type="text" id="quiz2" name="quiz2">
		</div><br><br>
		<div id="quizSession">3. 넓이를 나타내는 자료형과 변수명을 선언,생성 하세요.</div>
		<div><br>
			<input type="text" id="quiz3" name="quiz3">
		</div><br><br>
		<div id="quizSession">4. 다 작성하였으면 정답버튼을 눌러 제출하세요</div><br>
		<div>
			<input type="text" id="quiz4" name="quiz4" size="50px;">
			<button id="submit" value="제출" class="submit">제출</button>
		</div><br><br>
		<button id="error" value="Error 확인" class="error">Error 확인</button>
		<button id="next" value="다음 단계로" class="next">다음 단계로</button>
	</form>
</body>
</html>