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
    body {
            background:#6082B6;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 300px;
        }

        h2 {
            margin-bottom: 40px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input {
            margin-bottom: 30px;
            padding: 10px;
            border-radius: 5px;
            border: none;
            font-size: 1rem;
        }

        button {
            padding: 8px;
            border: none;
            background: #fff;
            color: #2575fc;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 30px;
        }

        button:hover {
            background: #2575fc;
            color: #fff;
        }

         a {
            padding: 10px 20px;
            background: #fff;
            color: #2575fc;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        a:hover {
            background: #2575fc;
            color: #fff;
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
   
   <div class="container">
    <h2>Reset PIN</h2>
    <form action="resetPin.jsp" method="post">
        <label for="newPin">New PIN:</label>
        <input type="password" id="newPin" name="newPin" required>
        <button type="submit" >Reset</button>
    </form>
    <a href="home.jsp">Go Back to Home</a>
    <%
        }
    %>
    </div>
    
    </div>
</body>
</html>