<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<!--Header-->
<br>
<% String email = session.getAttribute("email").toString(); %>

<div class="topnav sticky">

  <!-- Sleek ShopNOW Header -->
<center>
    <h2 style="
      font-family: 'Arial Black', 'Segoe UI', sans-serif;
      font-size: 28px;
      font-weight: bold;
      color: #ffffff;
      background: linear-gradient(135deg, #7f00ff, #e100ff);
      padding: 6px 12px;
      border-radius: 8px;
      letter-spacing: 0.6px;
      text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
      margin-top: 10px;
      margin-bottom: 6px;
      display: inline-block;
    ">
      ShopNOW 
      <span style="
        font-size: 13px;
        font-weight: 600;
        background-color: #ffffff;
        color: #a100ff;
        padding: 3px 8px;
        border-radius: 12px;
        margin-left: 6px;
        text-shadow: none;
      ">(by <strong>Vinod S M</strong>)</span>
    </h2>
  </center>

  <!-- Navigation with blue icons -->
  <h2><a href=""><%= email %> <i class='fa-solid fa-user' style="color: #0084FF;"></i></a></h2>
  <a href="home.jsp">Home <i class="fa-solid fa-building-columns" style="color: #0084FF;"></i></a>
  <a href="myCart.jsp">My Cart <i class="fa-solid fa-cart-arrow-down" style="color: #0084FF;"></i></a>
  <a href="myOrders.jsp">My Orders <i class='fa-brands fa-elementor' style="color: #0084FF;"></i></a>
  <a href="changeDetails.jsp">Change Details <i class="fa-solid fa-pen-to-square" style="color: #0084FF;"></i></a>
  <a href="messageUs.jsp">Message Us <i class='fa-regular fa-comments' style="color: #0084FF;"></i></a>
  <a href="about.jsp">About <i class="fa-regular fa-address-book" style="color: #0084FF;"></i></a>
  <a href="userLogout.jsp">Logout <i class='fa-regular fa-share-from-square' style="color: #0084FF;"></i></a>

  <div class="search-container">
    <form action="searchHome.jsp" method="post">
      <input type="text" name="search" placeholder="search">
      <button type="submit"><i class="fa-solid fa-magnifying-glass" style="color: #0084FF;"></i></button>
    </form>
  </div>

</div>
<br>
<!--table-->
