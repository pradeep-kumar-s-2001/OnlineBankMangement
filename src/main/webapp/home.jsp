<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Home</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background:#6082B6;
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 100px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .navbar {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            padding: 10px;
        }

        .navbar a {
            text-decoration: none;
            padding: 15px 30px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            font-size: 1.2rem;
            font-weight: bold;
            color: #fff;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .navbar a:hover {
            background: #fff;
            color: #2575fc;
            transform: translateY(-5px);
        }
    </style>
    <
</head>
<body>
    <h1>Welcome to Your Bank</h1>
    <div class="navbar">
        <a href="checkBalance.jsp">Check Balance</a>
        <a href="deposit.jsp">Deposit</a>
        <a href="transfer.jsp">Transfer Amount</a>
        <a href="passbook.jsp">Passbook</a>
        <a href="updateAccount.jsp">Update Account</a>
        <a href="resetPin.jsp">Reset PIN</a>
        <a href="logout.jsp">Logout</a>
    </div>
</body>
</html>