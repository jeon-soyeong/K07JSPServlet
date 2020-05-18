package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewCtrl extends HttpServlet {
	
	/*
	 서블릿이 요청을 받을때 doGet(), doPost()로 받아서 처리하지만
	 service()메소드는 위 두가지 방식의 요청을 동시에 받을 수 있다.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//게시물의 일련번호를 파라미터로 받아온다.
		String idx = req.getParameter("idx");
		
		DataroomDAO dao = new DataroomDAO();
		
		//일련번호를 통해 게시물을 가져오고, 조회수를 증가시킨다.
		DataroomDTO dto = dao.selectView(idx);
		dao.updateVisitCount(idx);
		
		//게시물의 줄바꿈 처리를 위해 replace()메소드를 사용한다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		dao.close();
		
		//request영역에 DTO객체 저장
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14Dataroom/DataView.jsp")
		.forward(req, resp);
	}
	
}
