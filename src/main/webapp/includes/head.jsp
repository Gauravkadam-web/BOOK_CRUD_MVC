<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>

/* ================= GENERAL ================= */

body {
    background-color: #f8fafc;
    overflow-x: hidden;
}

.auth-wrapper {
    min-height: 100vh;
}

/* ================= LEFT PANEL ================= */

.auth-left {
    background: linear-gradient(135deg, #0d6efd, #0a58ca);
    position: relative;
    overflow: hidden;
}

/* Floating Shapes */
.shape {
    position: absolute;
    border-radius: 50%;
    background: #ffffff;
    opacity: 0.08;
    animation: floatShape 12s infinite ease-in-out alternate;
}

.shape1 {
    width: 220px;
    height: 220px;
    top: -60px;
    left: -60px;
}

.shape2 {
    width: 160px;
    height: 160px;
    bottom: 40px;
    right: -40px;
    animation-duration: 15s;
}

.shape3 {
    width: 120px;
    height: 120px;
    top: 50%;
    left: 65%;
    animation-duration: 18s;
}

@keyframes floatShape {
    from { transform: translateY(0px) rotate(0deg); }
    to { transform: translateY(40px) rotate(20deg); }
}

/* Floating Book Animation */
.floating-book {
    font-size: 70px;
    animation: floatBook 4s ease-in-out infinite;
}

@keyframes floatBook {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-12px); }
    100% { transform: translateY(0px); }
}

/* ================= RIGHT CARD ================= */

.auth-card {
    border-radius: 18px;
}

.form-control:focus {
    box-shadow: none;
    border-color: #0d6efd;
}

/* Feedback Pills */
.feedback {
    border-radius: 999px;
    padding: .5rem 1rem;
    font-size: .85rem;
}

.feedback-error {
    background: #fee2e2;
    color: #991b1b;
}

.feedback-success {
    background: #dcfce7;
    color: #166534;
}

/* Slide-in Animation */
.fade-slide {
    opacity: 0;
    transform: translateX(40px);
    animation: slideIn 0.8s ease forwards;
}

@keyframes slideIn {
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

/* Hide left panel on mobile */
@media (max-width: 991px) {
    .auth-left {
        display: none !important;
    }
}

</style>