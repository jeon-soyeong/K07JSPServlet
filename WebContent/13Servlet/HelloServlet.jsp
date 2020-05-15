<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet.jsp</title>
</head>
<body>
	<!--  
	서블릿 작성순서
	
	step1] 서블릿 작성
	1. 사용자가 전달한 값이 있으면 request객체의 getParameter
	-->
	<h2>서블릿(Servlet) 만들기</h2>
	
	<h3>First Servlet</h3>
	<!--  
		서블릿을 호출하기 위한 요청명을 먼저 결정한다. 아래 경로는
		상대경로이므로 컨텍스트 루트를 신경쓸 필요가 없다.
	-->
	<!-- 상대경로 -->
	<a href="./NoJSPServlet.do">
		JSP파일없이 화면에 결과 출력하기(Servlet에서 바로출력)-상대경로
	</a>
	
	<br />
	
	<!-- 절대경로 -->
	<!-- /K07JSPServlet/NoJSPServlet.do (이면 web.xml은 /NoJSPServlet.do) -->
	<a href="/K07JSPServlet/13Servlet/NoJSPServlet.do">
		JSP파일없이 화면에 결과 출력하기(Servlet에서 바로출력)-절대경로
	</a>
	
	<!-- (/없으면) ./생략된 것과 같음 -->
	<h3>HelloServlet</h3>
	<h4>${message } - ${HELLO }</h4>
	<h4><%=request.getAttribute("message") %></h4>
	<a href="HelloServlet.do">
		JSP파일(View)에서 화면 출력하기
	</a>
	
	
	<h3>WebServlet - 어노테이션으로 서블릿 매핑하기</h3>
	<a href="AnnoWebServlet.do">
		AnnoWebServlet.do바로가기
	</a>
	
	<h3>서블릿으로 간단한 사칙연산 계산기 만들기</h3>
	<form method="get" action="<%=request.getContextPath()%>/Servlet/Calculate.kosmo">
		<input type="text" name="firstNum" size="5" />
		<select name="operator" >
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>
		</select>
		<input type="text" name="secondNum" size="5"/>
		<input type="submit" value="연산결과는?"/>
		<h4 style="color:red; font-size: 1.5em">
			${calResult }
		</h4>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>