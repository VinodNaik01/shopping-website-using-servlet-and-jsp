<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp"); 
    }
%>


<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp"); 
    }
%>

<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
  <link rel="stylesheet" href="css/changeDetails.css">
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <title>Address</title>
</head>
<body>

<% 
  String msg = request.getParameter("msg");
  if ("updated".equals(msg)) {
%>
    <h3 class="alert">Address Successfully Updated!</h3>
<%
  } else if ("error".equals(msg)) {
%>
    <h3 class="alert">Something went wrong! Try again!</h3>
<%
  }

  
  String query = "SELECT * FROM user WHERE email=?";
  try {
    Connection con = DbConnection.connect();
    PreparedStatement st = con.prepareStatement(query);
    st.setString(1, email);
    ResultSet rs = st.executeQuery();
    
    if (rs.next()) {
%>

<form action="changeAddress.jsp" method="post">
  <h3>Enter Address</h3>
  <input class="input-style" type="text" name="address" value="<%= rs.getString("address") %>" required>
  <hr>
  <button class="button" type="submit">
    <i class='far fa-arrow-alt-circle-right'></i> Change
  </button>
</form>

<%
    }
  } catch (Exception e) {
    out.println("<h3 class='alert'>Database Error: " + e.getMessage() + "</h3>");
  }
%>

</body>
<br><br><br>
</html>
