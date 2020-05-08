<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>객체를 파라미터로 전달하기</h2>
	
	<%
	//포워드 전 request영역에 객체 저장
	request.setAttribute("dtoObj", new MemberDTO("KOSMO", "1234", "코스모", null));
	request.setAttribute("strObj", "문자열객체");
	request.setAttribute("integerObj", new Integer(100));
	%>
	<!--  
	결과페이지로 액션태그를 통해 포워드처리. 이때 파라미터도 같이 전달.
	-->
	<jsp:forward page ="ObjectResult.jsp">
		<jsp:param value="200" name="firstNum"></jsp:param>
		<jsp:param value="300" name="secondNum"></jsp:param>
	</jsp:forward>
</body>
</html>