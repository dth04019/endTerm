<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<nav class="navbar navbar-expand-lg navbar-light "  >
		<!-- commit trial3 -->
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
					<a class="nav-link" href="userComment.jsp">관람 후기</a>
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
	<div class="container">
		<div class="jumbotron" style="padding: 2rem 1rem;">
			<div class="container">
				<h1>웹 사이트</h1>
				<p>본 웹 사이트는 개인 전시회를 홍보하기 위한 목적임을 알려드립니다.
				<p><a class="btn btn-primary btn-pull" href="#" role="button"> 자세히 알아보기</a></p>
			</div>
		</div>
		
		 <div class="container">
  		 	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      			<ol class="carousel-indicators">
      		    	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
       				<li data-target="#myCarousel" data-slide-to="1"></li>
      				<li data-target="#myCarousel" data-slide-to="2"></li>
     			</ol>
   				<div class="carousel-inner">
    				<div class="carousel-item active">
     					<img class="d-block w-100" src="images/1.jpg" alt="First slide">
    				</div>
    				<div class="carousel-item">
     					<img class="d-block w-100" src="images/2.jpg" alt="First slide">
    				</div>
    				<div class="carousel-item">
     					<img class="d-block w-100" src="images/3.jpg" alt="First slide">
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
 	</div>
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 16 모바일공학과 정연우, 이재홍, 신기철. All rights reserved
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>