<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bank.dao.*"%>
<%@ page import="com.bank.dto.*"%>
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
            background: #6082B6;
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .navbar-top {
            display: flex;
            justify-content: space-evenly;
            width: 100%;
            background-color: #404E67;
            padding: 8px 0; 
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 10;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-top a {
            text-decoration: none;
            padding: 10px 20px; 
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            font-size: 1rem; 
            font-weight: bold;
            color: #fff;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .navbar-top a:hover {
            background: #fff;
            color: #2575fc;
            transform: translateY(-5px);
        }

        .navbar-top h6 {
            margin: 0;
            font-size: 0.9rem; 
            color: #fff;
            align-items: center;
            align-content: center;
        }

        .navbar-top h6 + h6 {
            margin-left: 20px; 
        }

        .navbar {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 80px 10px 10px 10px;
            justify-content: center;
            text-align: center;
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

        .feature {
            width: 180px; 
            height: 180px; 
            margin: 15px; 
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-size: 1.1rem; 
        }

        .feature img {
            width: 70px; 
            height: 70px; 
            margin-bottom: 10px;
        }

        body {
            padding-top: 70px; 
        }

        @media only screen and (max-width: 768px) {
            h1 {
                font-size: 2rem;
                margin-bottom: 8px;
            }

            .navbar-top {
                flex-direction: column;
                padding: 10px;
            }

            .navbar-top a {
                font-size: 0.9rem;
                padding: 8px 16px;
            }

            .navbar-top h6 {
                font-size: 0.8rem;
                margin-bottom: 5px;
            }

            .navbar {
                flex-direction: column;
                padding: 100px 20px 20px;
                justify-content: flex-start;
            }

            .navbar a {
                font-size: 1rem;
                padding: 12px 20px;
            }

            .feature {
                width: 150px; 
                height: 150px; 
                margin: 10px; 
                font-size: 1rem; 
            }

            .feature img {
                width: 60px;
                height: 60px; 
            }
        }

        @media only screen and (max-width: 480px) {
            h1 {
                font-size: 1.8rem;
                margin-bottom: 5px;
            }

            .navbar-top {
                flex-direction: column;
                align-items: center;
                padding: 10px;
            }

            .navbar-top a {
                font-size: 0.8rem;
                padding: 8px 16px;
            }

            .navbar-top h6 {
                font-size: 0.7rem;
                margin-bottom: 5px;
            }

            .navbar {
                flex-direction: column;
                padding: 80px 15px 15px;
                justify-content: center;
            }

            .navbar a {
                font-size: 1rem;
                padding: 10px 18px;
            }

            .feature {
                width: 140px; 
                height: 140px; 
                margin: 8px; 
                font-size: 0.9rem; 
            }

            .feature img {
                width: 50px; 
                height: 50px; 
            }
        }
    </style>
</head>
<body>
    <h1>Welcome to Your Bank</h1>
    
    <div class="navbar-top">
        <h6>Have questions?</h6>
        <h6>7338597156</h6>
        <h6>BankofRoyal@gmail.com</h6>
        <a href="updateAccount.jsp">Update Account</a>
        <a href="resetPin.jsp">Reset PIN</a>
        <a href="logout.jsp">Logout</a>

        <%
        Customer customer = (Customer) session.getAttribute("customer");
            if (customer != null) {
                if (customer.getAcc_no() == 1100110011) {
        %>
                    <a href="adminHome.jsp">AdminHome</a>
        <%
                }
            }
        %>
    </div>

    <div class="navbar">
        <div class="feature">
            <img src="https://static-00.iconduck.com/assets.00/check-balance-icon-1024x1007-lupj86as.png" alt="Check Balance">
            <a href="checkBalance.jsp">Check Balance</a>
        </div>

        <div class="feature">
            <img src="https://thumbs.dreamstime.com/z/bank-vector-icon-money-illustration-sign-deposit-symbol-bank-vector-icon-money-illustration-sign-deposit-symbol-web-sites-171116526.jpg" alt="Deposit">
            <a href="deposit.jsp">Deposit</a>
        </div>

        <div class="feature">
            <img src="https://static.vecteezy.com/system/resources/previews/022/547/948/original/transfer-amount-icon-style-vector.jpg" alt="Transfer Amount">
            <a href="transfer.jsp">Transfer Amount</a>
        </div>

        <div class="feature">
            <img src="https://thumbs.dreamstime.com/z/bank-check-icon-beautiful-meticulously-designed-291874386.jpg" alt="Passbook">
            <a href="passbook.jsp">Passbook</a>
        </div>
    </div>
</body>
</html>
