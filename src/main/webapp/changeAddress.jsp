<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp"); 
    }
%>

<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");

try{
	
	Connection con=DbConnection.connect();
	PreparedStatement st=con.prepareStatement("update user set address=? where email=?");
	st.setString(1, address);
	st.setString(2,email);
	int row=st.executeUpdate();
	if(row>0){
	response.sendRedirect("addChangeAddress.jsp?msg=updated");
	
	
	}
	
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("addChangeAddress.jsp?msg=error");
}

%>