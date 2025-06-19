<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp"); 
    }
%>

<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">About <i class="fa fa-address-book"></i></div>
<div style="background-color: white; padding:35px; font-size: 30px;">
Vinod S M
<br>
Hey everyone!!
<br>
My name is Vinod S M. Iam a Java FullStack Engineer.<br>
Who has very good understanding on Advanced Java,Servlet,JSP,Jdbc,MySQL,Hibernate,SpringBoot and React.<br>
This website is my side project.Built using Servlet,JSP,Jdbc,mySQL for the Backend and HTML,CSS  for the front end.

<br>

</div>

</body>
</html>