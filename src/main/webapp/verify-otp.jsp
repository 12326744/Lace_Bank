<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP | AceBank</title>
    <style>
        body {
            background: #0f172a;
            font-family: Arial;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            background: #1e293b;
            padding: 40px;
            border-radius: 10px;
            width: 400px;
            text-align: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 15px 0;
            border-radius: 6px;
            border: none;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #16a34a;
            border: none;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background: #15803d;
        }
        .error {
            color: #f87171;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Verify OTP</h2>

    <%
        String email = (String) request.getAttribute("email");
        if (email == null) {
            response.sendRedirect("ForgotPassword.jsp");
            return;
        }
    %>

    <form action="<%= request.getContextPath() %>/VerifyOtp" method="post">
        <input type="hidden" name="email" value="<%= email %>">
        <input type="text" name="otp" placeholder="Enter 6-digit OTP" required>
        <button type="submit">Verify OTP</button>
    </form>
</div>

</body>
</html>