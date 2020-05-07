<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardActionResult.jsp</title>
</head>
<body>
	<h2>포워드 & 리다이렉트 된 결과 페이지</h2>
	<ul>
		<li>
			페이지영역 확인하기 : 
			<%=pageContext.getAttribute("pageVar") %>
		</li>
		<li>
			리퀘스트영역 확인하기 : 
			<%=request.getAttribute("requestVar") %>
		</li>	
	</ul>
</body>
</html>