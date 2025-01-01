<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dto.*"%>
<%@page import="com.bank.dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Money</title>
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
    if (session != null) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                double depositAmount = Double.parseDouble(request.getParameter("amount"));
                double newBalance = customer.getBalance() + depositAmount;
                customer.setBalance(newBalance);

                TransactionDAO transactionDAO = new TransactionDAOImp();
                CustomerDaoImp dao = new CustomerDaoImp();
                if (dao.updateCustomer(customer)) {
                    session.setAttribute("customer", customer);
                    Transaction transaction = new Transaction();
                    transaction.setTran_id(TransactionID.getTransactionID());
                    transaction.setUser_acc(customer.getAcc_no());
                    transaction.setTran_type("deposit");
                    transaction.setAmount(depositAmount);
                    transaction.setBalance(customer.getBalance());

                    boolean transactionLogged = transactionDAO.insertTransaction(transaction);

                    out.println("<p>Amount deposited successfully! New balance: " + newBalance + "</p>");
                } else {
                    out.println("<p>Failed to update the balance.</p>");
                }
            }
        } else {
            response.sendRedirect("Login.jsp");
        }
    }
%>
<div class="container">
    <h2>Deposit Money</h2>
    <form method="post">
        <input type="number" id="amount" name="amount" placeholder="Enter Amount" required>
        <button type="submit">Deposit</button>
    </form>
    <a href="home.jsp">Back to Home</a>
</div>
</div>
</body>
</html>