<%@include file="header.jsp" %>
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%

String msg=request.getParameter("msg");
if("one".equals(msg)){
%>

<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%if("inc".equals(msg)){
	%>


<h3 class="alert">Quantity  Increased Successfully!</h3>

<%} %>
<%if("dec".equals(msg)){
	%>

<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%if("remove".equals(msg)){
	%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>

<table>
<thead>
<%
int total=0;
int s=0;
try
{
	Connection con=DbConnection.connect();
	Statement st=con.createStatement();

	ResultSet rs=st.executeQuery("select sum(total_price)  from orders where email='"+email+"' and address is null");
	rs.next();
	total=rs.getInt(1);


%>

          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><% out.println(total);%> </th>
            <%if(total>0){ %>
            <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet ss=st.executeQuery("select * from product inner join orders on product.id=orders.product_id and orders.email='"+email+"' and orders.address is null ");
        while(ss.next()){
        	
        
        %>
      
          <tr>
          <% s=s+1; %>
          

           <td><%=s %></td>
            <td><%=ss.getString(2) %></td>
            <td><%=ss.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=ss.getString(4) %></td>
            <td><a href="incrementDecrement.jsp?id=<%=ss.getString(1)%>&quantity=decrement"><i class='fas fa-minus-circle'></i></a> <%=ss.getString(8) %> <a href="incrementDecrement.jsp?id=<%=ss.getString(1)%>&quantity=increment"><i class='fas fa-plus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=ss.getString(10) %>  </td>
            <td><a href="remove.jsp?id=<%=ss.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
          <%
          }
          
          }
          catch(Exception e){
        	  System.out.print(e);        	  
          }
          %>

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>