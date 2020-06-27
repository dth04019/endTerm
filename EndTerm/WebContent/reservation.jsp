<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="gallery.galleryDTO" %>
<%@ page import="gallery.galleryDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		
	%>
	<nav class="navbar navbar-expand-lg navbar-light " style="border-bottom : 1px solid #000000; margin-bottom : 10px;"  >
		<!-- commit trial -->
		<a class = "navbar-brand" href="index.jsp">강의평가 웹사이트</a>
		<div id="navbar" class="collapse navbar-collapse">
		
			<form class="form-inline my-2 my-lg:0">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
			
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="Gallery.jsp">전시회</a>
				</li>				
				<li class="nav-item active">
					<a class="nav-link" href="userComment.jsp">관람 후기</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원 관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<%
							if(userID == null) {
						%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<%
							} else {
						%>
						<a class="dropdown-item" href="mypage.jsp">회원정보</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<%
							}
						%>
					</div>
				</li>
			</ul>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>
	<%
	request.setCharacterEncoding("UTF-8");
	int galleryId = Integer.parseInt(request.getParameter("galleryId"));
	
	galleryDTO gallery = new galleryDTO();
	gallery = new galleryDAO().getGallery(galleryId);
	%>

	<section class="container">
		<form method="post" action="./mypage.jsp">
		<div class="overall">
			<h3 class="title"><%= gallery.getGalleryTitle() %></h3>
			<p class="author"> 작가 : <%=gallery.getGalleryAuthor() %> 분 </p>
			<p class="txt"> <%= gallery.getGalleryStart() %> - <%= gallery.getGalleryEnd() %></p>
			<button type="submit" style="float:right;" class="btn btn-danger">예매완료</button>
			<div class="placecontainer">
				<p class="place"> <%= gallery.getGalleryPlace() %>
			</div>
			
		</div>
		</form>
		
	</section>
	
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 16 모바일공학과 정연우, 이재홍, 신기철. All rights reserved
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>