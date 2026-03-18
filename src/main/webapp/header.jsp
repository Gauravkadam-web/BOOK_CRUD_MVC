<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="com.myproject.crudapp.auth.model.Users" %>
<!-- Bootstrap CSS (if not already added) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<%
    Users user = (Users) session.getAttribute("user");
%>

<style>
.app-header {
    padding: 18px 40px;
    background: transparent;   /* REMOVE WHITE STRIP */
}

/* Align content properly */
.app-header .header-inner {
    display: flex;
    justify-content: flex-end;
    align-items: center;
}

/* Welcome text */
.app-header .welcome-text {
    font-size: 14px;
    color: rgba(0,0,0,0.6);
    margin-right: 15px;
}

/* Logout button */
.app-header .logout-btn {
    border-radius: 20px;
    padding: 6px 16px;
    font-size: 13px;
    transition: 0.2s ease;
}

.app-header .logout-btn:hover {
    background-color: #212529;
    color: #fff;
}
</style>

<div class="app-header">
    <div class="header-inner">

        <span class="welcome-text">
            <i class="bi bi-person-circle me-1"></i>
            <% if (user != null) { %>
                Welcome, <b><%= user.getUsername() %></b>
            <% } else { %>
                Logged In
            <% } %>
        </span>

<!-- Settings Icon -->
        <a href="settings"
            class="btn btn-sm btn-light rounded-circle me-2 shadow-sm"
            title="Settings">
            <i class="bi bi-gear-fill"></i>
        </a>

        <a href="auth?action=logout"
           class="btn btn-sm btn-outline-dark logout-btn">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</div>