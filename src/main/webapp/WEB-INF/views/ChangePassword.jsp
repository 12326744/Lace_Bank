<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-home.css">
    <title>Change Password</title>
    <style>
        /* --- Root Variables --- */
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --success-color: #10b981;
            --error-color: #ef4444;
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-color: #1f2937;
            --light-text: #6b7280;
            --input-border: #d1d5db;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        /* --- Global Styles --- */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        header {
            background: var(--card-bg);
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 8px var(--shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo-text {
            font-size: 2.4rem;
            font-weight: 800;
            color: var(--primary-color);
        }

        .logo-text .bank {
            color: var(--primary-hover);
        }

        .nav-toggle-label img {
            width: 28px;
            cursor: pointer;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 1.5rem;
            margin: 0;
            padding: 0;
        }

        nav a {
            text-decoration: none;
            color: var(--text-color);
            font-weight: 500;
            transition: color 0.3s;
        }

        nav a:hover,
        .login-btn:hover {
            color: var(--primary-color);
        }

        /* --- Container --- */
        .container {
            max-width: 600px;
            margin: 3rem auto;
            padding: 2rem;
        }

        .settings-container {
            background: var(--card-bg);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px var(--shadow);
        }

        .title-container h1 {
            margin: 0 0 0.2rem;
            font-size: 2rem;
            color: var(--primary-color);
        }

        .title-container small {
            color: var(--light-text);
        }

        /* --- Form Controls --- */
        .form-control {
            margin-bottom: 1.8rem;
            position: relative;
        }

        .form-control label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .form-control input {
            width: 100%;
            padding: 0.8rem 1rem;
            font-size: 1rem;
            border: 1px solid var(--input-border);
            border-radius: 8px;
            outline: none;
            transition: all 0.3s;
        }

        .form-control input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
        }

        .form-control i {
            position: absolute;
            right: 1rem;
            top: 2.5rem;
            font-size: 1.2rem;
            display: none;
        }

        .form-control i.show {
            display: inline;
        }

        .form-control small {
            color: var(--error-color);
            margin-top: 0.3rem;
            display: block;
        }

        .show {
            display: inline;
            color: var(--error-color);
        }

        /* --- Submit Button --- */
        input[type="submit"] {
            width: 100%;
            padding: 0.9rem 0;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            background: var(--primary-color);
            color: #fff;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px var(--shadow);
        }

        /* --- Responsive --- */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                gap: 1rem;
            }

            nav ul {
                flex-direction: column;
                gap: 0.8rem;
            }

            .settings-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>

<body>
<header>
    <h1 class="logo-text">Ace<span class="bank">Bank</span></h1>
    <input type="checkbox" id="nav-toggle" class="nav-toggle">
    <label for="nav-toggle" class="nav-toggle-label">
        <img src="${pageContext.request.contextPath}/images/menu-24px.svg" alt="Menu">
    </label>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/Home.jsp">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp" class="login-btn">Logout</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <main class="settings-container">
        <div class="title-container">
            <h1>Change Password</h1>
            <small>Password should be at least 10 characters long</small>
        </div>
        <div class="change-container">
            <form action="${pageContext.request.contextPath}/ChangePassword" id="pass-form" method="post">

                <!-- Current Password -->
                <div class="form-control">
                    <label>Enter Current Password</label>
                    <input type="password" name="currentPassword" id="currentPassword" placeholder="Current Password" required>
                    <i class="material-icons" id="correct-current">check_circle</i>
                    <i class="material-icons" id="error-current">error</i>
                    <small class="show">
                        ${error != null ? 'Invalid current password' : ''}
                    </small>
                </div>

                <!-- New Password -->
                <div class="form-control">
                    <label>Enter New Password</label>
                    <input type="password" name="newPassword" id="newPassword" placeholder="New Password" required>
                    <i class="material-icons" id="correct-new">check_circle</i>
                    <i class="material-icons" id="error-new">error</i>
                    <small></small>
                </div>

                <!-- Confirm New Password -->
                <div class="form-control">
                    <label>Confirm New Password</label>
                    <input type="password" name="confirmNewPassword" id="confirmNewPassword" placeholder="Confirm New Password" required>
                    <i class="material-icons" id="correct-confirm">check_circle</i>
                    <i class="material-icons" id="error-confirm">error</i>
                    <small id="msg-confirm" class="show"></small>
                </div>

                <input type="submit" value="Change Password">
            </form>
        </div>
    </main>
</div>

<script>
    const form = document.getElementById("pass-form");

    form.addEventListener("submit", function(event) {
        const newPassword = document.getElementById("newPassword").value;
        const confirmNewPassword = document.getElementById("confirmNewPassword").value;
        const msgConfirm = document.getElementById("msg-confirm");
        const errorConfirm = document.getElementById("error-confirm");

        if (newPassword !== confirmNewPassword) {
            msgConfirm.innerText = "Passwords do not match";
            errorConfirm.classList.add("show");
            event.preventDefault();
        } else {
            msgConfirm.innerText = "";
            errorConfirm.classList.remove("show");
        }
    });
</script>

<script defer src="${pageContext.request.contextPath}/javascript/account.js" type="text/javascript"></script>
</body>
</html>