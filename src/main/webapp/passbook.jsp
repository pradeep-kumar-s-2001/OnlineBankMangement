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
    body{
    background:#6082B6;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: black;
    
    
    }
    
    
    
    
    div{
   
    
    
    }
   #one{
   display:flex;
    color:white;
    top:50px;
    left:600px;
   justify-content: center;
      align-items: center;
    
    
    }
        table {
            width: 100%;
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
<div>
<div id="one">
    <h2>Transaction History</h2>
    </div>
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
    </div>
</body>
</html>