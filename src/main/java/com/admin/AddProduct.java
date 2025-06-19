package com.admin;

import com.util.DbConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddProduct() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String active = request.getParameter("active");
        String price = request.getParameter("price");

        String query = "insert into product values(?,?,?,?,?)";

        try {
            Connection con = DbConnection.connect();
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, id);
            st.setString(2, name);
            st.setString(3, category);
            st.setString(4, price);
            st.setString(5, active);
            st.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/admin/addNewProduct.jsp?msg=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/addNewProduct.jsp?msg=fail");
        }
    }
}
