<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Customized Coffee Management</title>
<style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .menu {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .menu h1 {
            color: #333;
        }

        .menu a {
            display: block;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff;
            color: #ffffff;
            border-radius: 5px;
            margin-top: 10px;
        }

        .menu a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 <div class="container">
        <div class="menu">
            <h1>Coffee Management System</h1>
            <a href="OrderCoffee.jsp">Place an Order</a>
            <a href="Deliver.jsp">Update Order Status</a>
            <a href="Inventory.jsp">Inventory Management</a>
        </div>
    </div>
</body>
</html>