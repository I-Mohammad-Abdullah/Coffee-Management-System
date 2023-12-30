package main;

import java.sql.*;

public class CashonDelivery {

    public void delivery(int orderId, String status) {

        try {
        	 Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee management", "root", "");

            String sql = "UPDATE delivery SET Status = ? WHERE Order_ID = ?";
            try (PreparedStatement preparedSt = con.prepareStatement(sql)) {
                preparedSt.setString(1, status);
                preparedSt.setInt(2, orderId);
                int rowsAffected = preparedSt.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Status updated successfully!");
                } else {
                    System.out.println("No rows were updated. Check if the order ID exists.");
                }
            }

            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
