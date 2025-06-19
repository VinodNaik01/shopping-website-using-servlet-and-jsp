<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp"); 
    }
%>

<%@ page import="com.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %> <!-- Ensure session is enabled -->
<%

String email=session.getAttribute("email").toString();

    String id = request.getParameter("id");
    int quantity = 1;
    int price = 0;
    int total_price = 0;

    boolean check = false;

    try {
        Connection con = DbConnection.connect();

        // Step 1: Get product details
        PreparedStatement st = con.prepareStatement("SELECT * FROM product WHERE id=?");
        st.setString(1, id);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            price = rs.getInt(4); // You can use rs.getInt("price") if your column name is 'price'
            total_price = price;
        }

        // Step 2: Check if the product is already in cart
        PreparedStatement st1 = con.prepareStatement("SELECT * FROM orders WHERE product_id=? AND email=? AND address IS NULL");
        st1.setString(1, id);
        st1.setString(2, email);
        ResultSet rs1 = st1.executeQuery();

        if (rs1.next()) {
            total_price = rs1.getInt("total_price") + price;
            quantity = rs1.getInt("quantity") + 1;
            check = true;
        }

        if (check) {
            // Update existing order
            String query = "UPDATE orders SET total_price=?, quantity=? WHERE product_id=? AND email=? AND address IS NULL";
            PreparedStatement st2 = con.prepareStatement(query);
            st2.setInt(1, total_price);
            st2.setInt(2, quantity);
            st2.setString(3, id);
            st2.setString(4, email);
            int rows = st2.executeUpdate();
            response.sendRedirect("home.jsp?msg=exist");
        } else {
            // Insert new order
            PreparedStatement ps3 = con.prepareStatement("INSERT INTO orders (email, product_id, quantity, total_price, price) VALUES (?, ?, ?, ?, ?)");
            ps3.setString(1, email);
            ps3.setString(2, id);
            ps3.setInt(3, quantity);
            ps3.setInt(4, total_price);
            ps3.setInt(5, price);
            ps3.executeUpdate();
            response.sendRedirect("home.jsp?msg=success");
        }

    } catch (Exception e) {
        System.out.println("Error: " + e);
        response.sendRedirect("home.jsp?msg=error");
    }
%>
