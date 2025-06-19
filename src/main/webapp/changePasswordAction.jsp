<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String changePassword=request.getParameter("confirmPassword");

if(!changePassword.equals(newPassword)){
	response.sendRedirect("changePassword.jsp?msg=noMatch");
}
else{
	int check=0;
	try
	{
		Connection con=DbConnection.connect();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+oldPassword+"'");
		if(rs.next()){
			check=1;
		st.executeUpdate("update user set password='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("changePassword.jsp?msg=succsess");
		}
		
		if(check==0){
			response.sendRedirect("changePassword.jsp?msg=wrong");
			
		}
	}

catch(Exception e){
	System.out.print(e);
	response.sendRedirect("changePassword.jsp?msg=error");
}
}
%>