package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.FileUtil;

public class DeleteCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		
		req.setAttribute("nowPage", nowPage);
		
		DataroomDAO dao = new DataroomDAO();
		DataroomDTO dto = dao.selectView(idx);//기존 게시물 가져오기
		
		int sucOrFail = dao.delete(idx);//게시물 삭제하기
		if(sucOrFail==1) {//삭제에 성공인 경우
			//첨부된 파일명을 얻어와서 서버에서 삭제처리한다.
			String fileName = dto.getAttachedfile();
			FileUtil.deleteFile(req, "/Upload", fileName);
		}
		
		//mode가 delete이므로 아래와 같이 처리
		req.setAttribute("WHEREIS", "DELETE");
		req.setAttribute("SUC_FAIL", sucOrFail);
		
		req.getRequestDispatcher("/14Dataroom/Message.jsp").forward(req, resp);

	}
}
