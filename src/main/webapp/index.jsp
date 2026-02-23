<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ace Bank</title>

</head>

<body>
<div>
    <header>
        <div>
            <h1>Ace<span>Bank</span></h1>
        </div>

        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-primary">Sign Up</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section>
            <span>Trusted by 2M+ Users</span>
            <h1>Banking Made <span class="highlight">Easy</span></h1>
            <p>Join over 40,000 people who open an Ace Bank account every week. Manage, spend, and save your money with
                ease.</p>

            <div>
                <a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-primary">Open Account</a>
                <a href="#" class="btn-secondary">View Features</a>
            </div>
        </section>

        <figure>
            <img src="${pageContext.request.contextPath}/assets/images/bank_hero.svg" alt="Ace Bank Illustration">
        </figure>
    </main>
</div>


</body>
</html>