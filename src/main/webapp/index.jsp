<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ace Bank</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/img_1.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body class="${cookie.theme_pref.value}">
<div class="container">
    <header>
        <div class="logo">
            <h1 class="logo-text">Ace<span>Bank</span></h1>
        </div>

        <nav>
            <ul>
                <li>
                    <div class="theme-switch-wrapper">
                        <label class="theme-switch" for="theme-checkbox">
                            <input type="checkbox"
                                   id="theme-checkbox" ${cookie.theme_pref.value == 'dark' ? 'checked' : ''} />
                            <div class="slider round">
                                <i class="ri-sun-line icon-sun"></i>
                                <i class="ri-moon-line icon-moon"></i>
                            </div>
                        </label>
                    </div>
                </li>
                <li><a href="#features">Features</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-primary">Sign Up</a></li>
            </ul>
        </nav>
    </header>

    <main class="hero">
        <section class="hero-text fade-in-up">
            <span class="badge">🔏Next-Gen Banking Platform</span>
            <h1>Bank Smarter <span class="highlight">Live Better</span></h1>
            <p>Take control of your finances with AceBank.A smarter, faster, and more secure way to manage your
            money. Everything you need, all in one powerful platform.</p>

            <div class="hero-btns">
                <a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-primary">Open Account</a>
                <a href="#features" class="btn-secondary">View Features <i class="ri-arrow-right-line"></i></a>
            </div>
        </section>

        <figure class="hero-image float-img">
            <img src="${pageContext.request.contextPath}/assets/images/undraw_device-sync_d9ei.svg"
            alt="Ace Bank Illustration">
        </figure>
    </main>
</div>

<script src="${pageContext.request.contextPath}/assets/js/dark-mode.js"></script>

</body>
</html>