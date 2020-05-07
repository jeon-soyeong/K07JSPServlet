<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//out.print("글쓰기처리:" + request.getParameter("title"));
%>

<!-- 글작성 완료 전 로그인 체크하기 --> 
<%@ include file="../common/isLogin.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

//폼값 전송받기
String title = request.getParameter("title");//제목
String content = request.getParameter("content");//내용

//폼값을 DTO객체에 저장
BbsDTO dto =  new BbsDTO();
dto.setTitle(title);
dto.setContent(content);
//세션영역에 저장된 회원인증정보를 가져와서 저장.
dto.setId(session.getAttribute("USER_ID").toString());

//DAO객체 생성시 application내장객체를 인자로 전달
BbsDAO dao = new BbsDAO(application);

//사용자의 입력값을 DTO객체에 저장후 파라미터로 전달
int affected = dao.insertWrite(dto);
/* int affected = 0;
for(int i=1; i<=100; i++){
	dto.setTitle(title + i + "번째 게시물");
	affected = dao.insertWrite(dto);
} */
		
if(affected==1){
	//글쓰기에 성공했을 때...
	response.sendRedirect("BoardList.jsp");
}
else{
	//글쓰기에 실패했을 때...
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>