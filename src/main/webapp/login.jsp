<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <!-- IMPORTANT for Mobile Responsiveness -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

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

        .login-card {
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
            border-color: #6366f1;
        }

        .btn-primary {
            background: linear-gradient(135deg, #6366f1, #4f46e5);
            border: none;
        }

        /* Extra small screen adjustments */
        @media (max-width: 576px) {
            .login-card {
                border-radius: 12px;
            }
        }
    </style>
</head>

<body>

<%
    String error = (String) request.getAttribute("error");
    String msg = request.getParameter("success");
%>

<!-- Responsive Container -->
<div class="container min-vh-100 d-flex align-items-center justify-content-center">

    <div class="row w-100 justify-content-center">

        <!-- Responsive column sizes -->
        <div class="col-12 col-sm-10 col-md-6 col-lg-4 col-xl-3">

            <div class="card login-card border-0 shadow-lg">
                <div class="card-body p-4 p-md-5">

                    <!-- Header -->
                    <div class="text-center mb-4">
                        <i class="bi bi-person-circle fs-1 text-primary"></i>
                        <h5 class="fw-bold mt-2">Welcome Back</h5>
                        <small class="text-muted">
                            <i class="bi bi-shield-lock me-1"></i>
                            Sign in to continue
                        </small>
                    </div>

                    <!-- Feedback Section -->
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

                    <!-- Login Form -->
                    <form action="auth?action=doLogin" method="POST">

                        <div class="form-floating mb-3">
                            <input type="text" name="username" class="form-control"
                                   id="username" placeholder="Username" required>
                            <label for="username">
                                <i class="bi bi-person me-1"></i>
                                Username
                            </label>
                        </div>

                        <div class="form-floating mb-4">
                            <input type="password" name="password" class="form-control"
                                   id="password" placeholder="Password" required>
                            <label for="password">
                                <i class="bi bi-lock me-1"></i>
                                Password
                            </label>
                        </div>

                        <button class="btn btn-primary w-100 fw-semibold py-2">
                            <i class="bi bi-box-arrow-in-right me-1"></i>
                            Login
                        </button>
                    </form>

                    <!-- Register -->
                    <div class="text-center mt-4 small">
                        <span class="text-muted">Dont have an account?</span>
                        <a href="auth?action=register"
                           class="fw-semibold text-decoration-none">
                            <i class="bi bi-person-plus me-1"></i>
                            Register
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>