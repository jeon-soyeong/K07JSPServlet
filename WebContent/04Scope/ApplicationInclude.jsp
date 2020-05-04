<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationInclude.jsp</title>
</head>
<body>
	<h2>인클루드 된 페이지</h2>
	
	<h3>page영역에 저장된 객체</h3>
	<%
	MemberDTO pageMember = 
		(MemberDTO)pageContext.getAttribute("pageMember");
	String pMemberStr = 
			String.format("아이디:%s,이름:%s,비번:%s,등록일:%s",
			pageMember!=null ? pageMember.getId(): "",
			pageMember!=null ? pageMember.getPass(): "",
			pageMember!=null ? pageMember.getName(): "",
			pageMember!=null ? pageMember.getRegidate(): "");
		out.println(pMemberStr);	
	%>
	<h3>request영역에 저장된 객체</h3>
	<%
	MemberDTO requestMember = 
		(MemberDTO)request.getAttribute("requestMember");
	String rMemberStr = 
			String.format("아이디:%s,이름:%s,비번:%s,등록일:%s",
			pageMember!=null ? requestMember.getId(): "",
			pageMember!=null ? requestMember.getPass(): "",
			pageMember!=null ? requestMember.getName(): "",
			pageMember!=null ? requestMember.getRegidate(): "");
		out.println(rMemberStr);	
	%>
</body>
</html>