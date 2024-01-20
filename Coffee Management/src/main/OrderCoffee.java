package main;

import java.sql.*;
//import java.util.Scanner;

public class OrderCoffee {

	public void coffee(int cupSizeID, int beantypeID, int Quantity,String name, String Email,String Address) {
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
	   	     
       
         
       
         
        	 String sql1 = "select Quantity from coffee_beans where ID =?";
        	 PreparedStatement preparedStmt = con.prepareStatement(sql1);
        	 preparedStmt.setInt(1, beantypeID);
        	 ResultSet rs = preparedStmt.executeQuery();
        	 rs.next();
        	 if(Quantity<=rs.getInt(1)) {
        		 

	            String sql = "INSERT INTO order_coffee(Cup_ID,Bean_ID,Quantity,Customer_Name,Customer_Email,Customer_Address) VALUES (?, ?, ?,?,?,?)";
	            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
	            	preparedStatement.setInt(1, cupSizeID);
	                preparedStatement.setInt(2, beantypeID);
	                preparedStatement.setInt(3, Quantity);
	                preparedStatement.setString(4, name);
	                preparedStatement.setString(5, Email);
	                preparedStatement.setString(6, Address);
	                preparedStatement.executeUpdate();

	                System.out.println("Order Placed successfully!");
	                
	                int newquant = rs.getInt(1)-Quantity;
	           	 String sql2 = "update coffee_beans set Quantity = ? where ID =?";
	           	 PreparedStatement preparedSt = con.prepareStatement(sql2);
	           	 preparedSt.setInt(1, newquant);
	           	 preparedSt.setInt(2, beantypeID);
	           	  preparedSt.executeUpdate();
	         
	           	  
	           	  int orderId = getOrderId(con);
	           	String sql3 = "INSERT INTO delivery(Order_ID,Status) VALUES (?, 'In Progress')";
	            try (PreparedStatement Stat = con.prepareStatement(sql3)) {
	            	Stat.setInt(1,orderId);
	                
	                
	                Stat.executeUpdate();
	            }
	            
	            
	            
		 
         
         catch (Exception e) {
	                e.printStackTrace();
	            }
		 }
	            }
        	 
		 else {
            
             System.out.println("Error: Insufficient quantity of beans available!");
         }
        	
	            con.close();
		 }
		 catch (Exception e) {
	            System.out.println(e);
	        }
	}
	
	public int getCupTypeId( String cupType) throws Exception {
		 Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
        String query = "SELECT ID FROM cup_type WHERE Cup_Size = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
            preparedStatement.setString(1, cupType);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                	
                    
                    return resultSet.getInt("ID");
                    
                } else {
                    throw new RuntimeException("Cup type not found for: " + cupType);
                }
            }
        }
    }
	
	
	// Helper method to get bean type ID based on user input
    public int getBeanTypeId( String beanType) throws Exception {
    	 Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
        String query = "SELECT ID FROM coffee_beans WHERE Bean_Type = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
            preparedStatement.setString(1, beanType);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("ID");
                } else {
                    throw new RuntimeException("Bean type not found for: " + beanType);
                }
            }
        }
    }
    
       private static int getOrderId(Connection con) throws Exception {
    	Statement stmt=con.createStatement();
    	ResultSet rs=stmt.executeQuery("select * from order_coffee");

    	rs.last();
    	return rs.getInt(1);
    	 
    }
       
       public boolean checkQuantityAvailable(int beanTypeID, int requestedQuantity) {
    	    try {
    	    	 Class.forName("com.mysql.jdbc.Driver");
    	         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");

    	        String sql = "SELECT Quantity FROM coffee_beans WHERE ID = ?";
    	        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
    	            preparedStatement.setInt(1, beanTypeID);
    	            ResultSet resultSet = preparedStatement.executeQuery();

    	            if (resultSet.next()) {
    	                int availableQuantity = resultSet.getInt("Quantity");
    	                return requestedQuantity <= availableQuantity;
    	            }
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return false;
    	}


}

