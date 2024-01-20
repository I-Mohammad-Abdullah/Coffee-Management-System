<%@ page import="main.*" %>
<%@ page import="java.util.Scanner" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffee Bean Inventory Management</title>
   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .inventory-form {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .inventory-form h1 {
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .button-group {
            margin-top: 20px;
        }

        .button-group button {
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button-group button:hover {
            background-color: #0056b3;
        }

        /* Hide specific fields based on selected action */
        .hidden-fields {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="inventory-form">
            <h1>Coffee Bean Inventory Management</h1>
            <form action="ResInventory.jsp" method="post">
                <div class="form-group">
                    <label for="actionSelect">Select Action:</label>
                    <select id="actionSelect" name="action" onchange="toggleFields()">
                        <option value="insert">Insert</option>
                        <option value="update">Update</option>
                        <option value="delete">Delete</option>
                    </select>
                </div>

              
                <div class="form-group hidden-fields" id="insertFields">
               		<label for="beanType">Bean Type:</label>
                    <input type="text" id="beanType" name="beanType" >
                    <label for="smallCupPrice">Small Cup Price:</label>
                    <input type="number" id="smallCupPrice" name="smallCupPrice" >
                    <label for="mediumCupPrice">Medium Cup Price:</label>
                    <input type="number" id="mediumCupPrice" name="mediumCupPrice" >
                    <label for="largeCupPrice">Large Cup Price:</label>
                    <input type="number" id="largeCupPrice" name="largeCupPrice" >
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" >
                         <div class="button-group">
                    <button type="submit" name="insert">Insert Coffee Bean</button>
                   
                </div>
                </div>

                <div class="form-group hidden-fields" id="updateFields">
                <label for="beanType">Bean Type:</label>
                    <input type="text" id="beanType" name="beanType" >
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" >
                  <div class="button-group">
                    <button type="submit" name="updateQuantity">Update Quantity</button>
                </div>
                </div>

                <div class="form-group hidden-fields" id="deleteFields">
                <label for="beanType">Bean Type:</label>
                    <input type="text" id="beanType" name="beanType" >
                         <div class="button-group">
               
                    <button type="submit" name="delete">Delete Coffee Bean</button>
                   
                </div>
                    <!-- You may add specific fields for delete action here -->
                </div>

                  
            </form>
        </div>
    </div>

    <script>
        function toggleFields() {
            var actionSelect = document.getElementById("actionSelect");
            var insertFields = document.getElementById("insertFields");
            var updateFields = document.getElementById("updateFields");
            var deleteFields = document.getElementById("deleteFields");

            // Hide all fields
            insertFields.classList.add("hidden-fields");
            updateFields.classList.add("hidden-fields");
            deleteFields.classList.add("hidden-fields");

            // Show fields based on selected action
            if (actionSelect.value === "insert") {
                insertFields.classList.remove("hidden-fields");
            } else if (actionSelect.value === "update") {
                updateFields.classList.remove("hidden-fields");
            } else if (actionSelect.value === "delete") {
                deleteFields.classList.remove("hidden-fields");
            }
        }
    </script>
    
   
</body>
</html>
