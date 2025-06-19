<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try
{
	Connection con=DbConnection.connect();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
	while(rs.next()){
		
	

%>

<h3>Name: <%=rs.getString(1) %></h3>
<hr>
 <h3>Email:<%=email%> </h3>
 <hr>
 <h3>Mobile Number:<%=rs.getString(4) %> </h3>
 <hr>


<hr>
 <%}
	}
	catch(Exception e){
		System.out.print(e);
	}
		
	%>
      <br>
      <br>
      <br>

</body>
</html>