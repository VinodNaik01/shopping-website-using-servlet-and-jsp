<%
    // Prevent back navigation to cached pages
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Invalidate the session
    session.invalidate();

    // Redirect to login
    response.sendRedirect("../login.jsp");
%>
