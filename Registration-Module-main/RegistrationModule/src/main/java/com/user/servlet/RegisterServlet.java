package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.UserDAO;
import com.user.model.User;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private UserDAO userDAO;
	 
	 public void init() {
	        userDAO = new UserDAO();
	    }
	 
	 @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 	String Username = request.getParameter("Username");
	        String Email = request.getParameter("Email");
	        String Password = request.getParameter("Password");
	        String confirmPassword = request.getParameter("confirmPassword");
	        
	        try
	        {
	        	// Validation
	            if (Username == null || Username.trim().isEmpty() ||
	                Email == null || Email.trim().isEmpty() ||
	                Password == null || Password.isEmpty()) {
	                
	                request.setAttribute("errorMessage", "All fields are required!");
	                request.getRequestDispatcher("register.jsp").forward(request, response);
	                return;
	            }
	            
	            if (!Password.equals(confirmPassword)) {
	                request.setAttribute("errorMessage", "Passwords do not match!");
	                request.getRequestDispatcher("register.jsp").forward(request, response);
	                return;
	            }
	            if (userDAO.checkEmailExists(Email)) {
	                request.setAttribute("errorMessage", "Email already exists!");
	                request.getRequestDispatcher("register.jsp").forward(request, response);
	                return;
	            }
	            User user = new User(Username, Email, Password);
	            
	            if (userDAO.registerUser(user)) {
	                request.setAttribute("successMessage", "Registration successful! Please login.");
	                request.getRequestDispatcher("login.jsp").forward(request, response);
	            } else {
	                throw new Exception("Registration failed!");
	            }
	        }
	        catch (Exception e) {
	        	request.setAttribute("exception", e);
	            request.getRequestDispatcher("error.jsp").forward(request, response);
			}
	}
}
