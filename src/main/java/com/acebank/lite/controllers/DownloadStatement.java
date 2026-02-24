package com.acebank.lite.controllers;

import com.acebank.lite.models.Transaction;
import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/download-statement")
public class DownloadStatement extends HttpServlet {

    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp) throws IOException {

        Object accObj = req.getSession().getAttribute("accountNumber");

        if (accObj == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        int accountNo = Integer.parseInt(accObj.toString());

        // 🔥 Get date parameters
        String fromParam = req.getParameter("fromDate");
        String toParam = req.getParameter("toDate");

        if (fromParam == null || toParam == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Date range is required");
            return;
        }

        LocalDate fromDate = LocalDate.parse(fromParam);
        LocalDate toDate = LocalDate.parse(toParam);

        LocalDateTime start = fromDate.atStartOfDay();
        LocalDateTime end = toDate.atTime(23, 59, 59);

        // 🔥 Validate date range
        if (start.isAfter(end)) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid date range");
            return;
        }

        // 🔥 Fetch filtered transactions
        List<Transaction> transactions =
                bankService.getTransactionsBetween(accountNo, start, end);

        // Tell browser this is downloadable CSV
        resp.setContentType("text/csv");
        resp.setHeader("Content-Disposition",
                "attachment; filename=statement.csv");

        PrintWriter writer = resp.getWriter();

        // CSV Header
        writer.println("Date,Type,Reference,Amount");

        // CSV Rows
        for (Transaction tx : transactions) {
            writer.printf("%s,%s,%s,%s%n",
                    tx.createdAt(),
                    tx.txType(),
                    tx.remark(),
                    tx.amount()
            );
        }

        writer.flush();
        writer.close();
    }
}