<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get Started | AceBank</title>
</head>

<body>
<div>
    <header>
        <div>
            <h1>Ace<span>Bank</span></h1>
        </div>

        <div>
            <nav>
                <ul>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <div>
            <h2>Create Account</h2>
            <p>Join thousands of users managing money smarter.</p>
        </div>

        <form action="signup" method="POST" id="signup-form">
            <div>
                <div id="firstName-group">
                    <input type="text" name="firstName" id="firstName" placeholder="First Name">
                </div>
                <div id="lastName-group">
                    <input type="text" name="lastName" id="lastName" placeholder="Last Name">
                </div>
            </div>

            <div id="aadhar-group">
                <input type="text" name="aadharNumber" id="aadharNumber" placeholder="Aadhar Number (12 digits)">
            </div>

            <div id="email-group">
                <input type="email" name="email" id="email" placeholder="Email Address">
            </div>

            <div id="password-group">
                <input type="password" name="password" id="password" placeholder="Password (Min. 10 chars)">
            </div>

            <button type="submit" id="submit-btn">Create Account</button>
        </form>
    </main>
</div>

</body>
</html>