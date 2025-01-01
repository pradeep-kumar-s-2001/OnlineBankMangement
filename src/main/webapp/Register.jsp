<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
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
            flex-direction: column;
        }

        h3 {
            margin-bottom: 20px;
            color: #333;
        }

        form {
            padding: 20px;
            width: 300px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
          
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
    </style>
</head>
<body>
    <h3>Registration Page</h3>
    <form name="f2" action="Register" method="post" id="register">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name"/><br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone"/><br>

        <label for="mail">Email:</label>
        <input type="text" id="mail" name="mail"/><br>

        <label for="pin">PIN:</label>
        <input type="password" id="pin" name="pin"/><br>

        <label for="confirmpin">Confirm PIN:</label>
        <input type="password" id="confirmpin" name="confirmpin"/><br>

        <input type="submit" value="Register"/>
    </form>

    <script>
    $(document).ready(function () {
        $("#register").validate({
            rules: {
            	name: {
                    required: true,
           },
           phone:{
        	   required:true,
        	   minlength:10,
        	   maxlength:10,
        	   
                 }
           },
           mail:{
        	   required:true,
        	   email:true
        	   
                 }
           },
           pin:{
        	   required:true,
        	   minlength:4,
        	   
                 }
           },
           confirmpin:{
        	   required:true,
        	   minlength:4,
        	   equalsTo:"#pin"
        	   
                 }
           },
           
           
           
           
           
           
           
           
           messages:{
        	   acc_no:{
        		   required:"please enter the accountNumber",
        		   minlength:"minmum length of accountnumber is 10",
        		   maxlength:"maxmum length of accountnumber is 10"
        		   
        	   },
           pin:{
        	   required:"please enter the pin",
    		   minlength:"minmum length of pin is 4",
        	  }
        	   
        	   
        	   
           }
               
            })
            
    
            });
    
    </script>
</body>
</html>