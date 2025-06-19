<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String password=request.getParameter("password");
String mobileNumber=request.getParameter("phoneNumber");



	try
	{
		Connection con=DbConnection.connect();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
		if(rs.next()){
		st.executeUpdate("update user set phoneNumber='"+mobileNumber+"' where email='"+email+"'");
		
		response.sendRedirect("changeMobileNumber.jsp?msg=changed");
		}
		else{
			response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		}
			
			
	}

catch(Exception e){
	System.out.print(e);
	response.sendRedirect("changeMobileNumber.jsp?msg=error");
}

%>