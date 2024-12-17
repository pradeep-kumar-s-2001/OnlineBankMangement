<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dto.Customer"%>
<%@page import="com.bank.dao.CustomerDao"%>
<%@page import="com.bank.dao.CustomerDaoImp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset PIN</title>
    <style>
    div{
    
            padding: 20px;
            width: 300px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        body {
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    
    </style>
</head>
<body>
<div>
    <%
        HttpSession session2= request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("Login.jsp");
        } else {
            Customer customer = (Customer) session.getAttribute("customer");
            if (request.getParameter("newPin") != null) {
                int newPin = Integer.parseInt(request.getParameter("newPin"));
                customer.setPin(newPin);

                CustomerDao cdao = new CustomerDaoImp();
                if (cdao.updateCustomer(customer)) {
                    session.setAttribute("customer", customer);
                    out.println("<p>PIN reset successfully!</p>");
                } else {
                    out.println("<p>Reset failed. Please try again.</p>");
                }
            }
    %>
   
    <h2>Reset PIN</h2>
    <form action="resetPin.jsp" method="post">
        <label for="newPin">New PIN:</label>
        <input type="password" id="newPin" name="newPin" required>
        <input type="submit" value="Reset">
    </form>
    <a href="home.jsp">Go Back to Home</a>
    <%
        }
    %>
    
    </div>
</body>
</html>