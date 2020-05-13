<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06Import.jsp</title>
</head>
<body>
	<h2>import 태그</h2>
	<c:set var="requestVar" value="리퀘스트영역" scope="request"/>
	
	<!--  
		JSTL의 import태그
		-jsp:include 액션태그와 같은 기능으로 request영역을 공유한다.
		서로 다른 페이지를 의미하므로 page영역은 공유되지 않는다.
		-url속성에 절대경로 설정시 컨텍스트루트명은 제외한다.
	-->
	<h3>var속성 미지정 - 해당 위치에 바로 삽입됨. (include 액션태그와 동일함)</h3>
	<c:import url="/10JSTL/inc/ImportPage.jsp">
		<c:param name="user_id">KOSMO</c:param>
		<c:param name="user_pw" value="1234"/>
	</c:import>
	
	<h3>var속성 지정 - 선언 후 원하는 위치에 삽입할 때 </h3>
	<c:import url="/10JSTL/inc/ImportPage.jsp" var="contents">
		<c:param name="user_id" value="Hong"/>
		<c:param name="user_pw" value="9876"/>
	</c:import>
	<!--  
		var속성을 사용하면 포함된 문서가 변수에 저장되고,
		차후 원하는 위치에 변수를 출력하는 형태로 사용한다.
		HTML소스가 좀더 간결해지는 장점이 있다.
	-->
	<h3>import선언은 위에서, 삽입은 아래서 처리</h3>
	${contents }
	
	<h3>외부(원격)에 있는 내용 삽입하기</h3>
	<iframe src="./inc/ImportNate.jsp" frameborder="1" 
		style="width:100%; height:500px;"></iframe>
</body>	
</html>