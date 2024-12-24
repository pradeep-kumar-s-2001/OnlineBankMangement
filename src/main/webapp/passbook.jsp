<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dao.TransactionDAOImp"%>
<%@page import="com.bank.dto.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <title>Passbook</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <h2>Transaction History</h2>
    <%
        HttpSession session2 = request.getSession(false);
        if (session != null) {
            Customer customer = (Customer) session.getAttribute("customer");
            if (customer != null) {
                long accNo = customer.getAcc_no();
                TransactionDAOImp dao = new TransactionDAOImp();
                List<Transaction> transactions = dao.getTransction(accNo);
    %>
    <table>
        <thead>
            <tr>
            <th>Tran_id</th>
                <th>Date</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <% for (Transaction t : transactions) { %>
            <tr>
              <td><%= t.getTran_id() %></td>
                <td><%= t.getTran_date() %></td>
                <td><%= t.getTran_type() %></td>
                <td><%= t.getAmount() %></td>
                <td><%= t.getBalance() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
     <a href="home.jsp">Go Back to Home</a>
    <%      }
        } else {
            response.sendRedirect("Login.jsp");
        }
    %>
</body>
</html>