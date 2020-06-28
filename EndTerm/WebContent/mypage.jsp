<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="gallery.galleryDAO" %>
<%@ page import="gallery.galleryDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="reservation.reservationDTO"%>
<%@ page import="reservation.reservationDAO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>마이페이지</title>
	<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="./css/custom.css">
	<style>
		* {
    		-webkit-text-size-adjust: none;
    		-webkit-box-sizing: border-box;
    		-moz-box-sizing: border-box;
    		box-sizing: border-box;
    		word-break: break-all;
		}
		.wrap3 {
			margin-top: 50px
		}
		.main{
			margin : 0 20px;
		}
		.wrap3 .inner {
    		margin: 0 -15px 30px;
    		padding: 0px;
    		font-size: 0;
		}
		.wrap3 .con:nth-child(4n+1) {
	    	clear: left;
		}
		.wrap3 .con {
  			float: left;
    		width: 25%;
    		padding: 0 15px;
    		margin-bottom: 35px;
		}
		li {
  			display: list-item;
  	  		text-align: -webkit-match-parent;
		}
		.wrap3 .thumb img {
    		width: 100%;
    		height: 286px;
		}
		.wrap3 .name {
 			display: -webkit-box;
    		-webkit-line-clamp: 2;
    		max-height: 32px;
    		color: #3d3d3d;
    		font-size: 12px;
    		font-weight: 600;
    		line-height: 16px;
    		overflow: hidden;
    		margin: 0px;
		}
		.wrap3 .txt {
    		display: -webkit-box;
    		-webkit-line-clamp: 1;
   			 max-height: 16px;
    		color: #888;
    		font-size: 12px;
    		font-weight: 400;
    		line-height: 16px;
    		letter-spacing: 0;
    		overflow: hidden;
    		margin: 0px;
		}
		.wrap3 .date {
    		display: -webkit-box;
    		-webkit-line-clamp: 1;
   			 max-height: 16px;
    		color: #888;
   			font-size: 12px;
    		font-weight: 400;
    		line-height: 16px;
    		letter-spacing: 0;
   			 overflow: hidden;
    		margin: 0px;
		}
		.wrap2{
			margin-bottom:31px;
			padding-bottom:11px;
			border-bottom: 1px solid #000000;
			margin : 0px 15px 30px;
		}
		.wrap2 .cate{
			padding :3px 10px;
			background-color:#FFFFFF;
			color:#000000
		}
		.wrap2 .cate.active, .cate:hover{
			background-color:#000000;
			color:#FFFFFF;
		}
		.wrap3 .more_grid_wrap{
			border-bottom : 1px solid #000000;
		}

		
	</style>
	
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		String gallerySearch = "";
		int pageNumber = 0;
		if(request.getParameter("gallerySearch") != null) {
			gallerySearch = request.getParameter("gallerySearch");
		}
		if(request.getParameter("pageNumber") != null) {
			try{
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch(Exception e) {
				System.out.println("검색 페이지 번호 오류");
			}
			
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-light "  >
		
		<a class = "navbar-brand" href="index.jsp">개인 전시회 홍보사이트</a>
		<div id="navbar" class="collapse navbar-collapse">
		
			<form action="./Gallery.jsp" method="get" class="form-inline my-2 my-lg:0">
				<input type="text" name="gallerySearch" class="form-control mr-sm-2" type="search" placeholder="전시회를 입력하세요." aria-label="Search">
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
						마이페이지
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
		userDTO user = new userDTO();
		user = new userDAO().getUser(userID);
	%>

	<section class="container mt-5">
		<form method="post" action="./userRepassword.jsp">
			<div class="form-group">
				<a>아이디 : <%=user.getUserID() %></a>
			</div>
			<div class="form-group">
				<a>이메일 : <%=user.getUserEmail() %></a>
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPassword" class="form-control" style="max-width: 300px;">
			</div>
			<div class="form-group">
				<label>새로운 비밀번호</label>
				<input type="password" name="usernewPassword" class="form-control" style="max-width: 300px;">
			</div>
			<button type="submit" class="btn btn-primary">비밀번호 변경</button>
		</form>			
	</section>

	<div class="wrap3 bdt">
		<article class="main">
			<h4>예매한 전시회</h4>
			<p></p>
				<div class="more_grid_wrap">
					<ul id="shows_list" class="inner clearfix">	
		<%
			ArrayList <galleryDTO> galleryList = new ArrayList<galleryDTO>();
			galleryList = new galleryDAO().getListreservation(userID);
			reservationDAO ReservationDAO = new reservationDAO();
			if(galleryList != null)
				for(int i = 0; i < galleryList.size(); i++){
					
					galleryDTO gallery = galleryList.get(i);
						
					Date now = new Date();
								
					gallery.getGalleryEnd();
						
					long calDate=  gallery.getGalleryEnd().getTime() - now.getTime();
					long calDateDays = calDate/(24*60*60*1000);
					int galleryId = gallery.getGalleryID();
					if(calDateDays < 0){
						ReservationDAO.delete(galleryId, userID);
					}
					if(calDateDays >= 0){
		%>			
					<li class="con">
						<div class="scale">
							<a href="GalleryDetail.jsp?galleryId=<%=galleryId %>" class="thumb"><img src=<%= gallery.getGalleryThumbnail() %> alt="작품 썸네일" /></a>
						</div>	
						<p class="name"><%= gallery.getGalleryTitle() %></p>
						<p class="txt"> <%= gallery.getGalleryPlace() %></p>
						<p class="date"> <%= gallery.getGalleryStart() %> - <%= gallery.getGalleryEnd() %></p>
					</li>
		<%
					}
				} 			 		
		%>
					</ul>
				</div>
		</article>
	</div>
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 16 모바일공학과 정연우, 이재홍, 신기철. All rights reserved
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>