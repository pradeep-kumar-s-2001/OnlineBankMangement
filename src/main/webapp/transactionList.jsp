<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dao.TransactionDAOImp"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction List</title>
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
    <h2>All Transactions</h2>
    <table>
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Sender Account</th>
                <th>Receiver Account</th>
                <th>Date</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <%
                TransactionDAOImp dao = new TransactionDAOImp();
                List<Transaction> transactions = dao.getTransction();
                for (Transaction t : transactions) {
            %>
            <tr>
                <td><%= t.getTran_id() %></td>
                <td><%= t.getUser_acc() %></td>
                <td><%= t.getRec_acc() %></td>
                <td><%= t.getTran_date() %></td>
                <td><%= t.getTran_type() %></td>
                <td><%= t.getAmount() %></td>
                <td><%= t.getBalance() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>