<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%  
String email=request.getParameter("email");
String id=request.getParameter("id");

try
{
	Connection con=DbConnection.connect();
	PreparedStatement st=con.prepareStatement("update orders set status=? where product_id=? and email=?");
	st.setString(1,"delivered");
	st.setString(2,id);
	st.setString(3,email);
	st.executeUpdate();
	System.out.println("hit");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
	System.out.println("bit");

	
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
%>