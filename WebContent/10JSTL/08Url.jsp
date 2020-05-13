<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08Url.jsp</title>
</head>
<body>
	<!--  
	url태그
	- URL을 생성할 때 사용한다.
	- 절대경로로 생성시에는 컨텍스트 루트를 제외해야 한다.
	- var속성을 미지정하는 경우 해당 위치에 URL이 출력된다.
	- param태그로 지정한 값들이 쿼리스트링으로 연결된다.
	-->
	<h2>var속성 미지정</h2>
	<c:url value="/10JSTL/inc/ImportPage.jsp" >
		<c:param name="user_id" value="Gasan" />
		<c:param name="user_pw">Digital</c:param>
	</c:url>
	
	<h3>var속성 지정</h3>
	<c:url value="/10JSTL/inc/ImportPage.jsp" var="url">
		<c:param name="user_id" value="World"></c:param>
		<c:param name="user_pw">메르디앙 2차</c:param>
	</c:url>
	<h3>var속성 지정 후 원하는 위치에 url설정</h3>
	<a href="${url }">ImportPage.jsp바로가기</a>
	<h3>HTML 태그에 직접 JSTL로 절대경로 지정하기</h3>
	<a href="<c:url
	value='/10JSTL/inc/ImportPage.jsp?user_id=Lee&user_pw=7777'/>">
	ImportPage.jsp바로가기
	</a>
</body>
</html>