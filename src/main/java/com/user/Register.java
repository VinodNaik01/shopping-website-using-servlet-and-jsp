package com.user;
import com.util.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Register
 */
@WebServlet("/signup")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobileNumber=request.getParameter("mobileNumber");
		String password=request.getParameter("password");
		String address="";
		String query="INSERT INTO user (name, email, password, phoneNumber, address) VALUES (?, ?, ?, ?, ?)";
		
		try
		{
			Connection con=DbConnection.connect();
			System.out.print("connected");
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1,name);
			st.setString(2,email);
			st.setString(3,password);
			st.setString(4,mobileNumber);
			st.setString(5,address);
			
			st.executeUpdate();
			response.sendRedirect("signup.jsp?msg=updated");
			return;
		}
		catch(Exception e) {
			System.out.print(e);
			response.sendRedirect("signup.jsp?msg=notUpdated");
			return;
		}
		
		
	}

}
