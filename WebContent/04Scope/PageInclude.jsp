<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageInclude.jsp</title>
</head>
<body>
	<h2>포함된(include) 페이지 입니다.</h2>
	<ul>
		<li>Integer타입 : <%=pageContext.getAttribute("pageNumber") %></li>
		<li>String타입 : <%=pageContext.getAttribute("pageString") %></li>
		<li>Date타입 : <%=dateString %></li>
		<li>MemberDTO타입1 : <%=m1Str %></li>
		<li>MemberDTO타입2 : 아이디:<%=m2.getId() %>
							비번:<%=m2.getPass() %>
							이름:<%=m2.getName() %>
							가입일:<%=m2.getRegidate() %></li>
	</ul>
	
</body>
</html>