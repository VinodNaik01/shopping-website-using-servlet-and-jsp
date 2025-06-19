<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
i {
  color: #0084FF;
}



</style>

</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
            <center><h2>Change Details<i class="fa fa-edit"></i></h2></center>
             <%String email=session.getAttribute("email").toString(); %>
            <h2><a href="home.jsp"><i class="fa-solid fa-arrow-circle-left"></i> Back</a></h2>
             <h2><a href=""><%=email %> <i class="fa-solid fa-user"></i></a></h2>
            <a href="changePassword.jsp">Change Password <i class="fa-solid fa-key"></i></a>
            <a href="addChangeAddress.jsp">Add or change Address <i class="fa-solid fa-map-marker-alt"></i></a>
            <a href="changeMobileNumber.jsp">Change Mobile Number <i class="fa-solid fa-phone"></i></a>
          </div>
           <br>
           <!--table-->
