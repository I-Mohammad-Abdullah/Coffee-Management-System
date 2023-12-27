package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CustomerRegister {

	public void registeration(String Name,String Email,String Address) {
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");
		String sql = "INSERT INTO customer(Name,Email,Address) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
        	preparedStatement.setString(1, Name);
            preparedStatement.setString(2, Email);
            preparedStatement.setString(3, Address);
            
            preparedStatement.executeUpdate();

            System.out.println("customer Registered successfully!");
        }
        
        
        catch (Exception e) {
		            e.printStackTrace();
		        }
		 
		  con.close();
	 }
	 catch (Exception e) {
           System.out.println(e);
       }
	}
}

