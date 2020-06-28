<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="comment.commentDTO" %>
<%@ page import="comment.commentDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	int galleryID = 0;
	String commentTitle = null;
	String commentContent = null;
	double commentTotal = 0;
	double commentAccessibility = 0;
	double commentArt = 0;
	double commentPlace = 0;  
	String galleryTitle = "";

	if(request.getParameter("galleryTitle") != null){
		galleryID = Integer.parseInt(request.getParameter("galleryTitle"));
	}
	if(request.getParameter("commentTitle") != null){
		commentTitle = request.getParameter("commentTitle");
	}
	if(request.getParameter("commentContent") != null){
		commentContent = request.getParameter("commentContent");
	}
	if(request.getParameter("commentTotal") != null){
		commentTotal = Double.parseDouble(request.getParameter("commentTotal"));
	}
	if(request.getParameter("commentAccessibility") != null){
		commentAccessibility = Double.parseDouble(request.getParameter("commentAccessibility"));
	}
	if(request.getParameter("commentArt") != null){
		commentArt = Double.parseDouble(request.getParameter("commentArt"));
	}
	if(request.getParameter("commentPlace") != null){
		commentPlace = Double.parseDouble(request.getParameter("commentPlace"));
	}
	if(request.getParameter("galleryTitle") != null){
		galleryTitle = request.getParameter("galleryTitle");
	}
	
	if(galleryID == 0 || commentTitle == null || commentContent == null || commentTotal == 0 || commentAccessibility == 0
			|| commentArt == 0 || commentPlace == 0 || commentTitle.equals("") || commentContent.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;		
	}
	
	commentDAO comment= new commentDAO();
	int result = comment.write(new commentDTO(0, userID, galleryID, commentTitle, commentContent, commentTotal, commentAccessibility, 
									commentArt, commentPlace, 0, galleryTitle));
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('후기 등록에 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;		
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'userComment.jsp'");
		script.println("</script>");
		script.close();
		return;		
	}
		
%>