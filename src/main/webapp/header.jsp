<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="com.myproject.crudapp.auth.model.Users" %>

<%
    Users user = (Users) session.getAttribute("user");
%>

<div class="app-header">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between py-3">

            <!-- Left -->
            <div>
                <span class="fs-5 fw-semibold header-title">

                </span>
            </div>

            <!-- Right -->
            <div class="d-flex align-items-center">
                <span class="me-3 header-text">
                    <i class="bi bi-person-circle me-1"></i>
                    <% if (user != null) { %>
                        Welcome, <b><%= user.getUsername() %></b>
                    <% } else { %>
                        Logged In
                    <% } %>
                </span>

                <a href="auth?action=logout"
                   class="btn btn-sm logout-btn">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>

        </div>
    </div>
</div>

<style>

/* Sticky but seamless */
.app-header {
    position: sticky;
    top: 0;
    z-index: 1000;

    /* Very subtle fade to improve readability */
    background: linear-gradient(
        to bottom,
        rgba(255,255,255,0.35),
        rgba(255,255,255,0.15),
        transparent
    );
}

/* Black text */
.header-title,
.header-text {
    color: #000;
}

/* Logout button minimal */
.logout-btn {
    color: #000;
    background: transparent;
    border: none;
    transition: 0.3s ease;
}

.logout-btn:hover {
    background: #000;
    color: #fff;
    border-radius: 20px;
    padding: 4px 10px;
}

</style>