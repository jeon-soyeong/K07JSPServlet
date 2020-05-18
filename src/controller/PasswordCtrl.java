package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordCtrl extends HttpServlet{
	
	//패스워드 검증폼으로 진입시 요청처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 패스워드 검증폼으로 전달된 파라미터중 mode는 아래와같이 읽어서
		 영역에 저장한다. 차후 포워드된 jsp에서 EL로 읽어온다. 
		 */
		req.setAttribute("mode", req.getParameter("mode"));
		
		req.getRequestDispatcher("/14Dataroom/DataPassword.jsp").forward(req, resp);
	}

	//패스워드 입력후 submit시 요청처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		DataroomDAO dao = new DataroomDAO();
		boolean isCorrect = dao.isCorrectPassword(pass,idx);
		dao.close();
		
		//결과값을 리퀘스트 영역에 저장
		req.setAttribute("PASS_CORRECT", isCorrect);
		
		req.getRequestDispatcher("/14Dataroom/PassMessage.jsp").forward(req, resp);
	}
}
