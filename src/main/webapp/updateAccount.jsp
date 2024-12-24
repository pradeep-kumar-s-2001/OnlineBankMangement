<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bank.dto.Customer"%>
<%@page import="com.bank.dao.CustomerDao"%>
<%@page import="com.bank.dao.CustomerDaoImp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Account</title> 
    <style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color:#6082B6;
    }

    form {
        background-color: rgba(255, 255, 255, 0.1);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 300px;
    }

    form h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="number"],
    input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: blue;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: darkblue;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 15px;
        text-decoration: none;
        color: blue;
    }

    a:hover {
        text-decoration: underline;
  
    }
    p{
    }
</style>
    
</head>
<body>
    <div>
     <%
        HttpSession session2 = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("Login.jsp");
        } else {
            Customer customer = (Customer) session.getAttribute("customer");
            if (request.getParameter("name") != null && request.getParameter("phone") != null) {
                customer.setName(request.getParameter("name"));
                customer.setPhone(Long.parseLong(request.getParameter("phone")));
                customer.setMail(request.getParameter("mail"));

                CustomerDao cdao = new CustomerDaoImp();
                if (cdao.updateCustomer(customer)) {
                    session.setAttribute("customer", customer);
                    %>
                    <p style="color:green;font-weight:bold;">Account updated successfully!</p>
                    <% 
                } else {
                	%>
                    <p style="color:red;font-weight:bold;">Update failed. Please try again.</p>
                    <% 
                }
            }
    %>
    <div class="wrapper">
       <h2>Update Account</h2>
    <form action="updateAccount.jsp" method="post">
    <label for="id">Account_number:</label>
       <input type="number" id="id" name="id" disable="disable" value="<%= customer.getAcc_no() %>" required>
       <br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= customer.getName() %>" required>
       <br>
        <label for="phone">Phone:</label>
        <input type="number" id="phone" name="phone" value="<%= customer.getPhone() %>" required>
        <br>
        <label for="mail">Email:</label>
        <input type="email" id="mail" name="mail" value="<%= customer.getMail() %>">
        <input type="submit" value="Update">
    </form>
    <a href="home.jsp">Go Back to Home</a>
    </div>
    <%
        }
    %>
    
    </div>
</body>
</html>