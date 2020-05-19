package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class EditCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//일련번호를 파라미터로 가져옴
		String idx = req.getParameter("idx");
		
		//서블릿에서 application내장객체를 얻어오기 위해 메소드 호출
		ServletContext app = this.getServletContext();
		DataroomDAO dao = new DataroomDAO(app);
		
		//일련번호에 해당하는 게시물 가져오기
		DataroomDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/14Dataroom/DataEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//첨부파일 업로드
		MultipartRequest mr = FileUtil.upload(req,
				req.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;
		
		//MultipartRequest객체가 정상적으로 생성되면 나머지 폼값을 받아온다.
		if(mr != null) {
			String idx = mr.getParameter("idx");
			String nowPage = mr.getParameter("nowPage");
			String originalfile = mr.getParameter("originalfile");
			
			//수정처리 후 상세보기로 이동하므로 영역에 속성을 저장한다.
			req.setAttribute("idx", idx);
			req.setAttribute("nowPage", nowPage);
			
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String pass = mr.getParameter("pass");
			
			/*
			 만약 수정폼에서 첨부한 파일이 있다면 기존파일은 삭제해야하고,
			 확인 후 만약 없다면 기존파일명으로 유지한다. 
			 */
			String attachedfile = mr.getFilesystemName("attachedfile");
			if(attachedfile == null) {
				attachedfile = originalfile;
			}
			
			//폼값을 DTO객체에 저장
			DataroomDTO dto = new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setName(name);
			dto.setPass(pass);
			dto.setIdx(idx);
			
			//DB처리(update)
			ServletContext app = this.getServletContext();
			DataroomDAO dao = new DataroomDAO(app);
			sucOrFail = dao.update(dto);
			
			/*
			레코드의 update가 성공이고 동시에 새로운 파일을 업로드 완료했다면
			기존의 파일은 삭제처리한다.
			첨부한 파일이 없다면 기존파일은 유지된다.
			*/
			if(sucOrFail==1 && mr.getFilesystemName("attachedfile")!=null) {
				FileUtil.deleteFile(req, "/Upload", originalfile);
			}
			dao.close();
		}
		else {
			//MultipartRequest가 생성되지 않았다면 파일업로드 실패로 처리
			sucOrFail = -1;
		}
		
		//리퀘스트영역에 메세지 출력을 위한 저장
		req.setAttribute("SUC_FAIL", sucOrFail);
		req.setAttribute("WHEREIS", "UPDATE");
		
		req.getRequestDispatcher("/14Dataroom/Message.jsp").forward(req, resp);
	}
	
}
