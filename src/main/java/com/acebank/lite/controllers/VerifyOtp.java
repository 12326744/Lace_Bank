package com.acebank.lite.controllers;

import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "VerifyOtp", urlPatterns = "/VerifyOtp")
public class VerifyOtp extends HttpServlet {

    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String otp = request.getParameter("otp");

        try {

            boolean valid = bankService.verifyOtp(email, otp);

            if (valid) {
                request.getSession().setAttribute("resetEmail", email);
                response.sendRedirect("ResetPassword.jsp");
            } else {
                response.sendRedirect("OtpInvalid.jsp");
            }

        } catch (Exception e) {
            response.sendRedirect("OtpInvalid.jsp");
        }
    }
}