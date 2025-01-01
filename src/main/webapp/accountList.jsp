<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dao.CustomerDaoImp"%>
<%@page import="com.bank.dto.Customer"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #0044cc;
            color: #fff;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
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
                div {
            
            background: rgba(0, 0, 0, 0.4);
            paddtext-align: center;ing: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        

        a:hover {
            background: #2575fc;
            color: #fff;
        }
        @media screen and (max-width: 768px) {
            table {
                width: 100%;
            }
            th, td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>

    <h2>Account List</h2>
    <%
        CustomerDaoImp dao = new CustomerDaoImp();
        List<Customer> customers = dao.getCustomer();
    %>
    <table>
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Customer customer : customers) {
            %>
            <tr>
                <td><%= customer.getAcc_no() %></td>
                <td><%= customer.getName() %></td>
                <td><%= customer.getPhone() %></td>
                <td><%= customer.getMail() %></td>
                <td><%= customer.getBalance() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <div>
    <a href="adminHome.jsp">Back to Home</a>
    </div>
</body>
</html>