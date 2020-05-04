<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestParameter.jsp</title>
</head>
<body>
<%
//한글 깨짐 방지
request.setCharacterEncoding("UTF-8");
/* 
전송방식 get/post에 상관없이 getParameter("파라미터명") 메소드로
폼값을 받을 수 있다. 만약 값이 입력되지 않았다면 길이가 0인 String객체를
반환하고, 파라미터명이 틀린 경우에는 null을 반환한다.
*/
String id = request.getParameter("id");

String name =  request.getParameter("name");
if( !(name==null || name.equals("")) ){
	out.println("이름 : " + name);
}
else{
	/*  
	스크립트렛 안에서 JS를 선언할 때는 out.println()을 통해서
	아래와 같이 사용할 수 있다. 또한 문자열을 연결하여 사용할 수도 
	있다. 
	*/
	out.println("<script>");
	out.println("	alert('이름을 입력하세요');");
	//out.println("	history.back();");
	//out.println("</script>");
	String jsStr = "history.back();"
				+	"</script>";
	out.println(jsStr);
}

/*  
radio는 폼값을 아래 2가지 방법을 모두 사용할 수 있다.
항목은 여러개이나, 실제 선택가능한 항목은 하나이기 때문이다.
*/
//방법1 : text타입과 동일한 형태로 폼값을 받을 때..
//String sexStr = request.getParameter("sex");
//방법2 : checkbox처럼 배열형태로 폼값을 받을 때..
String[] sexArr = request.getParameterValues("sex");
String sexStr = null;
if(sexArr != null) sexStr = sexArr[0];

/*  
checkbox는 아래와 같이 getPrameterValues()를 사용한다.
여러 개의 항목 중 체크가 된 항목만 전송된다. 파라미터명이 틀리거나
값이 전송되지 않으면 null을 반환한다.
*/
String[] favo = request.getParameterValues("favorite");
String favStr = "";

if(favo != null){
	for(int i=0; i<favo.length; i++){//1,2,3
		/*  
		전송된 항목을 하나의 문자열로 연결하여 저장한다.
		문자열의 마지막 부분에 ,를 제거하기 위해 if문을
		통해 체크하고 있다.
		*/
		if(i==favo.length-1){
			favStr += favo[i];
		}
		else{
			favStr += favo[i] + ",";
		}
	}
}

/*  
textarea를 통해 입력받은 값은 엔터키(줄바꿈기호 \r\n)가 포함되어 있다.
웹브라우저에 출력할 때는 특수기호를 <br>태그로 변환 후 출력해야 한다.
*/
String self_intro = 
request.getParameter("self_intro").replace("\r\n", "<br/>");
%>
<ul>
	<li>이름 : <%=name %></li>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sexStr %></li>
	<li>관심사항 : <%=favStr %></li>
	<li>자기소개 : <%=self_intro %></li>
</ul>


<%
/*  
getParameterNames() : 폼값의 이름을 한꺼번에 받을 때 사용하는 
	request 내장객체의 메소드로 반환타입은 Enumeration형이다.
	
	hasMoreElements() : 객체에 남은 폼값이 있는지 검사
	nextElement() : 받은 폼값 중 다음 폼의 이름을 반환
*/

Enumeration names = request.getParameterNames();
while(names.hasMoreElements()){
	
	String paramName = (String)names.nextElement();
	System.out.println("파라미터명:" + paramName);
	
	if(paramName.equals("sex") || paramName.equals("favorite")){
		System.out.println("getParameterValues()로 읽기");
		out.println("파라미터명을 getParameterValues()로"
								+" 얻어서 값 출력함<br/>");
	}
	else{
		System.out.println("getParameter()로 읽기");
		out.println("파라미터명을 메소드로 얻어서"
				+" 값 출력 : ");
		out.println(request.getParameter(paramName) + "<br/>");
	}
}
%>
</body>
</html>