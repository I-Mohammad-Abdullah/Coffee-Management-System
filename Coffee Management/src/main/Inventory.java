package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

public class Inventory {

	


    public void insertCoffeeBean(String beanType, int smallCupPrice, int mediumCupPrice, int largeCupPrice,
            int quantity) throws Exception {
    	
        
        try {
        	 Class.forName("com.mysql.jdbc.Driver");
        	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
            String sql = "INSERT INTO coffee_beans(Bean_Type, Bean_Price_small_cup, Bean_Price_medium_cup, Bean_Price_large_cup, Quantity) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, beanType);
                preparedStatement.setInt(2, smallCupPrice);
                preparedStatement.setInt(3, mediumCupPrice);
                preparedStatement.setInt(4, largeCupPrice);
                preparedStatement.setInt(5, quantity);

                preparedStatement.executeUpdate();
                

                System.out.println("Coffee bean added to inventory successfully!");
                
                
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select * from coffee_beans");

                while(rs.next())
                {
                System.out.println("ID: " + rs.getInt(1) + " Bean Name:  " + rs.getString(2) + " Price for Small Cup:  "
                + rs.getInt(3) + " Price for Medium Cup:  " + rs.getInt(4) + " Price for Large Cup:  " + rs.getInt(5) + " Quantity:  " + rs.getInt(6));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void deleteCoffeeBean(String beanType)throws Exception {
    	
        try  {
        	 Class.forName("com.mysql.jdbc.Driver");
        	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
            String sql = "DELETE FROM coffee_beans WHERE Bean_Type = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, beanType);

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Coffee bean deleted from inventory successfully!");
                } else {
                    System.out.println("Coffee bean not found in inventory!");
                    
                    
                }
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select * from coffee_beans");

                while(rs.next())
                {
                System.out.println("ID: " + rs.getInt(1) + " Bean Name:  " + rs.getString(2) + " Price for Small Cup:  "
                + rs.getInt(3) + " Price for Medium Cup:  " + rs.getInt(4) + " Price for Large Cup:  " + rs.getInt(5) + " Quantity:  " + rs.getInt(6));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCoffeeBeanQuantity(String beanType, int newQuantity) throws Exception {
    	
        try  {
        	 Class.forName("com.mysql.jdbc.Driver");
        	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
            String sql = "UPDATE coffee_beans SET Quantity = ? WHERE Bean_Type = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, newQuantity);
                preparedStatement.setString(2, beanType);

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Coffee bean quantity updated successfully!");
                } else {
                    System.out.println("Coffee bean not found in inventory!");
                }
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select * from coffee_beans");

                while(rs.next())
                {
                System.out.println("ID: " + rs.getInt(1) + " Bean Name:  " + rs.getString(2) + " Price for Small Cup:  "
                + rs.getInt(3) + " Price for Medium Cup:  " + rs.getInt(4) + " Price for Large Cup:  " + rs.getInt(5) + " Quantity:  " + rs.getInt(6));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }}


