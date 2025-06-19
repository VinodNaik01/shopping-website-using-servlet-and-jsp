package com.user;
import java.sql.*;
import com.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		String query="select* from user where email=? and password=?";
		
		HttpSession session=request.getSession();
		if("admin@gmail.com".equals(email) && "admin".equals(password)){
			session.setAttribute("email",email);
			response.sendRedirect("admin/adminHome.jsp");
			return;
			
		}
		
		try
		{
			Connection con=DbConnection.connect();
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1,email);
			st.setString(2,password);
			ResultSet rs=st.executeQuery();
			
			if(rs.next()) {
				session.setAttribute("email", email);
				response.sendRedirect("home.jsp");
				return;
			}
			else {
				response.sendRedirect("login.jsp?msg=notExist");
				return;
			}
		}
		catch(Exception e) {
			System.out.println(e);
			response.sendRedirect("login.jsp?msg=invalid");
			return;
		}
		
		
}
}
