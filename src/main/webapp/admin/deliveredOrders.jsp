<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("../login.jsp"); 
    }
%>
<%@include file="adminHeader.jsp" %>
<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%@include file="../footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../css/ordersReceived-style.css">
  <title>Delivered Orders</title>
  <style>
    .th-style {
      width: 25%;
    }
  </style>
</head>
<body>



<table id="customers">
  <tr>
    <th>Mobile Number</th>
    <th>Product Name</th>
    <th>Quantity</th>
    <th><i class="fa fa-inr"></i> Sub Total</th>
    <th>Address</th>
    <th>Order Date</th>
    <th>Expected Delivery Date</th>
    <th>Payment Method</th>
    <th>T-ID</th>
    <th>Status</th>
    
  </tr>

<%
try {
    Connection con = DbConnection.connect();
    PreparedStatement st = con.prepareStatement("SELECT * FROM orders INNER JOIN product where orders.product_id = product.id and orders.order_date is not null and orders.status='delivered'");
    ResultSet rs = st.executeQuery();

    while (rs.next()) {
%>
  <tr>
    <td><%= rs.getLong("mobile_number") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getInt("quantity") %></td>
    <td><i class="fa fa-inr"></i> <%= rs.getInt("total_price") %></td>
    <td><%= rs.getString("address") %></td>
    <td><%= rs.getString("order_date") %></td>
    <td><%= rs.getString("delivery_date") %></td>
    <td><%= rs.getString("payment_method") %></td>
    <td><%= rs.getString("transaction_id") %></td>
    <td><%= rs.getString("status") %></td>
    </tr>
<%
    }
} catch (Exception e) {
    out.println("<tr><td colspan='12' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
}
%>

</table>

<br><br><br>
</body>
</html>
