<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="com.myproject.crudapp.auth.model.Users" %>

<%
    Users user = (Users) session.getAttribute("user");
%>

<div class="container-fluid py-3">
    <div class="d-flex align-items-center justify-content-between">

        <!-- Left -->
        <div class="d-flex align-items-center">
            <i class="bi bi-mortarboard-fill text-primary fs-4 me-2"></i>
            <span class="fs-5 fw-semibold text-dark"></span>
        </div>

        <!-- Right -->
        <div class="d-flex align-items-center">
            <span class="text-muted me-3">
                <i class="bi bi-person-circle me-1"></i>
                <% if (user != null) { %>
                    Welcome, <b class="text-dark"><%= user.getUsername() %></b>
                <% } else { %>
                    Logged In
                <% } %>
            </span>

            <a href="auth?action=logout"
               class="btn btn-sm btn-outline-secondary">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>

    </div>
</div>
