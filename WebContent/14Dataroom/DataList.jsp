<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp"/>
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>자료실 - <small>Model2방식의 Servlet게시판</small></h3>
			
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
					<th>첨부</th>
				</tr>
				</thead>				
				<tbody>
			
				<!--  
					ListCtrl 서블릿에서 request영역에 저장한 ResultSet을 JSTL과 EL을
					통해 화면에 내용을 출력한다.
						choose
							when -> list 컬렉션에 아무값도 없을 때
							otherwise -> ResultSet 결과가 있을 때 (즉 출력할 레코드가 있을 때)	
				-->
				<c:choose>
					<c:when test="${empty lists }">
						<tr>
							<td colspan="6" align="center" height="100">
								등록된 게시물이 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${lists }" var="row" varStatus="loop">
							<tr>
								<td class="text-center">
									${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }
								</td>
								<td class="text-left">
									<a href="../DataRoom/DataView?idx=${row.idx}&nowPage=${param.nowPage}">${row.title }</a>
								</td>
								<td class="text-center">${row.name }</td>
								<td class="text-center">${row.postdate }</td>
								<td class="text-center">${row.visitcount }</td>
								<td class="text-center">
									<c:if test="${not empty row.attachedfile }">
							<a href="./Download?filename=${row.attachedfile }&idx=${row.idx}">
									<img src="../images/disk.png" width="20"  alt="" />
							</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			
				
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<button type="button" class="btn btn-primary" onclick="location.href='../DataRoom/DataWrite';">글쓰기</button>
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
					<!-- 페이지번호 기본이미지 -->
					<div style="text-align: center; padding:0 0 10px 0;">
					
					</div>
					
					<!-- 페이지번호 부트스트랩4 적용 -->
					<ul class='pagination justify-content-center'>
					
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