<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamActionIncludeResult.jsp</title>
</head>
<body>
	<h2>인클루드 된 페이지</h2>
	
	<h3>param액션태그로 전달된 값 출력하기</h3>
	<ul>
		<li>queryString : <%=request.getParameter("query") %></li>
		<li>name : <%=request.getParameter("name") %></li>
		<li>id : <%=request.getParameter("id") %></li>
	</ul>
	
	<!--  
	MemberDTO객체에 오버라이딩 처리한 toString()메소드를 통해서
	객체의 속성(멤버변수)이 출력된다.
	-->
	<h2>영역에 저장된 데이터 읽기</h2>
	<%=request.getAttribute("member") %>
</body>
</html>