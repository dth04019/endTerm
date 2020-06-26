<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String usernewPassword = null;
	String userEmail = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그아웃 상태입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	userDTO user = new userDTO();
	user = new userDAO().getUser(userID);
	
	userEmail = user.getUserEmail();
	
	if(request.getParameter("userPassword") != null) {
		userPassword = request.getParameter("userPassword");
	}
	if(request.getParameter("usernewPassword") != null) {
		usernewPassword = request.getParameter("usernewPassword");
	}
	if(userPassword == null || usernewPassword == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호를 입력해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	String sha_password = user.getUserPassword();
	
	userPassword = SHA256.getSHA256(userPassword);
	
	if(!sha_password.equals(userPassword)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	userDAO UserDAO = new userDAO();
	int result = UserDAO.update(userID, SHA256.getSHA256(usernewPassword));
	
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다. result is -1');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else {
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 변경완료');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>