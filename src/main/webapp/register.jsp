<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8fafc;
            background-image:
                radial-gradient(circle at 1px 1px, #e5e7eb 1px, transparent 0);
            background-size: 20px 20px;
            min-height: 100vh;
            font-family: "Inter", system-ui, -apple-system, sans-serif;
        }

        .register-card {
            border-radius: 18px;
            background: rgba(255, 255, 255, 0.96);
            backdrop-filter: blur(10px);
        }

        .feedback {
            border-radius: 999px;
            padding: .45rem .9rem;
            font-size: .8rem;
            display: inline-flex;
            align-items: center;
            gap: .4rem;
        }

        .feedback-error {
            background: #fee2e2;
            color: #991b1b;
        }

        .feedback-success {
            background: #dcfce7;
            color: #166534;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #22c55e;
        }

        .btn-success {
            background: linear-gradient(135deg, #22c55e, #16a34a);
            border: none;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center">

<%
    String error = (String) request.getAttribute("error");
    String msg = request.getParameter("success");
%>

<div class="col-md-4 col-lg-3">
    <div class="card register-card border-0 shadow-lg">
        <div class="card-body p-4">

            <!-- Header -->
            <div class="text-center mb-3">
                <i class="bi bi-person-plus-fill fs-1 text-success"></i>
                <h5 class="fw-bold mt-2">Create Account</h5>
                <small class="text-muted">
                    <i class="bi bi-book me-1"></i>
                    Join the Book Portal
                </small>
            </div>

            <!-- Centered Feedback -->
            <div class="text-center mb-3">

                <% if (error != null) { %>
                    <div class="feedback feedback-error">
                        <i class="bi bi-exclamation-circle"></i>
                        <%= error %>
                    </div>
                <% } %>

                <% if (msg != null) { %>
                    <div class="feedback feedback-success">
                        <i class="bi bi-check-circle"></i>
                        <%= msg %>
                    </div>
                <% } %>

            </div>

            <!-- Register Form -->
            <form action="auth?action=doRegister" method="POST">

                <!-- Full Name -->
                <div class="form-floating mb-3">
                    <input type="text" name="name" class="form-control"
                           id="name" placeholder="Full Name" required>
                    <label for="name">
                        <i class="bi bi-person-badge me-1"></i>
                        Full Name
                    </label>
                </div>

                <!-- Username -->
                <div class="form-floating mb-3">
                    <input type="text" name="username" class="form-control"
                           id="username" placeholder="Username" required>
                    <label for="username">
                        <i class="bi bi-person me-1"></i>
                        Username
                    </label>
                </div>

                <!-- Password -->
                <div class="form-floating mb-3">
                    <input type="password" name="password" class="form-control"
                           id="password" placeholder="Password" required>
                    <label for="password">
                        <i class="bi bi-lock me-1"></i>
                        Password
                    </label>
                </div>

                <!-- Button -->
                <button class="btn btn-success w-100 fw-semibold">
                    <i class="bi bi-check-circle me-1"></i>
                    Register
                </button>

            </form>

            <!-- Login -->
            <div class="text-center mt-4 small">
                <span class="text-muted">Already have an account?</span>
                <a href="auth" class="fw-semibold text-decoration-none">
                    <i class="bi bi-box-arrow-in-right me-1"></i>
                    Login
                </a>
            </div>

        </div>
    </div>
</div>

</body>
</html>
