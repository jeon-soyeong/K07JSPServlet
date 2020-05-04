<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<%-- 
 	isErrorPage 지시어
 	 : 현재 JSP페이지가 에러처리를 담당하는지 구분하는 속성으로
 	 false가 디폴트값이다. 에러처리를 위해서 true로 설정해야 한다.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage.jsp</title>
</head>
<body>
	<h2>에러발생됨 : 관리자에게 문의하세요</h2>
	<h3>연락처 : 010-1234-5678</h3>
	<h3>서버 업그레이드 중입니다.</h3>
	<img src="https://previews.123rf.com/images/destinacigdem/destinacigdem1409/destinacigdem140900096/32021210-%EA%B3%B5%EC%82%AC%EC%A4%91.jpg" style="width:400px" alt="" />
	<h3>
		에러내용 : <%=exception.getMessage() %>
	</h3>
</body>
</html>