<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//한글깨짐처리(post로 폼값전송시 깨짐 부분 처리)
request.setCharacterEncoding("UTF-8");

//파일업로드를 위한 MultipartRequest객체의 파라미터 준비
//1. 파일을 업로드할 서버의 물리적경로 가져오기
/*  
	운영체제 별로 서버의 물리적 경로는 달라질 수 있으므로 파일이 
	업로드되는 정확한 위치를 알기 위해서 반드시 필요한 정보이다.
*/
String saveDirectory = application.getRealPath("/Upload");

//2. 업로드할 파일의 최대용량 설정(바이트 단위)
/*  
	만약 파일을 여러개 업로드 한다면 각각의 용량을 합친
	용량이 최대용량이 된다.
	Ex) 500kb * 2 = 1000kb
*/
int maxPostSize = 1024 * 5000;

//3. 인코딩 타입 설정
String encoding = "UTF-8";

//4. 파일명 중복처리 
/*  
	파일명이 중복되는 경우 자동인덱스를 부여하여 파일명을 수정해준다.
	Ex) apple.png, apple1.png, apple2.png ...와 같은 형태로 이름을
	부여한다.
*/
FileRenamePolicy policy = new DefaultFileRenamePolicy();

//전송된 폼값을 저장하기 위한 변수생성
MultipartRequest mr = null;
String name = null;//이름
String title = null;//제목
StringBuffer inter = new StringBuffer();//관심사항을 저장함
try{
	/*  
	1~4번까지 준비한 인자를 이용하여 MultipartRequest객체를 생성한다.
	객체가 정상적으로 생성되면 파일업로드는 완료된다. 
	만약 예외가 발생한다면 주로 최대용량 초과 혹은 디렉토리 경로가
	잘못된 경우가 대부분이다.
	*/
	mr = new MultipartRequest(request, saveDirectory, maxPostSize,
			encoding, policy);
	
	//파일을 제외한 나머지 폼값을 받아온다.
	/*  
		폼값은 request 내장객체를 통해서가 아니라 MultipartRequest객체를 
		통해서 받는다.
	*/
	name = mr.getParameter("name");
	title = mr.getParameter("title");
	String[] interArr = mr.getParameterValues("inter");
	for(String s : interArr){
		inter.append(s + ",&nbsp;");
	}
}
catch(Exception e){
	/*  
		파일업로드시 예외가 발생하면 request영역에 오류메세지를
		저장하고, 업로드폼 페이지로 포워드한다.
	*/
	request.setAttribute("errorMessage", "파일업로드오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>UploadProc.jsp</title>
</head>
<body>
	<h2>파일 업로드 결과</h2>
	<ul>
		<li>
			작성자 : <%=name %>
		</li>
		<li>
			제목 : <%=title %>
		</li>
		<li>
			관심사항 : <%=inter %>
		</li>
	</ul>
	<h2>첨부파일1</h2>
	<ul>
		<li>원본파일명 : 
		<%=mr.getOriginalFileName("chumFile1") %></li>
		<li>서버에저장된파일명 : 
		<%=mr.getFilesystemName("chumFile1") %></li>
		<li>컨텐츠타입 : 
		<%=mr.getContentType("chumFile1") %></li>
		<li>파일크기 : <%=(int)Math.ceil(mr.getFile("chumFile1")
				.length() / 1024.0) %> kb
		</li>
		<li>이미지표현 : 
		<img src="../Upload/<%=mr.getFilesystemName("chumFile1") %>" 
		width="200" /></li>
	</ul>
	
	<h2>첨부파일2</h2>
	<ul>
		<li>원본파일명 : 
		<%=mr.getOriginalFileName("chumFile2") %></li>
		<li>서버에저장된파일명 : 
		<%=mr.getFilesystemName("chumFile2") %></li>
		<li>컨텐츠타입 : 
		<%=mr.getContentType("chumFile2") %></li>
		<li>파일크기 : <%=(int)Math.ceil(mr.getFile("chumFile2")
				.length() / 1024.0) %> kb
		</li>
		<li>이미지표현 : 
		<img src="../Upload/<%=mr.getFilesystemName("chumFile2") %>" 
		width="200" /></li>
	</ul>
</body>
</html>