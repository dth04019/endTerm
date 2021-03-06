<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.commentDAO" %>
<%@ page import="comment.commentDTO" %>
<%@ page import="gallery.galleryDAO" %>
<%@ page import="gallery.galleryDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>관람 후기</title>
	<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="./css/custom.css">
	<style>
		.card-body {
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		boolean emailChecked = new userDAO().getUserEmailChecked(userID);
		if(emailChecked == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'emailSendConfirm.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		request.setCharacterEncoding("UTF-8");
		String searchType = "최신순";
		String search = "";
		int pageNumber = 0;
		if(request.getParameter("searchType") != null) {
			searchType = request.getParameter("searchType");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if(request.getParameter("pageNumber") != null) {
			try{
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch(Exception e) {
				System.out.println("검색 페이지 번호 오류");
			}
			
		}
		
		userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
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
	<section class="container">
		<form method="get" action="./userComment.jsp" class="form-inline mt-3">
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="전시회 별" <% if(searchType.equals("전시회 별")) out.println("selected"); %>>전시회 별</option>
				<option value="추천순" <% if(searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
		</form>
		
			<%
				ArrayList <commentDTO> commentList = new ArrayList<commentDTO>();
				commentList = new commentDAO().getList(searchType, search, pageNumber);
			
				if(commentList != null)
					for(int i = 0; i < commentList.size(); i++){
						if(i == 5)
							break;
					
						commentDTO comment = commentList.get(i);
						int galleryID = comment.getGalleryID();

						galleryDTO gallery = new galleryDTO();
						gallery = new galleryDAO().getGallery(galleryID);
						
			%>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<a href="GalleryDetail.jsp?galleryId=<%=galleryID %>" style="color:black" class="col-8 text-left"><%= gallery.getGalleryTitle() %><small>(<%= gallery.getGalleryAuthor() %>)</small></a>
					<div class="col-4 text-right">
						총합  <span style="color: red;"><%= comment.getCommentTotal() %> / 10.0</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					<%= comment.getCommentTitle() %><small> (<%= comment.getUserID() %>) </small>
				</h5>
				<p class="card-text"> <%= comment.getCommentContent() %></p>
				<div class="row">
					<div class="col-9 text-left"> 
						접근성<span>(</span><span style="color: red;"> <%= comment.getCommentAccessibility() %></span><span> / 10.0)</span>
						예술성<span>(</span><span style="color: red;"> <%= comment.getCommentArt() %> </span><span> / 10.0)</span>
						시설<span>(</span><span style="color: red;"> <%= comment.getCommentPlace() %></span><span> / 10.0)</span>
						<span style="color: green;">(추천: <%= comment.getLikeCount() %>)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?\n이미 추천한 경우 추천이 취소됩니다.')" href="./likeAction.jsp?commentID=<%= comment.getCommentID() %>">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?commentID=<%= comment.getCommentID() %>">삭제</a>
					</div>
				</div>
			</div>
		</div>
			<%
					}
			 %>		
	</section>
	
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
		<%
			if(pageNumber <= 0) {
		%>
			<a class="page-link disabled">이전</a>
		<%
			} else {
		%>
			<a class="page-link" href="./userComment.jsp?searchType<%= URLEncoder.encode(searchType, "UTF-8") %>&search=
			<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
			<%= pageNumber - 1 %>">이전</a>
		<%
			}
		%>
		</li>
		<li>
		<%
			if(commentList.size() < 6) {
		%>
			<a class="page-link disabled">다음</a>
		<%
			} else {
		%>
			<a class="page-link" href="./userComment.jsp?searchType<%= URLEncoder.encode(searchType, "UTF-8") %>&search=
			<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
			<%= pageNumber + 1 %>">다음</a>
		<%
			}
		%>
		</li>
	</ul>
	
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">후기 등록</h5>
					<button type="button" class="close" data-dismiss = "modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button> 	
				</div>
				<div class="modal-body">
					<form action="./commentRegisterAction.jsp" method="post">
						<div class="form-group">
								<label>전시회 선택</label>
								<select name="galleryTitle" class="form-control">
								<%
									ArrayList <galleryDTO> galleryList = new ArrayList<galleryDTO>();
									galleryList = new galleryDAO().getList();
		
									if(galleryList != null)
										for(int i = 0; i < galleryList.size(); i++){
				
											galleryDTO gallery = galleryList.get(i);
								%>	
									<option value=<%= gallery.getGalleryID() %>><%= gallery.getGalleryTitle() %></option>
								<%
										}
								%>
								</select>
						</div>
						
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="commentTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="commentContent" class="form-control" maxlength="2048" style="height: 180px;">> </textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>종합</label>
								<input type="text" name="commentTotal" class="form-control" maxlength="5"><span>/ 10.0</span>
							</div>
							<div class="form-group col-sm-3">
								<label>접근성</label>
								<input type="text" name="commentAccessibility" class="form-control" maxlength="5"><span>/ 10.0</span>
							</div>
							<div class="form-group col-sm-3">
								<label>예술성</label>	
								<input type="text" name="commentArt" class="form-control" maxlength="5"><span>/ 10.0</span>
							</div>
							<div class="form-group col-sm-3">
								<label>시설</label>
								<input type="text" name="commentPlace" class="form-control" maxlength="5"><span>/ 10.0</span>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss = "modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button> 	
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						<div class="form-group">
							<label>신고 제목</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px;">></textarea>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
						
					</form>
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