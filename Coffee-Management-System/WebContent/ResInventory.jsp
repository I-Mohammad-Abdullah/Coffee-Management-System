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

.success-message {
    text-align: center;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.success-message h1 {
    color: #28a745;
}

.success-message p {
    color: #333;
    margin: 10px 0;
}

.success-message a {
    display: inline-block;
    padding: 10px 20px;
    text-decoration: none;
    background-color: #007bff;
    color: #ffffff;
    border-radius: 5px;
    margin-top: 10px;
}

.success-message a:hover {
    background-color: #0056b3;
}
</style>
</head>

<%
Inventory inv = new InventoryProxy().getInventory();
String checkAct = request.getParameter("action");


if ("insert".equals(checkAct)) {
	String beanType = request.getParameter("beanType");
	int mdPrice = Integer.parseInt(request.getParameter("mediumCupPrice"));
	int lgPrice = Integer.parseInt(request.getParameter("largeCupPrice"));
	int smPrice = Integer.parseInt(request.getParameter("smallCupPrice"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	inv.insertCoffeeBean(beanType, smPrice, mdPrice, lgPrice, quantity);
} else if ("update".equals(checkAct)) {
	
	 String beanType = request.getParameter("up_beanType");
	 int quantity = Integer.parseInt(request.getParameter("up_quantity"));
	 inv.updateCoffeeBeanQuantity(beanType, quantity);
	 
} else if ("delete".equals(checkAct)) {
	 String beanType = request.getParameter("del_beanType");
	 inv.deleteCoffeeBean(beanType);
}
%>
<body>
 <div class="container">
            <div class="success-message">
                <h1>Success!</h1>
                <p>Your request has been processed successfully.</p>
                <a href="Home.jsp">Back to Home</a>
            </div>
        </div>
</body>
</html>
