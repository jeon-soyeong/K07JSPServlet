package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculateServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fNum = req.getParameter("firstNum");
		String sNum = req.getParameter("secondNum");
			
		int fnum = Integer.parseInt(fNum);		
		int snum = Integer.parseInt(sNum);		
		String op = req.getParameter("operator");
		
		int returnValue;
		switch (op) {
		case "+":
			returnValue = fnum + snum;
			break;
		case "-":
			returnValue = fnum - snum;
			break;
		case "*":
			returnValue = fnum * snum;
			break;
		case "/":
			returnValue = fnum / snum;
			break;
		default:
			returnValue = 0;
		}
		
		
		req.setAttribute("calResult", "결과는?????"+returnValue);
		//보여줄 경로이므로 /13Servlet/HelloServlet.jsp -> 13Servlet 파일명이 필요함
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp);
		
	}
}
