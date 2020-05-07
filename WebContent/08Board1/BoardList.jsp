<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글깨짐처리 - 검색폼에서 입력된 한글이 전송되기 때문
request.setCharacterEncoding("UTF-8");

//web.xml에 저장된 컨텍스트 초기화 파라미터를 application객체를 통해 가져옴
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//DAO객체 생성 및 DB 커넥션
BbsDAO dao = new BbsDAO(drv, url);

/*  
파라미터를 저장할 용도로 생성한 Map컬렉션, 여러개의 파라미터가
있는 경우 한꺼번에 저장한 후 DAO로 전달할 것임.
*/
Map<String, Object> param =  new HashMap<String, Object>();

//검색어 입력시 전송된 폼값을 받아  Map에 저장
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord!=null){
	//검색어를 입력한 경우 Map에 값을 입력함.
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
}

//board테이블에 입력된 전체 레코드 갯수를 카운트하여 반환받음
int totalRecordCount = dao.getTotalRecordCount(param);

//조건에 맞는 레코드를 select하여 결과셋을 List컬렉션으로 반환받음
List<BbsDTO> bbs = dao.selectList(param);

//DB자원해제
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp"/>
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>게시판 - <small>이런저런 기능이 있는 게시판입니다.</small></h3>
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto" name="searchFrm" method="get">	
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="searchWord"  class="form-control"/>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-warning">
								<i class='fa fa-search' style='font-size:20px'></i>
							</button>
						</div>
					</div>
				</form>	
			</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<!-- <th>첨부</th> -->
				</tr>
				</thead>				
				<tbody>
		<%
		//List컬렉션에 입력된 데이터가 없을 때 true를 반환.
		if(bbs.isEmpty()){
		%>		
				<tr>
					<td colspan="6" align="center" height="100">
						등록된 게시물이 없습니다.
					</td>
				</tr>
		<%
		}
		else
		{
			//게시물의 가상번호로 사용할 변수
			int vNum = 0;
			int countNum = 0;
			/*  
			컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 갯수만큼
			즉, DB가 반환해준 레코드의 갯수만큼 반복하면서 출력한다.
			*/
			for(BbsDTO dto : bbs){
				//전체 레코드 수를 이용하여 하나씩 차감하면서 가상번호 부여
				vNum = totalRecordCount --;
		%>			
				<!-- 리스트반복 start-->
				<tr>
					<td class="text-center"><%=vNum %></td>
					<td class="text-left"><a href="BoardView.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a></td>
					<td class="text-center"><%=dto.getId() %></td>
					<td class="text-center"><%=dto.getPostDate() %></td>
					<td class="text-center"><%=dto.getVisitcount() %></td>
				<!-- 	<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td> -->
				</tr>	 
				<!-- 리스트반복 end-->
		<%
			}
		}
		%>	
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<button type="button" class="btn btn-primary" onclick="location.href='BoardWrite.jsp';">글쓰기</button>
					<!-- <button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-warning">리스트보기</button>
					<button type="button" class="btn btn-danger">전송하기</button>
					<button type="button" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button> -->
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>		
						<li class="page-item active"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>		
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-right"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</div>				
			</div>		
		</div>
	</div>
	<jsp:include page="../common/boardBottom.jsp"/>

</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>

	아~~~~힘들다...ㅋ
 -->