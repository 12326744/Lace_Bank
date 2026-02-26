package com.acebank.lite.controllers;

import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ResetPassword", urlPatterns = "/ResetPassword")
public class ResetPassword extends HttpServlet {

    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");

        if (email == null) {
            response.sendRedirect("Forgot.jsp");
            return;
        }

        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("ResetFail.jsp");
            return;
        }

        try {

            boolean updated = bankService.resetPassword(email, newPassword);

            if (updated) {
                session.removeAttribute("resetEmail");
                response.sendRedirect("Login.jsp?reset=success");
            } else {
                response.sendRedirect("ResetFail.jsp");
            }

        } catch (Exception e) {
            response.sendRedirect("ResetFail.jsp");
        }
    }
}