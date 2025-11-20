<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.model.User" %>
<%@ page errorPage="error.jsp" %>
<%
    request.setAttribute("pageTitle", "Home");
    
    // Check if user is logged in
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Get current date and time
    java.util.Date currentDate = new java.util.Date();
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEEE, MMMM dd, yyyy 'at' hh:mm a");
%>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="welcome-card">
        <div class="welcome-header">
            <h2>🎉 Welcome, <%= user.getUsername() %>!</h2>
            <p class="datetime"><%= sdf.format(currentDate) %></p>
        </div>
        
        <div class="user-info">
            <h3>Your Profile Information</h3>
            <div class="info-row">
                <span class="label">Username:</span>
                <span class="value"><%= user.getUsername() %></span>
            </div>
            <div class="info-row">
                <span class="label">Email:</span>
                <span class="value"><%= user.getEmail() %></span>
            </div>
            <div class="info-row">
                <span class="label">User ID:</span>
                <span class="value">#<%= user.getId() %></span>
            </div>
        </div>
        
        <div class="actions">
            <a href="LoginServlet" class="btn-logout">Logout</a>
        </div>
    </div>
</div>
<style>
    .container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 2rem;
    }
    .welcome-card {
        background: white;
        padding: 2.5rem;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 600px;
    }
    .welcome-header {
        text-align: center;
        margin-bottom: 2rem;
        padding-bottom: 1.5rem;
        border-bottom: 2px solid #f0f0f0;
    }
    .welcome-header h2 {
        color: #667eea;
        font-size: 2rem;
        margin-bottom: 0.5rem;
    }
    .datetime {
        color: #888;
        font-size: 0.9rem;
    }
    .user-info {
        margin-bottom: 2rem;
    }
    .user-info h3 {
        color: #333;
        margin-bottom: 1rem;
        font-size: 1.3rem;
    }
    .info-row {
        display: flex;
        justify-content: space-between;
        padding: 0.8rem;
        margin-bottom: 0.5rem;
        background: #f8f9fa;
        border-radius: 8px;
    }
    .info-row .label {
        font-weight: 600;
        color: #555;
    }
    .info-row .value {
        color: #667eea;
        font-weight: 500;
    }
    .actions {
        text-align: center;
    }
    .btn-logout {
        display: inline-block;
        padding: 0.9rem 2rem;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
        transition: transform 0.2s;
    }
    .btn-logout:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }
</style>

<%@ include file="footer.jsp" %>
