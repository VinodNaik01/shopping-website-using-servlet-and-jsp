<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>

<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp"); 
    }
%>

<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%

String msg=request.getParameter("msg");
if("sent".equals(msg)){
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%
}
if("wrong".equals(msg)){
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%
}

%>
<form action="sendMessage.jsp" method="post">
<input class="input-style" type="text" name="message" placeholder="subject" required> 
<hr>
<textarea class="input-style" name="body" placeholder="enter your Message" required ></textarea>

<hr>
<button class="button" type="submit">send<i class="far fa-arrow-alt-circle_right"></i></button>
</form>
<br><br><br>
</body>
</html>