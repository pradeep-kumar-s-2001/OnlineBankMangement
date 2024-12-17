<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminblock</title>
<style>
        body {
   

             margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
        }

        .navbar {
            background-color: #0044cc; 
            overflow: hidden;
            display: flex;
            justify-content: center;
            padding: 10px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            margin: 0 10px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        .navbar a:hover {
            background-color: #ffffff; 
            color: #0044cc; /
        }

        @media screen and (max-width: 600px) {
            .navbar {
                flex-direction: column;
            }

            .navbar a {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
<div class="navbar">
        <a href="home.jsp">Home</a>
        <a href="transactionList.jsp">TransactionList</a>
        <a href="deleteAccount.jsp">DeleteAccount</a>
        <a href="accountList.jsp">AccountList</a>
        <a href="logout.jsp">Logout</a>
    </div>
</body>
</html>