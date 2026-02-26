<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error | AceBank</title>
    <style>
        body {
            background: #0f172a;
            font-family: Arial;
            color: white;
            text-align: center;
            padding-top: 120px;
        }
        a {
            color: #60a5fa;
            text-decoration: none;
        }
    </style>
</head>
<body>

<h2>Email not found or something went wrong.</h2>
<br>
<a href="<%= request.getContextPath() %>/ForgotPassword.jsp">
    Try Again
</a>

</body>
</html>