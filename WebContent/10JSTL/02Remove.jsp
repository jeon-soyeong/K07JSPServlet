<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02Remove.jsp</title>
</head>
<body>
	<!--  
		remove태그 : set으로 선언한 변수를 제거할 때 사용하는 태그
		영역에 저장된 속성을 제거하므로, 로그아웃에서 사용할 수도 있다.
	-->
	<h2>remove태그</h2>
	<c:set var="pageVar" value="페이지영역" />
	<c:set var="pageVar" value="리퀘스트영역1번" scope="request"/>
	<c:set var="requestVar" value="리퀘스트영역2번" scope="request"/>
	<c:set var="sessionVar" value="세션영역" scope="session"/>
	<c:set var="appVar" value="어플리케이션영역" scope="application"/>
	
	<!--  
		XXXScope내장객체를 사용하지 않으면 가장 좁은 영역의 변수를
		읽어온다. 변수명이 서로 다르면 생략이 가능하다.
	-->
	<h3>삭제전 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li>
		<li>리퀘스트1 : ${requestScope.pageVar }</li>
		<li>리퀘스트2 : ${requestVar }</li>
		<li>세션 : ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>
	
	<!--  
		속성명은 존재하지만, 영역설정이 잘못된 경우 아무것도 삭제되지 않는다.
		영역 혹은 변수명이 설정이 잘못되더라도 에러는 발생하지 않는다.
	-->
	<h3>remove로 삭제하기</h3>
	<c:remove var="requestVar" scope="session"/>
	
	<h3>영역이 다른 속성명 삭제후 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li>
		<li>리퀘스트1 : ${requestScope.pageVar }</li>
		<li>리퀘스트2 : ${requestVar }</li>
		<li>세션 : ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>
	
	<!--  
		영역에 동일한 이름의 속성이 존재하는 경우에는 모든 영역의
		속성이 한꺼번에 삭제된다. 그러므로 사용에 주의해야한다.
	-->
	<h3>remove로 삭제하기</h3>
	<c:remove var="pageVar"/>
	
	<h3>스코프 미지정 후 같은 속성명 삭제후 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li><!-- 삭제됨 -->
		<li>리퀘스트1 : ${requestScope.pageVar }</li><!-- 삭제됨 -->
		<li>리퀘스트2 : ${requestVar }</li>
		<li>세션 : ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>
</body>
</html>