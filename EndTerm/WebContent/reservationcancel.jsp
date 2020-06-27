<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="reservation.reservationDTO"%>
<%@ page import="reservation.reservationDAO"%>
<%@ page import="user.userDAO"%>
<%@ page import="gallery.galleryDTO" %>
<%@ page import="gallery.galleryDAO" %>

	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		
		int galleryId = Integer.parseInt(request.getParameter("galleryId"));
		
		reservationDAO ReservationDAO = new reservationDAO();
		int result = ReservationDAO.delete(galleryId, userID);
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예매되어 있지 않습니다.');");
			script.println("location.href = document.referrer;");
			script.println("</script>");
			script.close();
			return;
		}
		else {
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예매가 취소되었습니다');");
			script.println("location.href = document.referrer;");
			script.println("</script>");
			script.close();
			return;
		}
	%>