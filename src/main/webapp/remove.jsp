<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");

try
{
	Connection con=DbConnection.connect();
	Statement st=con.createStatement();
	st.executeUpdate("delete from orders where email='"+email+"' and product_id='"+id+"' and address is NULL");
	response.sendRedirect("myCart.jsp?msg=remove");
	
	
}
catch(Exception e){
	System.out.print(e);
}
%>