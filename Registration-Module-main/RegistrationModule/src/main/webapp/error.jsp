<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%
request.setAttribute("pageTitle", "Error");
%>
<%@ include file="header.jsp"%>

<div class="container">
	<div class="error-card">
		<div class="error-icon">⚠️</div>
		<h2>Oops! Something went wrong</h2>

		<div class="error-details">
			<%
			Throwable exc = (Throwable) request.getAttribute("exception");
			if (exc == null) {
				exc = exception;
			}

			if (exc != null) {
			%>
			<p class="error-message">
				<strong>Error:</strong>
				<%=exc.getMessage()%></p>
			<details class="error-stack">
				<summary>Technical Details</summary>
				<pre><%=exc.getClass().getName()%>
                    
Stack Trace:
<%
				for (StackTraceElement element : exc.getStackTrace()) {
					out.println("    at " + element.toString());
				}
				%>
                    </pre>
			</details>
			<%
			} else {
			%>
			<p class="error-message">An unexpected error occurred. Please try
				again later.</p>
			<%
			}
			%>
		</div>

		<div class="error-actions">
			<a href="login.jsp" class="btn">Go to Login</a> <a
				href="register.jsp" class="btn btn-secondary">Register</a>
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

.error-card {
	background: white;
	padding: 2.5rem;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
	width: 100%;
	max-width: 650px;
	text-align: center;
}

.error-icon {
	font-size: 4rem;
	margin-bottom: 1rem;
}

.error-card h2 {
	color: #e74c3c;
	font-size: 1.8rem;
	margin-bottom: 1.5rem;
}

.error-details {
	background: #fff5f5;
	padding: 1.5rem;
	border-radius: 8px;
	margin-bottom: 1.5rem;
	border: 1px solid #ffdddd;
	text-align: left;
}

.error-message {
	color: #c33;
	margin-bottom: 1rem;
	line-height: 1.6;
}

.error-stack {
	margin-top: 1rem;
}

.error-stack summary {
	cursor: pointer;
	color: #667eea;
	font-weight: 600;
	margin-bottom: 0.5rem;
}

.error-stack pre {
	background: #f8f9fa;
	padding: 1rem;
	border-radius: 5px;
	overflow-x: auto;
	font-size: 0.85rem;
	color: #555;
	margin-top: 0.5rem;
}

.error-actions {
	display: flex;
	gap: 1rem;
	justify-content: center;
}

.btn {
	padding: 0.9rem 1.5rem;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	text-decoration: none;
	border-radius: 8px;
	font-weight: 600;
	transition: transform 0.2s;
}

.btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
}

.btn-secondary {
	background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
}
</style>

<%@ include file="footer.jsp"%>