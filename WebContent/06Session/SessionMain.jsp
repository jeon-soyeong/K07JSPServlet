<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionMain.jsp</title>
</head>
<body>
	<h2>세션 유지시간 session내장객체로 설정하기</h2>
	<%
		/*  
		web.xml에서 설정할 때는 분단위로 설정하고, 만약 설정값이 없을 때는
		30분(1800초)로 설정된다. 웹어플리케이션이 실행될 때는 web.xml의
		설정값이 먼저 실행되고, 아래 JSP코드가 실행된다.
		*/
		//내장객체를 사용할 때는 초단위로 설정한다.
		session.setMaxInactiveInterval(1000);
	%>
	<h2>세션 유지시간 확인하기</h2>
	<p>
		<%=session.getMaxInactiveInterval() %>
	</p>	
	<h2>세션 아이디 확인하기</h2>
	<p>
		<%=session.getId() %>
	</p>
	
	<h2>세션의 최초/마지막 요청시간</h2>
	<%
	long createTime = session.getCreationTime();
	SimpleDateFormat s = new SimpleDateFormat("HH:mm:ss");
	String creationTimeString = s.format(new Date(createTime));
	
	long lastTime = session.getLastAccessedTime();
	String lastTimeString =  s.format(new Date(lastTime));
	%>
	<ul>
		<li>최초요청시간 : <%=creationTimeString %></li>
		<li>마지막요청시간 : <%=lastTimeString %></li>
	</ul>
	
	
	
	
</body>
</html>