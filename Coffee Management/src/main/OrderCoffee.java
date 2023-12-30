package main;

import java.sql.*;
//import java.util.Scanner;

public class OrderCoffee {

	public void coffee(String cupSize, String beantype, int Quantity) {
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
	       //     Scanner scanner = new Scanner(System.in);
	            

//        System.out.println("Enter cup size: ");
//         String cupSize = scanner.nextLine();
	     int orderId = getOrderId(con);
	     
         int cupTypeId = getCupTypeId(con, cupSize);
//     	System.out.println(cupTypeId);

         
//         System.out.println("Select Bean: ");
//       
//         String beantype= scanner.nextLine();

         int beanTypeId = getBeanTypeId(con, beantype);
         
         int CustomerId = getCustomerId(con);
       //   System.out.println(CustomerId);
 
//         System.out.println("Enter Quantity: ");
//         int Quantity = scanner.nextInt();
//         
         
         //System.out.println(rs.getInt(1));
         
        	 String sql1 = "select Quantity from coffee_beans where ID =?";
        	 PreparedStatement preparedStmt = con.prepareStatement(sql1);
        	 preparedStmt.setInt(1, beanTypeId);
        	 ResultSet rs = preparedStmt.executeQuery();
        	 rs.next();
        	 if(Quantity<=rs.getInt(1)) {
        		 

	            String sql = "INSERT INTO order_coffee(Cup_ID,Bean_ID,Quantity,Cust_ID) VALUES (?, ?, ?,?)";
	            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
	            	preparedStatement.setInt(1, cupTypeId);
	                preparedStatement.setInt(2, beanTypeId);
	                preparedStatement.setInt(3, Quantity);
	                preparedStatement.setInt(4, CustomerId);
	                
	                preparedStatement.executeUpdate();

	                System.out.println("Order Placed successfully!");
	                
	                int newquant = rs.getInt(1)-Quantity;
	           	 String sql2 = "update coffee_beans set Quantity = ? where ID =?";
	           	 PreparedStatement preparedSt = con.prepareStatement(sql2);
	           	 preparedSt.setInt(1, newquant);
	           	 preparedSt.setInt(2, beanTypeId);
	           	  preparedSt.executeUpdate();
	           	  
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
	
	private static int getCupTypeId(Connection con, String cupType) throws Exception {
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
    private static int getBeanTypeId(Connection con, String beanType) throws Exception {
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
    
    private static int getCustomerId(Connection con) throws Exception {
    	Statement stmt=con.createStatement();
    	ResultSet rs=stmt.executeQuery("select * from customer");

    	rs.last();
    	return rs.getInt(1);
    	 
    }
    private static int getOrderId(Connection con) throws Exception {
    	Statement stmt=con.createStatement();
    	ResultSet rs=stmt.executeQuery("select * from order_coffee");

    	rs.last();
    	return rs.getInt(1);
    	 
    }


}

