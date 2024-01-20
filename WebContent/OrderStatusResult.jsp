<%@page import="main.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
.failure-message {
    text-align: center;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(255, 0, 0, 0.1); /* Red shadow for failure */
}

.failure-message h1 {
    color: #dc3545; /* Red color for failure heading */
}

.failure-message p {
    color: #dc3545; /* Red color for failure message */
    margin: 10px 0;
}

.failure-message a {
    display: inline-block;
    padding: 10px 20px;
    text-decoration: none;
    background-color: #dc3545; /* Red color for failure button */
    color: #ffffff;
    border-radius: 5px;
    margin-top: 10px;
}

.failure-message a:hover {
    background-color: #bd2130; /* Darker red on hover */
}

</style>
</head>
<body>
<%
    CashonDelivery COD = new  CashonDeliveryProxy().getCashonDelivery();
    int orderid = Integer.parseInt(request.getParameter("orderId"));
    String status = request.getParameter("status");
   
    // Check if there is sufficient quantity of beans available
    boolean isOrderExist = COD.isOrderIdExists(orderid);
    

    if (isOrderExist) {
    	COD.delivery(orderid, status);
%>
        <div class="container">
            <div class="success-message">
                <h1>Success!</h1>
                <p>Order Status Updated Successfully.</p>
                <a href="Home.jsp">Back to Home</a>
            </div>
        </div>
<%
    } else {
%>
        <div class="container">
            <div class="failure-message">
                <h1>Failure!</h1>
                <p>Order ID Doen't Exist.</p>
                <a href="Home.jsp">Back to Home</a>
            </div>
        </div>
<%
    }
%>
</body>
</html>
