<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dto.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Balance</title>
    <style>
        body {
            background: linear-gradient(to right, #2575fc, #6a11cb);
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
            text-align: center;
            background: rgba(0, 0, 0, 0.4);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 15px;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 20px;
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
<%
    HttpSession session2 = request.getSession();
    if (session != null) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            double balance = customer.getBalance();
            request.setAttribute("balance", balance);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }
%>
    <div class="container">
        <h2>Your Account Balance</h2>
        <p>Your current balance is: <%= request.getAttribute("balance") %></p>
        <a href="home.jsp">Back to Home</a>
    </div>
</body>
</html>