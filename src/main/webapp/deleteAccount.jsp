<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dao.CustomerDaoImp"%>
<%@page import="com.bank.dto.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Account</title>
    <style>
    
    </style>
    
</head>
<body>
<div id="main">
    <h2>Delete Account</h2>
    <form method="post">
        <label for="account">Account Number to Delete:</label>
        <input type="number" id="account" name="account" required>
        <button type="submit">Delete</button>
    </form>
    </div>
    
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
   
</body>
</html>