<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>
    <jsp:include page="includes/head.jsp"/>

    <style>
        /* ===== FULL PAGE BLUE GRADIENT ===== */
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0d6efd, #0a58ca);
            overflow-x: hidden;
        }

        /* ===== GLOBAL FLOATING SHAPES ===== */
        .shape {
            position: fixed;
            border-radius: 50%;
            opacity: 0.15;
            z-index: 0;
            animation: floatShape 14s infinite ease-in-out alternate;
        }

        .shape1 { width: 300px; height: 300px; background: #fff; top: -80px; left: -80px; }
        .shape2 { width: 200px; height: 200px; background: #fff; bottom: 60px; right: -60px; animation-duration: 18s; }
        .shape3 { width: 150px; height: 150px; background: #fff; top: 40%; left: 55%; animation-duration: 20s; }

        @keyframes floatShape {
            from { transform: translateY(0px) rotate(0deg); }
            to { transform: translateY(50px) rotate(25deg); }
        }

        /* ===== FLOATING BOOK ICON ===== */
        .floating-book {
            font-size: 70px;
            color: white;
            animation: floatBook 4s ease-in-out infinite;
        }

        @keyframes floatBook {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-12px); }
            100% { transform: translateY(0px); }
        }

        /* ===== SLIDE ANIMATION ===== */
        .fade-slide {
            animation: slideIn 0.8s ease forwards;
            opacity: 0;
            transform: translateX(40px);
        }

        @keyframes slideIn {
            to { opacity: 1; transform: translateX(0); }
        }

        .auth-card {
            border-radius: 20px;
            transition: 0.3s ease;
            position: relative;
            z-index: 1;
        }

        .auth-card:hover {
            transform: translateY(-3px);
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #0d6efd;
        }

        .feedback {
            font-size: 0.9rem;
            padding: 8px;
            border-radius: 10px;
        }

        .feedback-error {
            background: #f8d7da;
            color: #842029;
        }

        .feedback-success {
            background: #d1e7ff;
            color: #084298;
        }

        .auth-left, .auth-right {
            position: relative;
            z-index: 1;
            background: transparent;
        }

        @media (max-width: 991px) {
            .auth-left { display: none; }
        }
    </style>
</head>

<body>

<!-- GLOBAL SHAPES (Seamless Animation) -->
<div class="shape shape1"></div>
<div class="shape shape2"></div>
<div class="shape shape3"></div>

<%
    String error = (String) request.getAttribute("error");
    String msg = request.getParameter("success");
%>

<div class="container-fluid auth-wrapper">
    <div class="row min-vh-100">

        <!-- LEFT PANEL -->
        <div class="col-lg-6 d-none d-lg-flex auth-left align-items-center justify-content-center p-5 text-white text-center">

            <div>
                <div class="floating-book mb-4">
                    <i class="bi bi-book-half"></i>
                </div>

                <h2 class="fw-bold mb-3">
                    <i class="bi bi-person-plus-fill me-2"></i>
                    Create Your Account
                </h2>

                <p class="lead">
                    <i class="bi bi-journal-bookmark me-2"></i>
                    Join the Book Portal and start managing efficiently.
                </p>
            </div>
        </div>

        <!-- RIGHT PANEL -->
        <div class="col-12 col-lg-6 d-flex align-items-center justify-content-center p-4 auth-right">

            <div class="card auth-card shadow-lg p-5 fade-slide w-100" style="max-width: 420px;">

                <!-- Header -->
                <div class="text-center mb-4">
                    <i class="bi bi-person-plus-fill fs-1 text-success"></i>
                    <h5 class="fw-bold mt-2">
                        <i class="bi bi-pencil-square me-1"></i>
                        Register
                    </h5>
                </div>

                <!-- Error -->
                <% if (error != null) { %>
                    <div class="feedback feedback-error text-center mb-3">
                        <i class="bi bi-exclamation-circle me-1"></i>
                        <%= error %>
                    </div>
                <% } %>

                <!-- Success -->
                <% if (msg != null) { %>
                    <div class="feedback feedback-success text-center mb-3">
                        <i class="bi bi-check-circle me-1"></i>
                        <%= msg %>
                    </div>
                <% } %>

                <!-- Form -->
                <form action="auth?action=doRegister" method="POST">

                    <div class="form-floating mb-3">
                        <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                        <label><i class="bi bi-person-badge me-1"></i>Full Name</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" name="username" class="form-control" placeholder="Username" required>
                        <label><i class="bi bi-person me-1"></i>Username</label>
                    </div>

                    <div class="form-floating mb-4">
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                        <label><i class="bi bi-lock me-1"></i>Password</label>
                    </div>

                    <button class="btn btn-success w-100 py-2 fw-semibold">
                        <i class="bi bi-check-circle me-1"></i>
                        Register
                    </button>
                </form>

                <div class="text-center mt-4 small">
                    <span class="text-muted">
                        <i class="bi bi-box-arrow-in-right me-1"></i>
                        Already have an account?
                    </span>
                    <a href="auth" class="fw-semibold text-decoration-none ms-1 text-primary">
                        Login
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/scripts.jsp"/>
</body>
</html>