package com.acebank.lite.controllers;



import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/withdraw")
public class Withdraw extends HttpServlet {

    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp) throws IOException {

        Object accObj = req.getSession().getAttribute("accountNumber");

        if (accObj == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        int accNo = Integer.parseInt(accObj.toString());

        BigDecimal amount;
        try {
            amount = new BigDecimal(req.getParameter("amount"));
        } catch (Exception e) {
            req.getSession().setAttribute("errorMessage", "Invalid amount entered.");
            resp.sendRedirect(req.getContextPath() + "/withdraw.jsp");
            return;
        }

        String result = bankService.withdraw(accNo, amount);

        if ("SUCCESS".equals(result)) {
            resp.sendRedirect(req.getContextPath() + "/home?msg=WithdrawalSuccessful");
        } else {
            req.getSession().setAttribute("errorMessage", result);
            resp.sendRedirect(req.getContextPath() + "/withdraw.jsp");
        }
    }
}