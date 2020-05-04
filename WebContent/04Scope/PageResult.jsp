<%@page import="model.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageResult.jsp</title>
</head>
<body>
	<h2>이전페이지에서 지정한 페이지영역의 속성 읽기</h2>
	<%
	Object obj =  pageContext.getAttribute("pageDate");
	String dateString = "";
	if(obj instanceof Date){
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
		dateString = sdf.format((Date)obj);
	}
	
	MemberDTO m1 = (MemberDTO)pageContext.getAttribute("pageMember1");
	String m1Str = String.format("아이디:%s,비번:%s,이름:%s,가입일:%s",
						m1!=null ? m1.getId():"",
						m1!=null ? m1.getPass():"",
						m1!=null ? m1.getName():"",
						m1!=null ? m1.getRegidate():"");
	%>
	<ul>
		<li>Date객체 : <%=dateString %></li>
		<li>MemberDTO객체 : <%=m1Str %></li>
	</ul>

</body>
</html>