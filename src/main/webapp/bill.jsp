<%@include file="footer.jsp" %>
<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>

<%
String email = session.getAttribute("email").toString();
try {
    int total = 0;
    int sn = 0;
    Connection con = DbConnection.connect();
    Statement st = con.createStatement();

    ResultSet rsTotal = st.executeQuery("select sum(total_price) from orders where email='" + email + "' and status='bill'");
    if (rsTotal.next()) {
        total = rsTotal.getInt(1);
    }

    String sql = "SELECT " +
        "user.name, user.email, user.phoneNumber, user.address AS user_address, " +
        "orders.product_id, orders.quantity, orders.price, orders.total_price, " +
        "orders.address AS order_address, orders.mobile_number, orders.order_date, " +
        "orders.delivery_date, orders.payment_method, orders.transaction_id, orders.status " +
        "FROM user " +
        "INNER JOIN orders ON user.email = orders.email " +
        "WHERE orders.email = '" + email + "' AND orders.status = 'bill'";

    ResultSet rss = st.executeQuery(sql);
    while (rss.next()) {
%>

<h3>ShopNOW  Bill (Vinod S M)</h3>
<hr>
<div class="left-div"><h3>Name: <%=rss.getString("name") %></h3></div>
<div class="right-div-right"><h3>Email: <%out.println(email); %></h3></div>
<div class="right-div"><h3>Mobile Number: <%=rss.getString("phoneNumber") %></h3></div>  

<div class="left-div"><h3>Order Date: <%=rss.getString("order_date") %></h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rss.getString("payment_method") %></h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rss.getString("delivery_date") %></h3></div> 

<div class="left-div"><h3>Transaction ID: <%=rss.getString("transaction_id") %></h3></div>
<div class="right-div-right"><h3>City: </h3></div> 
<div class="right-div"><h3>Address: <%=rss.getString("user_address") %></h3></div> 

<div class="left-div"><h3>State: </h3></div>
<div class="right-div-right"><h3>Country: </h3></div>  

<hr>
<%
    }
%>

<table id="customers">
<h3>Product Details</h3>
<tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Sub Total</th>
</tr>

<%
    ResultSet ss = st.executeQuery(
        "SELECT * FROM product INNER JOIN orders ON product.id = orders.product_id " +
        "WHERE orders.email='" + email + "' AND orders.status='bill'");

    while (ss.next()) {
        sn++;
%>
<tr>
    <td><%= sn %></td>
    <td><%= ss.getString("name") %></td>
    <td><%= ss.getString("category") %></td>
    <td><i class="fa fa-inr"></i> <%= ss.getString("price") %></td>
    <td><%= ss.getString("quantity") %></td>
    <td><i class="fa fa-inr"></i> <%= ss.getString("total_price") %></td>
</tr>
<%
    }
%>
</table>

<h3>Total: <%= total %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>

<%
} catch (Exception e) {
    out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
    e.printStackTrace();
}
%>

</body>
</html>
