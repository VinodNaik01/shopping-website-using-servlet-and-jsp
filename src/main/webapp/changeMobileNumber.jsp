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
<title>Change mobile no.</title>
</head>
<body>


<% String msg=request.getParameter("msg");
if("changed".equals(msg)){
	

%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%}
if("wrong".equals(msg)){

%>

<h3 class="alert">Your Password is wrong!</h3>
<%}


%>
<%
try
{
	
Connection con=DbConnection.connect();
PreparedStatement st=con.prepareStatement("select * from user where email=?");
st.setString(1,email);
ResultSet rs=st.executeQuery();
rs.next();


%>
<form action="changingMobileNumber.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="text"  name="phoneNumber" placeholder="Enter Mobile Number" required >
 
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="text" name="password" placeholder="Enter Password" required >
<hr>
  <button class="button" type="submit">
    <i class='far fa-arrow-alt-circle-right'></i> Change
  </button>
  </form>
<%
}
catch(Exception e){
	System.out.println(e);
}
%>

</body>
<br><br><br>
</html>