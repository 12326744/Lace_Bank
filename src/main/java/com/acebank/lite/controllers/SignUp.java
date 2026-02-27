package com.acebank.lite.controllers;


import com.acebank.lite.models.LoginResult;
import com.acebank.lite.models.User;
import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

import java.io.IOException;
import java.io.Serial;
import java.util.ArrayList;
import java.util.Optional;

@Log
@WebServlet("/sign-up")
public class SignUp extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    // Use the service, not the DAO directly
    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Extract Data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String aadharStr = request.getParameter("aadharNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User newUser = new User(
                    null,
                    firstName,
                    lastName,
                    aadharStr,
                    email,
                    password,
                    null
            );

            // 3. Call Service to handle logic
            Optional<LoginResult> resultOpt = bankService.registerUser(newUser);

            if (resultOpt.isPresent()) {
                var details = resultOpt.get();
                HttpSession session = request.getSession();

                // 4. Set Session Attributes
                session.setAttribute("accountNumber", details.accountNumber());
                session.setAttribute("firstName", details.firstName());
                session.setAttribute("email", details.email());
                session.setAttribute("balance", details.balance());
                session.setAttribute("transactionDetailsList", new ArrayList<>());

                response.sendRedirect(request.getContextPath() + "/home");
            } else {
                response.sendRedirect("GenericError.html");
            }

        } catch (Exception e) {
            log.severe("SignUp Servlet Error: " + e.getMessage());
            response.sendRedirect("GenericError.html");
        }
    }
}