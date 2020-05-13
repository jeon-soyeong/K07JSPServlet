<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForEach.jsp</title>
</head>
<body>
	<h2>일반 for문 형태의 forEach태그</h2>
	
	<!--  
	forEach태그의 첫번째 문법 : 일반for문
		형식] begin : 시작
			end : 종료
			step : 증가치
			var : 반복시 사용할 변수
	-->
	<h3>JSTL 및 EL로 Hn태그 출력하기</h3>
	<c:forEach begin="1" end="6" var="i">
		<h${i }>난 H${i }태그입니다.</h${i }>
	</c:forEach>
	
	<!--  
	일반 for문에서의 varStatus속성
		: 반복과 관련된 정보를 추상화한 클래스인 LoopTagStatus객체를
		통해 정보를 반환한다.
		count : 실제반복횟수(1~마지막)
		index : 변수 i의 변화하는 값
		first : loop의 처음일 때 true를 반환
		last : loop의 마지막일 때 true를 반환
		current : 현재 loop의 변수값(var 속성에 지정된 변수)
	-->
	<h3>varStatus속성 살펴보기</h3>
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<h4>${loop.count }번째 반복입니다.</h4>
		<ul>
			<li>index : ${loop.index }</li>
			<li>first : ${loop.first }</li>
			<li>last : ${loop.last }</li>
			<li>current : ${loop.current }</li>
		</ul>
	</c:forEach>
	
	<h3>1에서 100까지 정수중 홀수의 합</h3>
	<c:forEach begin="1" end="100" var="a">
		<c:if test="${a mod 2 ne 0 }">
			<c:set var="sum" value="${sum+a }"/>
		</c:if>
	</c:forEach>
	1~100사이의 정수중 홀수의 합은? ${sum }
	
	
	<h3>중첩된 for문 활용하기</h3>
	<!-- 
	연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach와 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	-->
	<h4>if문 사용하기</h4>
	<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:if test="${i eq j }" var="eq1">
			1&nbsp;
			</c:if>
			<c:if test="${not eq1 }">
			0&nbsp;
			</c:if>
		</c:forEach>
		<br/>
	</c:forEach>
	
	<h4>choose문 사용하기</h4>
	<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:choose>
				<c:when test="${i == j }">1&nbsp;</c:when>
				<c:otherwise>0&nbsp;</c:otherwise>
			</c:choose>
		</c:forEach>
		<br/>
	</c:forEach>
	
	
	<h2>구구단 출력하기</h2>
		<!-- 
		시나리오] JSTL의 forEach문을 이용하여 구구단을 출력하시오.
			table태그를 사용해야 하고, 짝수행에 마우스 오버시 빨간색으로
			홀수행에 마우스 오버시 노란색으로 바뀌게 코드를 작성하시오.
		 -->
	<h3>JSTL로 출력하기</h3>
	<table border="1">
		<c:forEach begin="2" end="9" var="dan" varStatus="gugudan">
		<c:choose>
			<c:when test="${gugudan.count mod 2 eq 0 }">
				<c:set var="color" value="red"/>
			</c:when>
			<c:otherwise>
				<c:set var="color" value="yellow"/>
			</c:otherwise>
		</c:choose>
		
	
		<tr onmouseover="this.style.backgroundColor='${color}';"
			onmouseout="this.style.backgroundColor='white';">
			<c:forEach begin="1" end="9" var="su">
			<td>${dan }*${su }=${dan*su }</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>