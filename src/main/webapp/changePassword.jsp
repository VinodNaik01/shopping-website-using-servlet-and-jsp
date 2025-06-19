<%@include file="changeDetailsHeader.jsp" %>
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
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>change password</title>
</head>
<body>
<%
String  msg=request.getParameter("msg");
if("noMatch".equals(msg)){
	
%>

<h3 class="alert">New password and Confirm password does not match!</h3>
<%}
if("wrong".equals(msg)){
	

%>

<h3 class="alert">Your old Password is wrong!</h3>
<%}
if("succsess".equals(msg)){
	

%>
<h3 class="alert">Password change successfully!</h3>
<%}
if("error".equals(msg)){
	

%>
<h3 class="alert">Some thing went wrong! Try again!</h3>

<%
}

	

%>
<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
 <input class="input-style" type="text" name="oldPassword" placeholder="Enter Old Password" required>
  
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="text" name="newPassword" placeholder="Enter new Password" required>
  
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="text" name="confirmPassword" placeholder="Enter confirm Password" required>
  
<hr>
 <button class="button" type="submit">change<i class='far fa-arrow-alt-circle-right'></i></button>

</body>
<br><br><br>
</html>