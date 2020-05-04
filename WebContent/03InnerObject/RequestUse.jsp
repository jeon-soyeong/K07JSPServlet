<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글 깨짐 방지
request.setCharacterEncoding("UTF-8");
//폼값 받기
String color = request.getParameter("color");
String font = request.getParameter("font");
//최초 접속시 디폴트값 설정
if(color==null || color.length()==0) color="black";
if(font==null || font.length()==0) font="Verdana";
%>
<!DOCTYPE html>
<html>
<style type="text/css">

	/* style sheet내에서 표현식이나 스크립트렛을 사용할 수 있다. */
	span{
	font-size: 2em;
	color: <%=color%>;
	font-family: <%=font%>;
	}
</style>
<head>
<meta charset="UTF-8">
<title>RequestUse.jsp</title>
</head>
<body>
	<h2>Request객체와 Scripting Element 응용하기</h2>
	
	<h3>HTML안에서 스크립팅 요소 사용하기</h3>
	<% for(int i=1; i<=6; i++) { %>
		<h<%=i %>>제목<%=i %>입니다.</h<%=i %>>
	<% } %>
		
	<h3>숫자를 입력후 버튼을 눌러주세요</h3>
	<!--  
		form태그에 method속성이 없으므로 get방식 전송
			action속성이 없으므로 현재페이지로 폼값 전송
	-->
	<form>
		<input type="text" name="counter" />
		<input type="submit" value="이미지카운터" />
	</form>
	<%
	String counter = request.getParameter("counter");
	if(counter != null){
		/*  
		toCharArray() : String을 char형 배열로 반환해주는 메소드.
		*/
		char[] ch = counter.toCharArray();
		for(int i=0; i<ch.length; i++){
	%>
		<img src="../images/num_<%=ch[i] %>.gif"
			 alt="<%=ch[i] %>번이미지" />
	<%
		}
	}	
	%>
	<h2>CSS안에서 스크립팅 요소 사용하기</h2>
	<span>CSS를 적용한 텍스트</span>
	<form method="post">
		[글자색]
		<select name="color">
			<option value="red">빨간색</option>
			<option value="blue">파란색</option>
			<option value="green">녹색</option>
		</select>
		[글꼴]
		<select name="font">
			<option value="굴림체">굴림체</option>
			<option value="바탕체">바탕체</option>
			<option value="휴먼옛체">휴먼옛체</option>
		</select>
		<input type="submit" value="폰트&색상변경" />
	</form>
</body>
</html>