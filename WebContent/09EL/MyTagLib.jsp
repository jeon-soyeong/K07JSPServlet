<%@page import="eltag.MyTagLib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="my" uri="myTagLibTld"%>

<%--  
	EL에서 Java클래스의 메소드 호출 절차 및 방법
	1. 클래스와 메소드를 정의한다. 단 메소드 정의시 반드시 public static
		으로 선언해야 한다.
	2. TLD파일을 생성한다. Tag Library Description의 약자로
		web-inf폴더 하위 아무곳이나 생성하면 컨테이너가 찾아서 사용하게 된다.
		우리는 tlds 폴더를 생성한 후 해당 파일을 작성한다. 파일 작성시 fn.tld를 
		참조한다. 
	3. web.xml에 내가 정의한 태그라이브러리 파일을 설정한다.
		taglib-uri : JSP의 taglib지시어의 uri속성에 삽입할 값
		taglib-location : 실제 tld 파일의 위치(경로를 삽입함)
	4. jsp파일에서 EL식으로 메소드를 호출한다.
		페이지 상단에 taglib 지시어를 통한 디렉티브(페이지지시어)를 추가한 후
		${접두어 : 메소드명(인자)} 형태로 호출한다.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h3>Java코드로 메소드 호출하기</h3>
	<ul>
		<li>
			MyTagLib.isNumber("100") => <%=MyTagLib.isNumber("100") %>
		</li>
	</ul>
	
	<h3>EL에서 자바클래스의 Method호출하기</h3>
	<ol>
		<li>
			my:isNumber("100") => ${my:isNumber("100")}
		</li>
		<li>
			my:isNumber("100A") => ${my:isNumber("100A")}
		</li>
	</ol>
	
	<h2>연습문제</h2>
	<h3>EL에서 getGender 함수 호출하기</h3>
	<pre>
		주민번호를 매개변수로 전달하면 성별을 판단하여 반환하는 메소드를
		EL에서 호출할수 있도록 절차대로 작성하시오.
		함수명 : getGender("123456-1000000") => 남자
				getGender("123456-2000000") => 여자
		클래스 : eltag.MyTagLib 하위에 메소드 생성
	</pre>
	<ul>
		<li>
			주민번호 123456-1000000 : ${my:getGender("123456-1000000") }
			<!--남자 -->
		</li>
		<li>
			주민번호 123456-2000000 : ${my:getGender("123456-2000000") }
			<!--여자 -->
		</li>
		<li>
			주민번호 123456-9000000 : ${my:getGender("123456-9000000") }
			<!--주민번호 오류 -->
		</li>
	</ul>	
	
	
	
	
</body>
</html>