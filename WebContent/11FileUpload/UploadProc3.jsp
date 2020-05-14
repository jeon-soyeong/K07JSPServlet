<%@page import="model.MyfileDAO"%>
<%@page import="model.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

//저장된 파일명을 변경하기 위한 객체 생성
File oldFile = null;
File newFile = null;
String realFileName = null;

try{
	/*  
	1~4번까지 준비한 인자를 이용하여 MultipartRequest객체를 생성한다.
	객체가 정상적으로 생성되면 파일업로드는 완료된다. 
	만약 예외가 발생한다면 주로 최대용량 초과 혹은 디렉토리 경로가
	잘못된 경우가 대부분이다.
	*/
	mr = new MultipartRequest(request, saveDirectory, maxPostSize,
			encoding, policy);
	
	
	/*  
		서버에 저장된 파일명 변경하기
			: 객체를 생성함과 동시에 업로드는 완료되므로 이미 저장된
			파일에 대한 파일명을 변경한다.
			이유는 한글이나 다른 언어 즉 유니코드로 구성된 파일명은
			서버에서 문제가 될 소지가 있기 때문에 숫자 혹은 영문으로
			변경하는 것이 좋다.
	*/
	/////추가부분 start /////////
	
	//서버에 저장된 파일명 가져오기
	String fileName = mr.getFilesystemName("chumFile1");
	
	//파일명을 변경하기 위해 현재시간을 가져온다.
	/*  
		아래 서식문자중 대문자 S는 초를 1/1000단위로 가져옴.(0~999)
	*/
	String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
	
	//파일의 확장자를 가져옴
	/*  
		파일명에 닷(.)이 2개 이상 포함될 수 있으므로 lastIndexOf()로
		마지막에 있는 점을 찾아온다.해당 인덱스를 통해 확장자를 가져온다.
	*/
	int idx = -1;
	
	idx = fileName.lastIndexOf(".");
	realFileName = nowTime + fileName.substring(idx, fileName.length());
	
	/*  
	서버의 물리적경로와 생성된 파일명을 통해 File객체를 생성한다.
	※파일객체.separator : 파일경로를 나타낼 때 윈도우는 역슬러쉬(\)
		리눅스는 슬러쉬(/)를 사용하게 되는데 OS에 따라 구분기호를
		자동으로 변환하여 설정해주는 역할을 한다.
	*/
	oldFile = new File(saveDirectory+oldFile.separator+fileName);
	newFile = new File(saveDirectory+oldFile.separator+realFileName);
	
	//저장된 파일명을 변경한다.
	oldFile.renameTo(newFile);
	/////추가부분 end /////////
	
	
	
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
	
	////////////////////////////
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setInter(inter.toString());
	dto.setOfile(mr.getOriginalFileName("chumFile1"));
	dto.setSfile(realFileName);
	
	MyfileDAO dao =  new MyfileDAO();
	dao.myfileInsert(dto);
	
	
	response.sendRedirect("FileList.jsp");
	////////////////////////////
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
