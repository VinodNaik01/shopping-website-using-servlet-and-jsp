<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("../login.jsp"); 
    }
%>

<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>welcome</title>
<style>
h1
{
color: white;
text-align: center;
font-size: 100px;
}</style>
</head>
<body>
<h1>welcome admin!</h1>
</body>
</html>