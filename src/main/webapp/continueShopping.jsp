<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String status="processing";
try
{
	Connection con=DbConnection.connect();
	PreparedStatement st=con.prepareStatement("update orders set status=? where email=? and status='bill'");
	st.setString(1,status);
	st.setString(2, email);
	st.executeUpdate();
	response.sendRedirect("home.jsp");
	
}
catch(Exception e){
	System.out.print(e);
}
%>