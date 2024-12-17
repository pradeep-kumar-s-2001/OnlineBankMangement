<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            padding: 20px;
            width: 300px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div>
     
     <%
     String error =(String) request.getAttribute("error");
        if(error != null)
        {
         %>
           <h6><%=error %></h6>
         <% 
         request.removeAttribute("error");
        }
      %>

    <form name="f1" action="Login" method="post" onSubmit="return validate()">
        <label for="acc_id">Name:</label>
        <input type="text" id="acc_no" name="acc_no"/><br>
        
        <label for="pin">PIN:</label>
        <input type="password" id="pin" name="pin"/><br>
        
        <input type="submit" value="Login"/>
        
        <p>New user? <a href="Register.jsp">Register</a></p>
    </form>

</div>
    <script>
        function validate() {
            var x1 = document.f1.acc_id.value;
            if (x1 == null || x1 == "") {
                alert("Name should not be empty");
                return false;
            }
            var x2 = document.f1.pin.value;
            if (x2 == null || x2 == "") {
                alert("PIN should not be empty");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>