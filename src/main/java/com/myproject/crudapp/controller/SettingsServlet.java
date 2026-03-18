package com.myproject.crudapp.controller;

import com.myproject.crudapp.auth.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/settings")
public class SettingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("settings.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Users user = (Users) session.getAttribute("user");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!user.getPassword().equals(currentPassword)) {
            request.setAttribute("error", "Current password is incorrect.");
        }
        else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New passwords do not match.");
        }
        else {

            // TODO: call DAO update method here
            user.setPassword(newPassword);

            request.setAttribute("success", "Password updated successfully!");
        }

        request.getRequestDispatcher("settings.jsp")
                .forward(request, response);
    }
}