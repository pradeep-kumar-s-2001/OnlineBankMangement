<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bank.dao.*"%>
<%@ page import="com.bank.dto.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transfer Amount</title>
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
            height:500px;
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
            margin-bottom: 20px;
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
    <div class="container">
        <h2>Transfer Money</h2>
        
        <form method="post">
            <label for="acc_no">Enter Account Number:</label>
            <input type="number" id="acc_no" name="account_number" required>
            <br><br>

            <label for="amount">Enter the Amount:</label>
            <input type="number" id="amount" name="amount" required>
            <br><br>

            <label for="pin">Enter your PIN:</label>
            <input type="number" id="pin" name="pin" required>
            <br><br>

            <button type="submit">Transfer</button>
        </form>

        
        <%
            
             HttpSession session2 = request.getSession(false);
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                long accNo = Long.parseLong(request.getParameter("account_number"));
                double amount = Double.parseDouble(request.getParameter("amount"));
                int pin = Integer.parseInt(request.getParameter("pin"));

                Customer customer = (Customer) session.getAttribute("customer");

                if (customer != null) {
                    long userAccNo = customer.getAcc_no(); 

                    TransactionDAO transactionDAO = new TransactionDAOImp();
                    CustomerDao customerDAO = new CustomerDaoImp();
                    Customer rec_acc = customerDAO.getCustomer(accNo); 

                    if (rec_acc != null && customer.getPin() == pin) { // Check if sender's PIN is correct
                        // Sender balance and recipient balance
                        double senderBalance = customer.getBalance();
                        double recipientBalance = rec_acc.getBalance();

                        if (senderBalance >= amount) { // Ensure the sender has sufficient funds
                            // Deduct from sender and add to recipient
                            customer.setBalance(senderBalance - amount);
                            rec_acc.setBalance(recipientBalance + amount);

                            // Update balances in the database
                            boolean senderUpdated = customerDAO.updateCustomer(customer);
                            boolean recipientUpdated = customerDAO.updateCustomer(rec_acc);

                            if (senderUpdated && recipientUpdated) {
                   
                                Transaction transaction = new Transaction();
                                transaction.setTran_id(TransactionID.getTransactionID());
                                transaction.setUser_acc(userAccNo);
                                transaction.setRec_acc(accNo);
                                transaction.setTran_type("Transfer");
                                transaction.setAmount(amount);
                                transaction.setBalance(customer.getBalance());

                                boolean transactionLogged = transactionDAO.insertTransaction(transaction);

                                if (transactionLogged) {
                                    out.println("<p>Transfer Successful!</p>");
                                } else {
                                    out.println("<p>Error logging transaction!</p>");
                                }
                            } else {
                                out.println("<p>Error updating account balances!</p>");
                            }
                        } else {
                            out.println("<p>Insufficient balance!</p>");
                        }
                    } else {
                        out.println("<p>Invalid sender PIN or recipient account!</p>");
                    }
                } else {
                    out.println("<p>You are not logged in!</p>");
                }
            }
        %>

        <a href="home.jsp">Go Back to Home</a>
    </div>
</body>
</html>
