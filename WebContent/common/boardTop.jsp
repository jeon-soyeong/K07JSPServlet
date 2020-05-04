<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="row">		
		<div class="col-12">			 
			<!-- 
				.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger, .bg-secondary, 
				.bg-dark, .bg-light
			-->
			<nav class="navbar navbar-expand-sm bg-light navbar-dark">
				<!-- Brand/logo -->
				<a class="navbar-brand" href="#">
					<img src="http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg" style="width:150px;">
				</a>
				
				<!-- Links -->
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link text-dark" href="#">자유게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#">자료실</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#">방명록</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-dark" href="#" id="navbardrop" data-toggle="dropdown">
							Menu
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item text-dark" href="#">SubMenu 1</a>
							<a class="dropdown-item text-dark" href="#">SubMenu 2</a>
							<a class="dropdown-item text-dark" href="#">SubMenu 3</a>
						</div>
					</li>
				</ul>

				<form class="form-inline mt-3 ml-3" method="get" action="">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-append">
							<button class="btn btn-warning" type="submit"><i class='fas fa-search' style='font-size:20px'></i></button>
						</div>
					</div>
				</form>
				<ul class="navbar-nav ml-auto" >
					<!-- <li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fas fa-edit' style='font-size:20px'></i>회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fa fa-cogs' style='font-size:20px'></i>회원정보수정</a>
					</li> -->
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fas fa-sign-in-alt' style='font-size:20px'></i>로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fas fa-sign-out-alt' style='font-size:20px'></i>로그아웃</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>