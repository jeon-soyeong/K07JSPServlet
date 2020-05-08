<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>forward된 페이지 입니다.</h2>
	<!--  
		포워드 처리된 페이지에서는 page영역은 공유되지 않고 request영역만
		공유된다. 따라서 해당 페이지의 가장 좁은 영역은 request영역이 된다.
	-->
	<h3>자바코드를 통해서 속성읽기</h3>
	<ul>
		<li>
			pageContext.getAttribute("scopeVar");
			<%=pageContext.getAttribute("scopeVar") %>
		</li>
		<li>
			request.getAttribute("scopeVar");
			<%=request.getAttribute("scopeVar") %>
		</li>
		<li>
			session.getAttribute("scopeVar");
			<%=session.getAttribute("scopeVar") %>
		</li>
		<li>
			application.getAttribute("scopeVar");
			<%=application.getAttribute("scopeVar") %>
		</li>
	</ul>
	<h3>각 영역에 저장된 속성읽기</h3>
	<ul>
		<li>페이지영역 : ${pageScope.scopeVar }</li>
		<li>리퀘스트영역 : ${requestScope.scopeVar }</li>
		<li>세션영역 : ${sessionScope.scopeVar }</li>
		<li>어플리케이션영역 : ${applicationScope.scopeVar }</li>
	</ul>
	
	<h3>xxxScope 미지정 후 속성읽기</h3>
	<ul>
		<li>가장좁은영역읽음 : ${scopeVar }</li>
		<li>포워드된 페이지에서는
		가장 좁은영역인 request영역이 읽혀지게 된다. page영역은
		포워드된 페이지에는 공유되지 않는다.</li>
	</ul>
</body>
</html>