<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

MemberDAO dao = new MemberDAO(drv, url);

/*
//방법1 :  count(*) 함수를 통해 회원의 존재유무만 판단한다.
//		따라서 회원의 아이디, 패스워드 이외의 정보는 DB에서 가져올 수 없다.
boolean isMember = dao.isMember(id, pw);
if(isMember==true){
	session.setAttribute("USER_ID", id);
	session.setAttribute("USER_PW", pw);
	
	response.sendRedirect("Login.jsp");
}
else{
	request.setAttribute("ERROR_MSG", "넌 회원이 아니시군-_-;");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
} */


//방법2 : 회원테이블에서 레코드를 추출한 후 MemberDTO객체에 저장 후 반환받기
/* MemberDTO memberDTO = dao.getMemberDTO(id, pw);
//DTO객체의 name컬럼의 값이 있는지 확인...
if(memberDTO.getId()!=null){
	//저장된 값이 있다면..세션영역에 아이디, 패스워드, 이름을 속성으로 저장한다.
	session.setAttribute("USER_ID", memberDTO.getId());
	session.setAttribute("USER_PW", memberDTO.getPass());
	session.setAttribute("USER_NAME", memberDTO.getName());
	
	response.sendRedirect("Login.jsp");
}
else{
	//저장된 값이 없다면... 리퀘스트 영역에 오류메세지를 저장하고 포워드한다.
	request.setAttribute("ERROR_MSG", "넌 회원이 아니시군-_-;");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
} */

//방법3 : Map 컬렉션에 회원정보 저장 후 반환받기
Map<String, String> memberInfo = dao.getMemberMap(id, pw);
//Map의 id키값에 저장된 값이 있는지 확인
if(memberInfo.get("id")!=null){
	//저장된 값이 있다면..세션영역에 아이디, 패스워드, 이름을 속성으로 저장한다.
	session.setAttribute("USER_ID", memberInfo.get("id"));
	session.setAttribute("USER_PW", memberInfo.get("pass"));
	session.setAttribute("USER_NAME", memberInfo.get("name"));
	
	response.sendRedirect("Login.jsp");
}
else{
	//저장된 값이 없다면... 리퀘스트 영역에 오류메세지를 저장하고 포워드한다.
	request.setAttribute("ERROR_MSG", "넌 회원이 아니시군-_-;");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}	
%>   





