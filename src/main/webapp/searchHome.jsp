<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th><i class="fa fa-inr"></i> Price</th>
        <th>Add to cart <i class='fas fa-cart-plus'></i></th>
      </tr>
    </thead>
    <tbody>

<%
String search = request.getParameter("search");
String query = "SELECT * FROM product WHERE (name LIKE ? OR category LIKE ?) AND active = 'yes'";
int check = 0;
try {
    Connection con = DbConnection.connect();
    PreparedStatement st = con.prepareStatement(query);
    
    // Set wildcards in the parameter values
    st.setString(1, "%" + search + "%");
    st.setString(2, "%" + search + "%");

    ResultSet rs = st.executeQuery();
    while (rs.next()) {
        check = 1;
%>
      <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
        <td><a href="addToCart.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
      </tr>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
    </tbody>
</table>

<% if (check == 0) { %>
    <h1 style="color:white; text-align: center;">Nothing to show</h1>
<% } %>

<br><br><br>
<div class="footer">
    <p>All rights reserved @Vinod S M</p>
</div>

</body>
</html>
