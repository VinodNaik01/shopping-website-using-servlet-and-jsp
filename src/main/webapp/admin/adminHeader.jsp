<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
    .topnav i {
        color: #0084FF;
    }
</style>

</head>
<!--Header-->
<br>
<div class="topnav sticky">
<% String email=session.getAttribute("email").toString(); %>

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
    <a href="addNewProduct.jsp">Add New Product <i class='fa-solid fa-square-plus'></i></a>
    <a href="allProductEditProduct.jsp">All Products and Edit Products <i class='fa-brands fa-elementor'></i></a>
    <a href="messagesReceived.jsp">Messages Received <i class='fa-solid fa-comment'></i></a>
    <a href="ordersReceived.jsp">Orders Received <i class="fa-solid fa-box-archive"></i></a>
    <a href="cancelledOrders.jsp">Cancelled Orders <i class='fa-solid fa-xmark'></i></a>
    <a href="deliveredOrders.jsp">Delivered Orders <i class='fa-solid fa-dolly'></i></a>
    <a href="logout.jsp">Logout <i class='fa-solid fa-right-from-bracket'></i></a>
</div>
<br>
<!--table-->
