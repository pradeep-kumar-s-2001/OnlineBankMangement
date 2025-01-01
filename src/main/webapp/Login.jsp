<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
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
           margin:8px 0px;
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
        
        .error{
        color:red;
        font-size:0.8rem;
        }
        .label{
         
         padding:8px 0px;
        
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
      <h2>Login</h2>

    <form  id="login" action="Login" method="post" >
        <label for="acc_id" class="label">AccountNumber:</label>
        <input type="text" id="acc_no" name="acc_no"/><br> 
        
        <label for="pin" class="label">PIN:</label>
        <input type="password" id="pin" name="pin"/><br>
        
        <input type="submit" value="Login"/>
        
        <p>New user? <a href="Register.jsp">Register</a></p>
    </form>

</div>
    
        
        <script>
        $(document).ready(function () {
            $("#login").validate({
                rules: {
                	acc_no: {
                        required: true,
                        minlength:10,
                        maxlength:10
               },
               pin:{
            	   required:true,
            	   minlength:4,
            	   
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