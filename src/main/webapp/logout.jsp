<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    HttpSession session2 = request.getSession(false);
    if (session != null) {
        session.invalidate();
    
    request.setAttribute("logout", "Logout suscessfull");
    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
    rd.forward(request, response);
    }
%>