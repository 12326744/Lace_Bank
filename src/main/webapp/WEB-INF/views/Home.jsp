<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css">
    <title>Home</title>
</head>
<body>

<header>
    <div class="container header-flex">
        <h1 class="logo-text">Ace<span>Bank</span></h1>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/ChangePassword">Reset Password</a></li>
                <li><a href="${pageContext.request.contextPath}/Logout" class="logout-btn">Logout</a></li>
            </ul>
        </nav>
    </div>
</header>

<main class="container">

    <!-- Welcome Section -->
    <div class="welcome-header">
        <h2>Hello, ${sessionScope.firstName}</h2>
        <p>Account: <strong>${sessionScope.accountNumber}</strong></p>
    </div>

    <!-- Dashboard Grid -->
    <div class="dashboard-grid">

        <!-- Balance Card -->
        <div class="card">
            <h3>Total Balance</h3>
            <div class="amount">₹ ${sessionScope.balance}</div>
            <p>Available for withdrawal</p>
        </div>

        <!-- Deposit Card -->
        <div class="card">
            <h3>Quick Deposit</h3>
            <form action="home" method="post" class="quick-actions">
                <input type="text" name="deposit" placeholder="Amount (₹)" required>
                <button type="submit" class="btn-deposit">Add to Balance</button>
            </form>
        </div>

        <!-- Transfer Card -->
        <div class="card">
            <h3>Send Money</h3>
            <form action="home" method="post">
                <div class="action-row">
                    <input type="text" name="toAccount" placeholder="Recipient Account No" required>
                    <input type="text" name="toAmount" placeholder="Amount (₹)" required>
                </div>
                <button type="submit" class="btn-transfer">Transfer Now</button>
            </form>
        </div>

        <!-- Withdraw Card -->
        <div class="card">
            <h3>Withdraw Money</h3>
            <form action="home" method="post" class="quick-actions">
                <input type="text" name="withdraw" placeholder="Amount (₹)" required>
                <button type="submit" class="btn-withdraw">Withdraw Now</button>
            </form>
        </div>

    </div>

    <!-- Transactions -->
    <div class="card table-card">
        <h3>Recent Transactions</h3>

        <form action="${pageContext.request.contextPath}/download-statement" method="get">
            <div class="action-row">
                <input type="date" name="fromDate" required>
                <input type="date" name="toDate" required>
                <button type="submit" class="btn-transfer">Download CSV</button>
            </div>
        </form>

        <table class="transaction-table">
            <thead>
            <tr>
                <th>Date</th>
                <th>Type</th>
                <th>Reference</th>
                <th>Amount</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="tx" items="${sessionScope.transactionDetailsList}">
                <tr>
                    <td>${tx.createdAt()}</td>
                    <td>
                        <span class="type-badge">${tx.txType()}</span>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${tx.txType() == 'TRANSFER'}">
                                ${tx.senderAccount() == sessionScope.accountNumber ? 'To ' : 'From '}
                                ${tx.senderAccount() == sessionScope.accountNumber ? tx.receiverAccount() : tx.senderAccount()}
                            </c:when>
                            <c:otherwise>
                                ${tx.remark()}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="${tx.txType() == 'DEPOSIT' ? 'pos' : 'neg'}">
                        ₹ ${tx.amount()}
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</main>

</body>
</html>