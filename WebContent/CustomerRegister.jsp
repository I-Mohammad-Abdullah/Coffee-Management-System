<%@page import="main.*" %>
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

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 30px;
    }

    label {
        display: block;
        margin-bottom: 8px;
    }

    input {
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

    .container {
        text-align: center;
    }

    .row {
        display: flex; /* This makes the element behave like an inline element */
        align-items: center;
        margin-left: 10px;
    }
</style>
</head>
<body>
<%
    OrderCoffee order = new OrderCoffeeProxy().getOrderCoffee();
    int Quan = Integer.parseInt(request.getParameter("quantity"));
    String cupSize = request.getParameter("cupSize");
    String beanType = request.getParameter("beanType");
%>
<div>
    <h1 class="container">Customer Details</h1>
    <form action="Success.jsp" method="post">
        <!-- Customer Details -->
        <!-- Order Details (Read-only) -->
        <h3>Order Details</h3>

        <label for="cupsize">Cup Size: <b><%= cupSize %></b></label>
        <label for="beantype">Bean Type: <b><%=beanType %></b></label>
        <label for="quantity">Quantity: <b><%=Quan %></b></label>

        <div class="container">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email">

            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="4"></textarea>

            <!-- Hidden input fields for Quan, cupSize, and beanType -->
            <input type="hidden" name="Quan" value="<%= Quan %>">
            <input type="hidden" name="cupSize" value="<%= cupSize %>">
            <input type="hidden" name="beanType" value="<%= beanType %>">

            <br/><br/>

            <button type="submit">Submit</button>
        </div>
    </form>
</div>

</body>
</html>
