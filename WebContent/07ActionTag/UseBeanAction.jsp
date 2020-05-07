<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanAction.jsp</title>
</head>
<body>
	<h2>useBean 액션태그</h2>
	
	<h3>useBean 액션태그로 좁은의미의 자바빈 객체 생성하기</h3>
	
	<jsp:useBean id="member" class="model.MemberDTO" scope="request" />
	<%--
		//위 액션태그를 JSP코드로 표현하면 아래와 같다.
		//1. request영역에 저장된 객체를 가져온다.
		MemberDTO memberDTO = (MemberDTO)request.getAttribute("member");
		if(memberDTO==null){
			//2.만약 객체가 null값이면 객체를 생성한다.
			memberDTO = new MemberDTO();
			//3.생성된 객체를 request영역에 저장한다.
			request.setAttribute("member", memberDTO);
		}
		//액션태그를 사용하면 JSP코드보다 간결하게 표현할 수 있다.
	--%>
	
	 
	<%-- 
	<jsp:useBean 액션태그의 id속성과 <jsp:setProperty의 name 속성값이 
	서로 연결된다. 
	빈의 setter()메소드를 통해 값을 설정한다.
	--%>
	<h3>setProperty 액션태그로 자바빈 객체 속성지정하기</h3>
	<jsp:setProperty property="id" name="member"
		value="KIM" />
	<jsp:setProperty property="pass" name="member"
		value="1234" />
	<jsp:setProperty property="name" name="member"
		value="김희선" />
	
	<!--  
	빈의 getter()메소드를 통해 값을 가져온다.
	-->
	<h3>getProperty 액션태그로 자바빈 객체 속성읽기</h3>
	<ul>
		<li>아이디 : 
			<jsp:getProperty property="id" name="member"/>
		</li>
		<li>패스워드 : 
			<jsp:getProperty property="pass" name="member"/>
		</li>
		<li>이름 : 
			<jsp:getProperty property="name" name="member"/>
		</li>
	</ul>
	
	<jsp:forward page="UseBeanActionForward.jsp"></jsp:forward>
</body>
</html>