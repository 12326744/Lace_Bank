<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>

<header>
    <div>
        <h1>Ace<span>Bank</span></h1>
        <nav>
            <ul>
                <li><a href="ChangePassword.jsp">Reset Password</a></li>
                <li><a href="Logout" class="logout-btn"><i class="ri-logout-box-r-line"></i> Logout</a></li>
            </ul>
        </nav>
    </div>
</header>

<main class="container fade-in-up">
    <div class="welcome-header">
        <h1>Hello, ${sessionScope.firstName}</h1>
        <p>Account: <span class="acc-badge">${sessionScope.accountNumber}</span></p>
    </div>


    <div>
        <%-- 1. Balance Card (Overview Only) --%>
        <div>
            <div>
                <h3>Total Balance</h3>
            </div>
            <h1>₹ <span id="balance-counter">${sessionScope.balance}</span></h1>
            <p>Available for withdrawal</p>
        </div>

        <%-- 2. New Deposit Card (Dedicated Section) --%>
        <div>
            <div>
                <h3>Quick Deposit</h3>
            </div>
            <form action="home" method="post" class="vertical-form">
                <div class="input-group">
                    <input type="text" name="deposit" placeholder="Amount to Add (₹)"
                           pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required/>
                </div>
                <button type="submit">Add to Balance</button>
            </form>
        </div>

        <%-- 3. Transfer Card --%>
        <div>
            <div>
                <h3>Send Money</h3>
            </div>
            <form action="home" method="post">
                <input type="text" name="toAccount" placeholder="Recipient Account No" required/>
                <input type="text" name="toAmount" placeholder="Amount (₹)"
                       pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required/>
                <button type="submit" class="btn-transfer full-width">Transfer Now</button>
            </form>
        </div>

        <%-- 4. Withdraw Card --%>
        <div>
            <div>
                <h3>Withdraw Money</h3>
            </div>
            <form action="home" method="post" class="vertical-form">
                <div>
                    <input type="text" name="withdraw" placeholder="Amount to Withdraw (₹)"
                           pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required/>
                </div>
                <button type="submit">Withdraw Now</button>
            </form>
        </div>
    </div>

    <%-- Transactions Table --%>
    <section>
        <div>
            <h3>Recent Transactions</h3>
           <form action="${pageContext.request.contextPath}/download-statement" method="get">
               <label>From:</label>
               <input type="date" name="fromDate" required />

               <label>To:</label>
               <input type="date" name="toDate" required />

               <button type="submit" class="btn-secondary">
                   Download CSV
               </button>
           </form>
        </div>
        <table>
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
                            <%-- Added a CSS class based on type for better UX --%>
                        <span class="badge-${tx.txType().toLowerCase()}">${tx.txType()}</span>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${tx.txType() == 'TRANSFER'}">
                    <span class="ref-text">
                        ${tx.senderAccount() == sessionScope.accountNumber ? 'To' : 'From'}
                        ${tx.senderAccount() == sessionScope.accountNumber ? tx.receiverAccount() : tx.senderAccount()}
                    </span>
                            </c:when>
                            <c:otherwise>
                                <%-- For DEPOSIT/WITHDRAWAL, just show the remark --%>
                                <span class="remark-text">${tx.remark()}</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        ₹${tx.amount()}
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</main>


</body>
</html>