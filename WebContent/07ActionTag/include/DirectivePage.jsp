<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DirectivePage.jsp</title>
</head>
<body>
	<%
	String dirString = "지시어 페이지에서 생성한 변수";
	%>
	<h2 style="color: red">디렉티브 페이지 입니다.</h2>
	<ul>
		<li>페이지영역 : 
			<%=pageContext.getAttribute("pageVar") %></li>
		<li>리퀘스트영역 : 
			<%=request.getAttribute("requestVar") %></li>
	</ul>
</body>
</html>