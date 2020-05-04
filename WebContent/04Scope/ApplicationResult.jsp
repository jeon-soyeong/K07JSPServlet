<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationResult.jsp</title>
</head>
<body>
	<!--  
		어플리케이션 영역에 저장된 속성은 페이지이동, 전달이 되더라도
		그 영역이 공유되고, 웹브라우저를 종료했다가 다시 실행하더라도
		그 영역이 공유된다. 즉 한번 저장되면 웹서버가 셧다운(종료)될 때까지는
		속성값이 유지된다.
	-->
	<h2>어플리케이션 영역에 저장된 속성 읽기</h2>
	
	<h3>리스트 계열 컬렉션(application영역)</h3>
	
	<h4>웹어플리케이션 전체에서 공유됨</h4>
	<ul>
	<%
	List<MemberDTO> lists = 
		(List<MemberDTO>)application.getAttribute("lists");
	for(MemberDTO member : lists){
	%>
		<li>
			아이디 : <%=member.getId() %>,
			패스워드 : <%=member.getPass() %>,
			이름 : <%=member.getName() %>,
			가입일 : <%=member.getRegidate() %>
		</li>
	<%
	}
	%>
	</ul>
	
	<h3>맵 계열 컬렉션(application영역)</h3>
	
	<ul style="list-style-type: upper-roman;">
	<%
	
	Map<String, MemberDTO> maps = 
		(Map<String,MemberDTO>)application.getAttribute("maps");
	Set<String> keys = maps.keySet();
	for(String key : keys){
		MemberDTO value = maps.get(key);
	%>
		<li>
			아이디 : <%=value.getId() %>,
			패스워드 : <%=value.getPass() %>,
			이름 : <%=value.getName() %>,
			가입일 : <%=value.getRegidate() %>
		</li>
	<%
	}
	%>
	</ul>
	
	<h3>page영역에 저장된 MemberDTO객체 읽어오기</h3>
	
	<h4>해당페이지에서만 사용가능하고, 페이지 이동 또는 forward되면
	해당 영역은 사라진다.</h4>
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
	<h3>request영역에 저장된 객체 MemberDTO객체 읽어오기 </h3>
	
	<h4>forward된 페이지까지 영역이 공유된다.</h4>
	<%
	MemberDTO requestMember = 
		(MemberDTO)request.getAttribute("requestMember");
	String rMemberStr = 
			String.format("아이디:%s,이름:%s,비번:%s,등록일:%s",
			requestMember!=null ? requestMember.getId(): "",
			requestMember!=null ? requestMember.getPass(): "",
			requestMember!=null ? requestMember.getName(): "",
			requestMember!=null ? requestMember.getRegidate(): "");
	out.println(rMemberStr);	
	%>
</body>
</html>