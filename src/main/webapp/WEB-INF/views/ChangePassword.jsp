<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/account.css">
    <title>Change Password</title>
    <style>
        .show { display: inline; color: red; }
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