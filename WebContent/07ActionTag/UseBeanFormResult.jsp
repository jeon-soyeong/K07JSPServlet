<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//POST로 전송되는 한글에 대한 처리
request.setCharacterEncoding("UTF-8");
//폼값 받기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
//Bean(DTO)객체 생성
MemberDTO member1 = new MemberDTO();
//setter메소드를 통해 값 설정
member1.setId(id);
member1.setPass(pass);
member1.setName(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormResult.jsp</title>
</head>
<body>
	<h2>useBean 액션태그로 폼의 하위요소값 받기</h2>
	
	<h3>자바코드를 통해 받기</h3>
	<ul>
		<li><%=member1.getId() %></li>
		<li><%=member1.getPass() %></li>
		<li><%=member1.getName() %></li>
	</ul>
	
	
	<h3>액션태그로 폼값 받기</h3>
	<!--  
	useBean을 통해 객체 생성시 scope속성이 없으면 가장좁은 page영역에 저장된다.
	액션태그로 자바빈을 생성한 후 전송된 폼값을 한번에 설정한다. 폼의 name속성과
	1:1로 매칭되는 DTO의 속성(멤버변수)들이 있기 때문에 이와 같은 작업이 가능하다.
	이런 형태의 객체를 "커멘드 객체"라고 한다.
	-->
	<jsp:useBean id="actionMember" class="model.MemberDTO" />
	<jsp:setProperty property="*" name="actionMember"/>
	<ul>
		<li><%=actionMember.getId() %></li>
		<li><%=actionMember.getPass() %></li>
		<li><%=actionMember.getName() %></li>
	</ul>
</body>
</html>