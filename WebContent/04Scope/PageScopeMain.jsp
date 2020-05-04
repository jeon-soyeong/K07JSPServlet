<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*  
모든영역(페이지, 리퀘스트, 세션, 어플리케이션)에는 모든 타입의 객체를
저장할 수 있다. Object타입으로 자동 형변환되어 저장되고, 사용시에는
각 객체로 형변환 후 사용하면 된다. 차후 EL(표현언어)을 사용하면 형변환없이
사용할 수 있다.

1. page영역
	-페이지영역에 저장된 속성은 해당 페이지에서만 공유되고, 페이지를
	벗어나는 순간 소멸된다.
	-페이지영역에는 pageContext 내장객체를 사용하여 영역을
	사용한다.
*/
pageContext.setAttribute("pageNumber", 1000);
pageContext.setAttribute("pageString", "페이지영역에 저장한 문자열");
pageContext.setAttribute("pageDate", new Date());

MemberDTO member1 = new MemberDTO();
member1.setId("KOSMO");
member1.setName("한국소프트웨어인재개발원");
member1.setPass("가산1234");
member1.setRegidate(java.sql.Date.valueOf("2017-12-31"));
pageContext.setAttribute("pageMember1", member1);

pageContext.setAttribute("pageMember2", new MemberDTO("Nakja", "1234", "성강사", null));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeMain.jsp</title>
</head>
<body>
	<h2>page영역에 저장된 속성값 읽어오기</h2>
	<%
	/*  
	page영역에 저장될 때 Object타입으로 자동형변환되어 저장되므로
	읽어올 때도 Object타입으로 가져오는 것이 기본이다.
	*/
	Object obj =  pageContext.getAttribute("pageDate");
	String dateString = "";
	//Date타입으로 형변환 가능한지 확인 후...
	if(obj instanceof Date){
		//가능하다면 Date타입으로 형변환한다.
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
		dateString = sdf.format((Date)obj);
	}
	
	MemberDTO m1 = (MemberDTO)pageContext.getAttribute("pageMember1");
	String m1Str = String.format("아이디:%s,비번:%s,이름:%s,가입일:%s",
						m1.getId(),
						m1.getPass(),
						m1.getName(),
						m1.getRegidate());
	MemberDTO m2 = (MemberDTO)pageContext.getAttribute("pageMember2");
	%>
	<ul>
		<li>Integer타입 : <%=pageContext.getAttribute("pageNumber") %></li>
		<li>String타입 : <%=pageContext.getAttribute("pageString") %></li>
		<li>Date타입 : <%=dateString %></li>
		<li>MemberDTO타입1 : <%=m1Str %></li>
		<li>MemberDTO타입2 : 아이디:<%=m2.getId() %>
							비번:<%=m2.getPass() %>
							이름:<%=m2.getName() %>
							가입일:<%=m2.getRegidate() %></li>
	</ul>
	<%-- 
		페이지영역에 저장된 속성값은 새로운 페이지에 대한 요청이 발생하면
		속성값이 모두 파괴되어 소멸된다. 즉 다른 페이지와는 속성이
		공유되지 않는다.
	--%>
	<h2>페이지 이동</h2>
	<a href="PageResult.jsp">
		page영역 공유확인을 위한 링크
	</a>
	
	<br />
	<%-- 
		외부파일을 인클루드 하는 경우 외부문서는 원본그대로 현재문서에
		포함된 후 컴파일되므로 include 지시어를 사용하는 경우 
		같은 페이지로 취급되어 페이지 영역이 공유된다.
	--%>
	<%@ include file = "PageInclude.jsp" %>
</body>
</html>