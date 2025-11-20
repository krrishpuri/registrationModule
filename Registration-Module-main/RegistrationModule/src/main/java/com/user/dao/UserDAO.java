package com.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.model.User;
import com.user.util.DBConnection;

public class UserDAO {
	
	public boolean registerUser(User user) throws SQLException
	{
		String query = "INSERT INTO Users (Username, Email, Password) VALUES (?, ?, ?)";
		
		try(Connection conn = DBConnection.getConnection();
	             PreparedStatement pst = conn.prepareStatement(query))
		{
			pst.setString(1, user.getUsername());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            
            int result = pst.executeUpdate();
            return result > 0;
		}
		
	}
	
	public User loginUser(String Email, String Password) throws SQLException
	{
		String query = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
		 try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pst = conn.prepareStatement(query)) 
		 {
			  	pst.setString(1, Email);
	            pst.setString(2, Password);
	            
	            ResultSet rs = pst.executeQuery();
	            
	            if(rs.next())
	            {
	            	User user = new User();
	            	user.setID(rs.getInt("ID"));
	                user.setUsername(rs.getString("Username"));
	                user.setEmail(rs.getString("Email"));
	                
	                return user;
	            }
		 }
		 return null;
	}

	public boolean checkEmailExists(String email) throws SQLException {
        String query = "SELECT Email FROM users WHERE Email = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(query)) {
            
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            return rs.next();
        }
    }
}
