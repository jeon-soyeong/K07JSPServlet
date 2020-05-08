<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("scopeVar", "페이지영역");
request.setAttribute("scopeVar", "리퀘스트영역");
session.setAttribute("scopeVar", "세션영역");
application.setAttribute("scopeVar", "어플리케이션영역");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<!--  
	EL에서 각 영역에 저장된 속성을 읽을 때는 xxxScope계열의 내장객체를
	사용한다.
	xxxScope.속성명 혹은 xxxScope['속성명']형태로 읽어올 수 있고,
	속성명이 유일할 때는 내장객체를 생략할 수 있다. 만약 속성명이 동일하면
	가장 좁은 영역의 속성을 읽어온다.
	-->
	<h2>EL에서 내장객체 사용하기  : xxxScope계열</h2>
	<h3>각 영역에 저장된 속성읽기</h3>
	<ul>
		<li>페이지영역  : ${pageScope.scopeVar }</li>
		<li>리퀘스트영역  : ${requestScope.scopeVar }</li>
		<li>세션영역  : ${sessionScope.scopeVar }</li>
		<li>어플리케이션영역  : ${applicationScope.scopeVar }</li>
	</ul>
	
	<h3>xxxScope 미지정 후 속성읽기</h3>
	<ul>
		<li>가장좁은영역 읽음 : ${scopeVar }</li>
		<li>위처럼 영역부분을 생략한 후 EL로 읽게되면 가장 좁은영역인
		page영역이 읽혀지게 된다.</li>		
	</ul>
	
	<jsp:forward page="InnerForward.jsp" />
</body>
</html>