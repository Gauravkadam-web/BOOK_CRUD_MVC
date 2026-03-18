package com.myproject.crudapp.auth.controller;

import com.myproject.crudapp.auth.dao.UserDAO;
import com.myproject.crudapp.auth.dao.UserDAOImpl;
import com.myproject.crudapp.auth.model.Users;
import com.myproject.crudapp.exception.BookDAOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/auth", "/"})
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO = null;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if (action == null) action = "login";
            switch (action) {
                case "register":    showRegisterPage(req, resp);  break;
                case "doRegister":  registerUser(req, resp);      break;
                case "doLogin":     loginUser(req, resp);         break;
                case "logout":      logoutUser(req, resp);        break;
                default:            showLoginPage(req, resp);
            }
        } catch (BookDAOException e) {
            req.setAttribute("errorMessage", e.getMessage());
            req.setAttribute("errorCause", e.getCause());
            req.setAttribute("errorException", e);
            e.printStackTrace();
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }

    private void logoutUser(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) session.invalidate();
        resp.sendRedirect("auth");
    }

    private void loginUser(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Users user = userDAO.login(username, password);
        if (user == null) {
            req.setAttribute("error", "Invalid Credentials");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // ✅ FIX #2: Session Fixation — invalidate old session, create a new one
        HttpSession oldSession = req.getSession(false);
        if (oldSession != null) oldSession.invalidate();
        HttpSession newSession = req.getSession(true);
        newSession.setAttribute("user", user);

        resp.sendRedirect("book");
    }

    private void registerUser(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name     = req.getParameter("name");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (userDAO.exists(username)) {
            req.setAttribute("error", "User Already Exists");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // Password hashing is handled inside UserDAOImpl.register()
        Users user = new Users(name, username, password);
        userDAO.register(user);
        resp.sendRedirect("auth?success=Registration Successful");
    }

    private void showLoginPage(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    private void showRegisterPage(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }
}