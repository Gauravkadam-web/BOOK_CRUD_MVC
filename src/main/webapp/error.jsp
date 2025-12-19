<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MVC CRUD APPLICATION - Error</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container min-vh-100 d-flex align-items-center justify-content-center">

    <div class="col-md-8 col-lg-6">

        <!-- Error Card -->
        <div class="card border-0 shadow-lg rounded-4">

            <!-- Header -->
            <div class="card-body text-center p-4">
                <div class="mb-3 text-danger">
                    <i class="bi bi-exclamation-triangle-fill fs-1"></i>
                </div>

                <h3 class="fw-bold text-danger">Something Went Wrong</h3>
                <p class="text-muted mb-3">
                    An unexpected error occurred while processing your request.
                </p>

                <span class="badge bg-danger-subtle text-danger-emphasis px-3 py-2 rounded-pill">
                    MVC CRUD APPLICATION
                </span>
            </div>

            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                Throwable errorCause = (Throwable) request.getAttribute("errorCause");
                Throwable errorException = (Throwable) request.getAttribute("errorException");
            %>

            <!-- Debug Section -->
            <div class="card-footer bg-white border-top-0 px-4 pb-4">

                <div class="accordion" id="errorAccordion">

                    <div class="accordion-item border-0">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed rounded-pill shadow-sm"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#debugInfo">
                                <i class="bi bi-bug-fill me-2 text-danger"></i>
                                View Technical Details
                            </button>
                        </h2>

                        <div id="debugInfo" class="accordion-collapse collapse">
                            <div class="accordion-body mt-3">

                                <div class="alert alert-light border shadow-sm rounded-4">

                                    <p class="fw-semibold mb-1">Message</p>
                                    <pre class="text-danger">
                                        <%= errorMessage != null ? errorMessage : "No message available" %>
                                    </pre>

                                    <%
                                        if (errorCause != null) {
                                    %>
                                        <p class="fw-semibold mb-1">Root Cause</p>
                                        <pre class="text-danger"><%= errorCause %></pre>
                                    <%
                                        } else if (errorException != null) {
                                    %>
                                        <p class="fw-semibold mb-1">Exception</p>
                                        <pre class="text-danger"><%= errorException %></pre>
                                    <%
                                        } else if (exception != null) {
                                    %>
                                        <p class="fw-semibold mb-1">JSP Exception</p>
                                        <pre class="text-danger"><%= exception %></pre>
                                    <%
                                        } else {
                                    %>
                                        <pre class="text-muted">No technical details available</pre>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Action -->
                <div class="text-center mt-4">
                    <a href="students?action=list"
                       class="btn btn-primary rounded-pill px-4 shadow-sm">
                        <i class="bi bi-arrow-left-circle me-1"></i>
                        Go Back
                    </a>
                </div>

            </div>

        </div>

    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
