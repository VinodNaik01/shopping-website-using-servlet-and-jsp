<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String subject=request.getParameter("message");
String body=request.getParameter("body");


try
{
	
	Connection con=DbConnection.connect();
	PreparedStatement st=con.prepareStatement("insert into message (subject,message,email) values(?,?,?)");
	st.setString(1,subject);
	st.setString(2,body);
	st.setString(3,email);
	st.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=sent");
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("messageUs.jsp?msg=wrong");
	
}



%>