<%@page import="java.net.URLEncoder"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//리퀘스트 영역에 속성 저장하기
request.setAttribute("requestNumber", 999);
request.setAttribute("requestString", "여기는 리퀘스트 영역입니다");
request.setAttribute("requestMember1", new MemberDTO(
		"Hong", "1234", "홍길동", null));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain.jsp</title>
</head>
<body>
	<h2>리퀘스트 영역에 저장된 속성값 읽기</h2>
	<ul>
		<li>Integer타입 :
			<%=request.getAttribute("requestNumber") %></li>
		<li>String타입 :
			<%=request.getAttribute("requestString") %></li>
		<%
		MemberDTO member = 
			(MemberDTO)request.getAttribute("requestMember1");
		%>
		<li>MemberDTO타입 : 
			아이디 : <%=member.getId() %>.
			패스워드 : <%=member.getPass() %>.
			이름 : <%=member.getName() %>.
			가입일 : <%=member.getRegidate() %></li>
	</ul>
	<h2>리퀘스트 영역에 저장된 속성 삭제 후 출력하기</h2>
	<%
		request.removeAttribute("NoKeyValue");//키 없으나 에러발생 X
		request.removeAttribute("requestNumber");
		request.removeAttribute("requestString");
	%>
	<ul>
		<li>Integer타입 :
			<%=request.getAttribute("requestNumber") %></li>
		<li>String타입 :
			<%=request.getAttribute("requestString") %></li>
		<li>MemberDTO타입 : 
			아이디 : <%=member.getId() %>.
			패스워드 : <%=member.getPass() %>.
			이름 : <%=member.getName() %>.
			가입일 : <%=member.getRegidate() %></li>
	</ul>
	
	<%-- 
	최초요청된 페이지와 포워드로 전달된 페이지는 request영역을 공유하게 된다.
	URL주소창에는 최초 요청된 페이지의 경로명이 보여지지만, 출력되는 페이지는
	새롭게 전달된 페이지의 내용을 출력되게된다.
	그러므로 사용자는 페이지 이동을 인지하지 못하지만, 내부적으로 페이지전달(포워드)
	된 것이다. 쿼리스트링 형태로 파라미터도 전달할 수 있다.
	--%>
	<h3>forward()를 사용한 페이지 전달</h3>
	<%
	/* RequestDispatcher dis = request.getRequestDispatcher("RequestResult.jsp?param=포워드방식");
	dis.forward(request, response); */
	%>
	
	
	<%-- 
	sendRedirect()는 JS의 location.href와 동일한 기능으로 새로운
	페이지에 대한 요청을 하게된다. 이 경우 request영역은 공유되지 않는다.
	웹브라우저의 URL주소창에는 새롭게 요청된 페이지의 경로명이 보여지게된다.
	--%>
	<h3>sendRedirect()를 사용한 페이지 이동</h3>
	<%
		response.sendRedirect("RequestResult.jsp?param="+
								URLEncoder.encode("리다이렉트방식", "UTF-8"));
	%>

</body>
</html>