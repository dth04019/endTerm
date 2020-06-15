<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	
	if(request.getParameter("userID") != null){
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = (String) request.getParameter("userPassword");
	}
	if(userID == null || userPassword == null){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	userDAO uDAO = new userDAO();
	int result = uDAO.join(userID, userPassword);
	if(result == 1){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return; 
	}
%>