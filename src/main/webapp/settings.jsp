<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="com.myproject.crudapp.auth.model.Users" %>

<%
    Users user = (Users) session.getAttribute("user");
%>

<style>
.settings-wrapper {
    min-height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.settings-card {
    width: 100%;
    max-width: 500px;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.08);
    background: #ffffff;
}

.settings-title {
    font-weight: 600;
    margin-bottom: 25px;
}

.form-control {
    border-radius: 12px;
    padding: 12px;
}

.btn-modern {
    border-radius: 25px;
    padding: 10px;
}

.back-link {
    text-decoration: none;
    font-size: 14px;
    color: #6c757d;
}

.back-link:hover {
    color: #000;
}
</style>

<div class="settings-wrapper">

    <div class="settings-card">

        <!-- Back Button -->
        <a href="book" class="back-link">
            <i class="bi bi-arrow-left"></i> Back
        </a>

        <h4 class="settings-title mt-3">
            <i class="bi bi-gear"></i> Account Settings
        </h4>

        <!-- User Info -->
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text"
                   class="form-control"
                   value="<%= user.getUsername() %>"
                   disabled>
        </div>

        <!-- Password Form -->
        <form action="settings" method="post">

            <div class="mb-3">
                <label class="form-label">Current Password</label>
                <input type="password"
                       name="currentPassword"
                       class="form-control"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">New Password</label>
                <input type="password"
                       name="newPassword"
                       class="form-control"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Confirm New Password</label>
                <input type="password"
                       name="confirmPassword"
                       class="form-control"
                       required>
            </div>

            <button type="submit"
                    class="btn btn-dark w-100 btn-modern">
                Update Password
            </button>

        </form>

        <!-- Success / Error Messages -->
        <%
            if (request.getAttribute("success") != null) {
        %>
            <div class="alert alert-success mt-3">
                <%= request.getAttribute("success") %>
            </div>
        <%
            }
            if (request.getAttribute("error") != null) {
        %>
            <div class="alert alert-danger mt-3">
                <%= request.getAttribute("error") %>
            </div>
        <%
            }
        %>

    </div>

</div>