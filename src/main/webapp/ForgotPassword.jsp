<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password | AceBank</title>
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
            background: #2563eb;
            border: none;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background: #1d4ed8;
        }
        a {
            color: #60a5fa;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Forgot Password</h2>

    <form action="<%= request.getContextPath() %>/Forgot" method="post">
        <input type="email" name="email" placeholder="Enter your registered email" required>
        <button type="submit">Send OTP</button>
    </form>

    <br>
    <a href="<%= request.getContextPath() %>/login.jsp">Back to Login</a>
</div>

</body>
</html>