<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%
    request.setAttribute("pageTitle", "Login");
    
    // Check if user is already logged in
    if (session.getAttribute("user") != null) {
        response.sendRedirect("home.jsp");
        return;
    }
%>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="form-container">
        <h2>Welcome Back</h2>
        
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert error">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert success">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>
        
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label>Email</label>
                <input type="Email" name="Email" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="Password" name="Password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="btn">Login</button>
        </form>
        
        <p class="link-text">
            Don't have an account? <a href="register.jsp">Register here</a>
        </p>
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
    .form-container {
        background: white;
        padding: 2.5rem;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 450px;
    }
    .form-container h2 {
        color: #667eea;
        margin-bottom: 1.5rem;
        text-align: center;
        font-size: 1.8rem;
    }
    .form-group {
        margin-bottom: 1.2rem;
    }
    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        color: #333;
        font-weight: 500;
    }
    .form-group input {
        width: 100%;
        padding: 0.8rem;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 1rem;
        transition: border-color 0.3s;
    }
    .form-group input:focus {
        outline: none;
        border-color: #667eea;
    }
    .btn {
        width: 100%;
        padding: 0.9rem;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: transform 0.2s;
    }
    .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }
    .link-text {
        text-align: center;
        margin-top: 1.5rem;
        color: #666;
    }
    .link-text a {
        color: #667eea;
        text-decoration: none;
        font-weight: 600;
    }
    .link-text a:hover {
        text-decoration: underline;
    }
    .alert {
        padding: 0.8rem;
        border-radius: 8px;
        margin-bottom: 1rem;
        text-align: center;
    }
    .alert.error {
        background-color: #fee;
        color: #c33;
        border: 1px solid #fcc;
    }
    .alert.success {
        background-color: #efe;
        color: #3c3;
        border: 1px solid #cfc;
    }
</style>

<%@ include file="footer.jsp" %>