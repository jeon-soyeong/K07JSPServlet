package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DAO객체 생성 및 커넥션풀을 통한 DB연결
		DataroomDAO dao = new DataroomDAO();
		
		//컨트롤러(서블릿) 및 View(JSP)로 전달할 파라미터를 저장하기 위한 맵
		Map param =  new HashMap();
		//쿼리스트링의 파라미터를 저장하기 위한 문자열
		String addQueryString ="";
		
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchWord!=null){
			
			//검색어가 있는 경우 파라미터를 Map에 저장 및 쿼리스트링 저장
			addQueryString = 
			String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
		}
		//테이블의 전체 레코드수를 카운트
		int totalRecordCount = dao.getTotalRecordCount(param);
		//전체 카운트 수를 Map에 저장함. 차후 View로 전달할 예정임.
		param.put("totalCount", totalRecordCount);
		
		//테이블의 전체 ResultSet을 가져옴 (페이지 처리 X)
		List<DataroomDTO> lists = dao.selectList(param);
		
		//커넥션풀에 커넥션객체 반납
		dao.close();
		
		//컬렉션에 저장된 데이터를 View로 전달하기 위해 Request영역에 속성저장
		req.setAttribute("lists", lists);
		req.setAttribute("map", param);
		req.getRequestDispatcher("/14Dataroom/DataList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 만약 게시판 리스트쪽에서 POST방식으로 요청이 들어오더라도 
		 처리는 doGet()메소드에서 처리할 수 있도록 모든 요청을 토스한다. 
		 */
		doGet(req,resp);
	}
}
