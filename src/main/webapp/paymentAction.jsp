<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String mobileNumber = request.getParameter("mobileNumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId = request.getParameter("transactionId");
String status = "bill";

try {
    Connection con = DbConnection.connect();

    // Update user address and mobile
    PreparedStatement pt = con.prepareStatement("UPDATE user SET address = ?, phoneNumber = ? WHERE email = ?");
    pt.setString(1, address);
    pt.setString(2, mobileNumber);
    pt.setString(3, email);
    pt.executeUpdate();

    // Update orders
    PreparedStatement ps = con.prepareStatement(
        "UPDATE orders SET address = ?, mobile_number = ?, order_date = NOW(), delivery_date = DATE_ADD(order_date, INTERVAL 7 DAY), payment_method = ?, status = ?, transaction_id = ? WHERE email = ? AND address IS NULL"
    );
    ps.setString(1, address);
    ps.setString(2, mobileNumber);
    ps.setString(3, paymentMethod);
    ps.setString(4, status);
    ps.setString(5, transactionId);
    ps.setString(6, email); // Correct email placement
    ps.executeUpdate();

    response.sendRedirect("bill.jsp");
} catch(Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
}
%>
