package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.UserDAO;
import com.user.model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    
    public LoginServlet() {
        
    	userDAO = new UserDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
    	 String Email = request.getParameter("Email");
         String Password = request.getParameter("Password");
         
         try {
             if (Email == null || Email.trim().isEmpty() ||
                 Password == null || Password.isEmpty()) {
                 
                 request.setAttribute("errorMessage", "Email and Password are required!");
                 request.getRequestDispatcher("login.jsp").forward(request, response);
                 return;
             }
             
             User user = userDAO.loginUser(Email, Password);
             
             if (user != null) {
                 HttpSession session = request.getSession();
                 session.setAttribute("user", user);
                 session.setAttribute("username", user.getUsername());
                 response.sendRedirect("home.jsp");
             }
             else {
                 request.setAttribute("errorMessage", "Invalid email or password!");
                 request.getRequestDispatcher("login.jsp").forward(request, response);
             }
         }
         catch (Exception e) {
        	 request.setAttribute("exception", e);
             request.getRequestDispatcher("error.jsp").forward(request, response);
		}
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();	
        }
        response.sendRedirect("login.jsp");
    }

	
}
