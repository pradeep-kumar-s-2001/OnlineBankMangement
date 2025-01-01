<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dao.CustomerDaoImp"%>
<%@page import="com.bank.dto.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Account</title>
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

        div {
            background: rgba(255, 255, 255, 0.1);
            padding: 10px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 300px;
            height:250px;
        }

        h2 {
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input {
            margin-bottom: 5px;
            padding: 10px;
            border-radius: 5px;
            border: none;
            font-size: 1rem;
            margin-top: 5px;
        }

        button {
            padding: 10px;
            border: none;
            background: #fff;
            color: #2575fc;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 20px;
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
    <h2>Delete Account</h2>
    <form method="post">
        <label for="account">Account Number to Delete:</label>
        <input type="number" id="account" name="account" required>
        <button type="submit">Delete</button>
    </form>
    
    
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            long accNo = Long.parseLong(request.getParameter("account"));
            CustomerDaoImp dao = new CustomerDaoImp();
            Customer accToDelete = dao.getCustomer(accNo);
            if (accToDelete != null) {
                double amount = accToDelete.getBalance();
                Customer admin = dao.getCustomer(1100110011); // Admin account
                admin.setBalance(admin.getBalance() + amount);

                if (dao.updateCustomer(admin) && dao.deleteCustomer(accToDelete)) {
                    out.println("<p>Account deleted and balance transferred to admin successfully.</p>");
                } else {
                    out.println("<p>Failed to delete account or transfer balance.</p>");
                }
            } else {
                out.println("<p>Account not found.</p>");
            }
        }
    %>
     <a href="adminHome.jsp">Back to Home</a>
     </div>
</body>
</html>