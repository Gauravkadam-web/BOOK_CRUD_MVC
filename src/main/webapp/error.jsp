
<%@page isErrorPage="true"%>
<html>
    <head>
        <title>MVC CRUD APPLICATION</title>

    </head>
    <body >
        <h2 >Something Wrong Happened!</h2>
        <h5 >Encountered some issue processing request</h5>

        <%
            String errorMessage = (String)request.getAttribute("errorMessage");
            Throwable errorCause = (Throwable)request.getAttribute("errorCause");
            exception = (Throwable)request.getAttribute("errorException");
        %>
        <div >
            <div >
                <p><strong>Message</strong></p>
                <pre><%= (errorMessage !=null ? errorMessage : "")%></pre>

                <%
                    if(errorCause != null){
                %>
                        <p><strong>Root Cause</strong></p>
                        <pre><%= errorCause%></pre>
                <%
                    } else if(exception != null) {
                %>
                        <p><strong>Main Exception</strong></p>
                        <pre><%= exception%></pre>
                <%
                    } else {
                %>
                        <pre>No Technical Error Found</pre>
                <%
                    }
                %>

                <a href="book?action=list" >Go Back</a>
            </div>
        </div>
    </body>
</html>