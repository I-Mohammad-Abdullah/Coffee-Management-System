
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customized Coffee Management</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        select, input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
        <h1>Order Customized Coffee</h1>
        <form action="CustomerRegister.jsp">
            <label for="cupSize">Select Cup Size:</label>
            <select id="cupSize" name="cupSize" required>
                <option value="small">Small</option>
                <option value="medium">Medium</option>
                <option value="large">Large</option>
            </select>

            <label for="beanType">Select Bean Type:</label>
            <select id="beanType" name="beanType" required>
                <option value="Arabica">Arabica</option>
                <option value="Robusta">Robusta</option>
                <option value="Excelsa">Excelsa</option>
                <option value="Liberica">Liberica</option>
            </select>

            <label for="quantity">Enter Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" required>

            <button type="submit">Place Order</button>
        </form>
    </div>
    </body>
</html>