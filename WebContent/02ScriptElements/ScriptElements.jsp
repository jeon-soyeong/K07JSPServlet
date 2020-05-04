<%-- 
	JSP의 스크립트 요소들
	
	지시자(Directive) : 페이지 속성을 지정하거나 외부문서를
		include할 때 사용한다.
		사용법 : <%@ 지시자키워드
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%-- 
	선언부(Declaration) : 스크립트렛이나 표현식에서 사용할
		메소드를 선언할 때 사용된다. 함수는 주로 중복해서 사용하는
		경우가 많으므로 src(자바영역)을 많이 사용한다.
--%>
<%!
public int add(int a, int b){
	int result = a + b;
	return result;
}

public int substract(int a, int b){
	int result = a - b;
	return result;
}

public void showPrint(String str, JspWriter out){
	try{
		out.println("받은문자열:" + str);
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptElements.jsp</title>
</head>
<body>
	<h2>JSP의 스크립트 요소들(Scripting Elements)</h2>
	
	<%@ include file="../01Directive/IncludePage.jsp" %>
	
	<%-- 
	스크립트렛(Scriptlet) : 주로 JSP코드를 작성하고 실행할 때 사용하는
		영역이다. 스크립트렛은 head영역, body영역 어디서든 사용할 수 있다.
		사용법 : <% JSP코드;
	--%>
	<%
	int value1 = 3;
	int value2 = 9;
	
	int addResult = add(value1, value2);
	int subResult = substract(value1, value2);
	%>
	
	<%-- 
	표현식(Expression) : 변수를 웹브라우저상에 출력할 때 사용한다.
	 	JS의 document.write()와 동일한 역할을 한다. 표현식 사용시
	 	주의할 점은 문장 끝에 ;(세미콜론)을 생략해야 하는 것이다.
	 	사용법 : <%= 변수
	--%>
	<h3>표현식으로 변수를 화면에 출력하기</h3>
	<%=value1 %> + <%=value2 %> = <%=addResult %>
	<br />
	<%=value1 %> - <%=value2 %> = <%=subResult %>
	<br />
	<%
		/* 
		매개변수로 문자열과 out내장객체를 인자로 전달한다.
		함수에서 JSP의 내장객체를 사용할 때는 인자로 전달한 후
		해당 타입으로 매개변수를 선언해서 사용해야한다.
		*/
		showPrint("우리는KOSMO", out);
	%>
	<br />
	오늘 날짜는 : <%=todayStr %> [인클루드 된 파일에서 가져옴]
</body>
</html>