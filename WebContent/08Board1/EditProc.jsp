<%@page import="oracle.net.aso.a"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../common/isLogin.jsp" %>
 <%
 request.setCharacterEncoding("UTF-8");
 
 String num = request.getParameter("num");
 String title = request.getParameter("title");
 String content = request.getParameter("content");
 
 BbsDTO dto = new BbsDTO();
 dto.setNum(num);
 dto.setTitle(title);
 dto.setContent(content);
 
 BbsDAO dao = new BbsDAO(application);
 //DTO객체를 DAO로 전달하여 게시물 업데이트(수정)
 int affected = dao.updateEdit(dto);
 if(affected==1){
	 //정상적으로 수정되었다면 수정된 내용의 확인을 위해 상세보기로 이동
	 response.sendRedirect("BoardView.jsp?num="+dto.getNum());
 }
 else{
	 //수정 중 문제가 발생하였다면 수정하기 페이지로 돌아간다.
 %>
	<script>
		alert("수정하기에 실패하였습니다.");
		history.go(-1);
	</script>	 
<%
 }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>

</body>
</html>