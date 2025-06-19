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

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Orders</title>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      color: black;
    }

    thead th {
      background-color: #007bff;
      color: white; /* 👈 Header text color changed to white */
    }

    th, td {
      padding: 12px;
      text-align: center;
      border: 1px solid #ccc;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    .title {
      color: white;
      text-align: center;
      font-size: 30px;
      margin: 20px 0;
    }
  </style>
</head>
<body>

<div class="title">My Orders <i class='fab fa-elementor'></i></div>

<table border="1">
  <thead>
    <tr>
      <th>S.No</th>
      <th>Product Name</th>
      <th>Category</th>
      <th><i class="fa fa-inr"></i> Price</th>
      <th>Quantity</th>
      <th><i class="fa fa-inr"></i> Sub Total</th>
      <th>Order Date</th>
      <th>Expected Delivery</th>
      <th>Payment Method</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <%
      int sn = 0;
      String query = "SELECT * FROM orders INNER JOIN product ON orders.product_id = product.id WHERE orders.email = ? AND orders.order_date IS NOT NULL";
      try {
          Connection con = DbConnection.connect();
          PreparedStatement st = con.prepareStatement(query);
          st.setString(1, email);
          ResultSet rs = st.executeQuery();

          while (rs.next()) {
              sn++;
    %>
    <tr>
      <td><%= sn %></td>
      <td><%= rs.getString("name") %></td> <!-- product.name -->
      <td><%= rs.getString("category") %></td> <!-- product.category -->
      <td><i class="fa fa-inr"></i> <%= rs.getInt("price") %></td> <!-- orders.price -->
      <td><%= rs.getInt("quantity") %></td>
      <td><i class="fa fa-inr"></i> <%= rs.getInt("total_price") %></td>
      <td><%= rs.getString("order_date") %></td>
      <td><%= rs.getString("delivery_date") %></td>
      <td><%= rs.getString("payment_method") %></td>
      <td><%= rs.getString("status") %></td>
    </tr>
    <%
          }
        } catch (Exception e) {
          out.println("<tr><td colspan='10' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
        }
    %>
  </tbody>
</table>

<br><br><br>
</body>
</html>
