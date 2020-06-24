<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gallery.galleryDTO" %>
<%@ page import="gallery.galleryDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="./css/custom.css">
	<style>
		.overall{
			margin-bottom: 28px;
		}
		.overall .title{
			margin-bottom: 7px;
			margin-left	: -2px;
			color : #3d3d3d;
			font-size: 24px;
			font-weight: 600;
			letter-spacing : -1px;
		}
		.overall .author{
			color : #3d3d3d;
			font-size: 16px;
			font-weight: 600;
			letter-spacing : 0;			
			margin-bottom: 5px
		}
		.overall .txt{
			margin-bottom: 9px;
			color : #3d3d3d;
			font-size: 16px;
			font-weight: 600;
			letter-spacing : 0;
		}
		.overall .placecontainer{
			padding : 11px 0px;
			border-bottom : 1px solid #000000;
		}
		.overall .placecontainer .place{
			margin : 0px 0px 0px 0px;
			color : #666;
			font-size:12px;
			font-weight:600;
			line-height:18px;
		}
	</style>
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light "  >
		
		<a class = "navbar-brand" href="index.jsp">강의평가 웹사이트</a>
		<div id="navbar" class="collapse navbar-collapse">
		
			<form class="form-inline my-2 my-lg:0">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
			
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">전시회</a>
				</li>				
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">관람 후기</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원 관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
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
		<div class="overall">
			<h3 class="title"><%= gallery.getGalleryTitle() %></h3>
			<p class="author"> 작가 : <%=gallery.getGalleryAuthor() %> 분 </p>
			<p class="txt"> <%= gallery.getGalleryStart() %> - <%= gallery.getGalleryEnd() %></p>
			
			<div class="placecontainer">
				<p class="place"> <%= gallery.getGalleryPlace() %>
			</div>
		</div>
		
		<div class="detailcontainer">
  		 	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      			<ol class="carousel-indicators">
      		    	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
       				<li data-target="#myCarousel" data-slide-to="1"></li>
      				<li data-target="#myCarousel" data-slide-to="2"></li>
      				<li data-target="#myCarousel" data-slide-to="3"></li>
      				<li data-target="#myCarousel" data-slide-to="4"></li>
      				<li data-target="#myCarousel" data-slide-to="5"></li>
     			</ol>
   				<div class="carousel-inner">
    				<div class="carousel-item active">
     					<img class="d-block w-100" src=<%= gallery.getGalleryThumbnail() %> alt="First slide">
    				</div>
    				<div class="carousel-item">
     					<img class="d-block w-100" src=<%= gallery.getGalleryImageFirst() %> alt="Second slide">
    				</div>
    				<div class="carousel-item">
     					<img class="d-block w-100" src=<%= gallery.getGalleryImageSecond() %> alt="Third slide">
    				</div>
    				<div class="carousel-item">
    					<img class="d-block w-100" src=<%= gallery.getGalleryImageThird() %> alt="Fourth slide">
    				</div>
    				<div class="carousel-item">
    					<img class="d-block w-100" src=<%= gallery.getGalleryImageFourth() %> alt="Fifth slide">
    				</div>
    				<div class="carousel-item">
    					<img class="d-block w-100" src=<%= gallery.getGalleryImageFifth() %> alt="Sixth slide">
    				</div>
    				<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
     					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
     					<span class="sr-only">Previous</span>
    				</a>
    				<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
     					<span class="carousel-control-next-icon" aria-hidden="true"></span>
     					<span class="sr-only">Next</span>
    				</a>
   				</div>
  			</div>
 		</div>
		
	</section>
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 16 모바일공학과 정연우, 이재홍, 신기철. All rights reserved
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>
</html>