package com.admin;
import com.util.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		String action=request.getParameter("active");
		String query="update product set name=?, category=?, price=?, active=? where id=?";

		
		
		try
		{
			Connection con =DbConnection.connect();
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setString(1, name);
			ps.setString(2, category);
			ps.setString(3, price);
			ps.setString(4, action);
			ps.setString(5, id);
			ps.executeUpdate();
			if(action.equals("No")) {
			    Statement stmt = con.createStatement();
			    stmt.executeUpdate("DELETE FROM orders WHERE product_id=" + id + " AND address IS NULL");
			}

			response.sendRedirect(request.getContextPath()+"/admin/allProductEditProduct.jsp?msg=yes");
			return;
			
			
		}
		catch(Exception e) {
			System.out.print(e);
			response.sendRedirect(request.getContextPath()+"/admin/allProductEditProduct.jsp?msg=no");
			return;
		}
	}

}
