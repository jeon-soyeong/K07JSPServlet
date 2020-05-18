package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class WriteCtrl extends HttpServlet{
	
	/*
	글쓰기 페이지의 경우
		doGet() 메소드는 글쓰기 폼으로 이동(location)할 때의 요청을 처리하고
		doPost() 메소드는 글쓰기를 완료(submit)할 때의 요청을 처리한다.
	*/
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//글쓰기 페이지로 진입시에는 JSP와 매핑만 해주면 된다.
		req.getRequestDispatcher("/14Dataroom/DataWrite.jsp").forward(req, resp);
	}
	
	//게시물 내용 작성 후 submit했을 때의 요청을 처리함
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//글쓰기 관련 폼값에 대한 한글처리
		req.setCharacterEncoding("UTF-8");
		
		//해당 메소드는 MultipartRequest객체를 생성하면서 파일업로드를 처리한다.
		/*
		 	매개변수로는 request객체, Upload의 서버의 물리적경로를 전달한다.
		 */
		MultipartRequest mr = FileUtil.upload(req,
				req.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;
		
		if(mr != null) {
			/*
			 파일업로드가 완료되면 나머지 폼값을 받기위해 mr참조변수를 이용한다.
			 enctype이 "multipart/form-data"로 설정되므로 request객체를 통해
			 폼값을 받을 수 있다. 
			 */
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String pass = mr.getParameter("pass");
			String content = mr.getParameter("content");
			//서버에 저장된 실제파일명을 가져온다.
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			//DTO객체에 폼값을 저장한다.
			DataroomDTO dto =  new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setPass(pass);
			dto.setName(name);
			dto.setTitle(title);
			
			//DAO객체 생성 및 DB연결... insert처리
			DataroomDAO dao = new DataroomDAO();
			
			sucOrFail = dao.insert(dto);
			
			//커넥션풀의 객체반납
			dao.close();
		}
		else {
			//mr객체가 생성되지 않았을 때(업로드 실패시)
			sucOrFail = -1;
		}
		
		if(sucOrFail==1) {
			//파일업로드 성공 및 글쓰기 처리 성공
			//아래 요청명을 받아 이동하더라도 지금 자바파일의 깊이를 유지하기 위해서
			resp.sendRedirect("../DataRoom/DataList");
		}
		else {
			//나머지는 실패로 처리한다. 실패시 글쓰기 페이지로 돌아간다.
			req.getRequestDispatcher("/14Dataroom/DataWrite.jsp").forward(req, resp);
		}
	}//doPost끝
	
	
}
