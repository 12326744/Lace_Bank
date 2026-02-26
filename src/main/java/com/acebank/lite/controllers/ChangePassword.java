package com.acebank.lite.controllers;

import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lombok.extern.java.Log;

import java.io.IOException;
import java.sql.SQLException;

@Log
@WebServlet(name = "ChangePassword", urlPatterns = "/ChangePassword")
public class ChangePassword extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final BankService bankService = new BankServiceImpl();

    // Show Change Password Page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("accountNumber") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // FORWARD (not redirect) because JSP is inside WEB-INF
        request.getRequestDispatcher("/WEB-INF/views/ChangePassword.jsp")
                .forward(request, response);
    }

    // Handle Form Submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("accountNumber") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int accountNo = (int) session.getAttribute("accountNumber");

        try {
            boolean isChanged = bankService.changePassword(accountNo, currentPassword, newPassword);

            if (isChanged) {
                log.info("Password successfully changed for Account: " + accountNo);

                // Redirect to logout after success
                response.sendRedirect("Logout?msg=PasswordChangedSuccessfully");
            } else {
                log.warning("Password change failed for Account: " + accountNo);

                // Forward back to JSP with error message
                request.setAttribute("error", "Invalid current password");
                request.getRequestDispatcher("/WEB-INF/views/ChangePassword.jsp")
                        .forward(request, response);
            }

        } catch (SQLException e) {
            log.severe("Error changing password: " + e.getMessage());
            request.setAttribute("error", "System error. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/ChangePassword.jsp")
                    .forward(request, response);
        }
    }
}