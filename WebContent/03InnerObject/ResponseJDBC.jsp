<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseJDBC.jsp</title>
</head>
<body>
<%
/*
web.xml에 입력된 컨텍스트 초기화 파라미터를 가져온다.
이때 application객체를 사용한다.
*/
String driver = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//model패키지에 정의된 MemberDAO 클래스를 통해 오라클에 연결한다.
MemberDAO dao = new MemberDAO(driver, url);

//로그인 페이지에서 전송한 아이디, 패스워드 폼값을 받아 저장한다.
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pwd");

//저장된 변수를 isMember()메소드의 파라미터로 전달한다.
boolean memberFlag = dao.isMember(id, pw);
if(memberFlag == true){
	//회원인증에 성공하면 true를 반환한다.
	System.out.println("회원입니다.");
	response.sendRedirect("../common/Welcome.jsp");
}
else{
	//실패하면 false를 반환한다.
	System.out.println("회원이 아닙니다.");
	
	String jsAlert = "<script>";
	jsAlert += "alert('회원이 아닙니다.');";
	jsAlert += "history.go(-1)";
	jsAlert += "</script>";
	
	out.println(jsAlert);
}
%>
</body>
</html>