<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%
String want=request.getParameter("quantity");
String id=request.getParameter("id");
String email=session.getAttribute("email").toString();

int price=0;
int total_price=0;
int quantity=0;

try
{
	Connection con=DbConnection.connect();
	Statement st=con.createStatement();
	ResultSet  rs=st.executeQuery("select* from orders where email='"+email+"' and product_id='"+id+"' and address is NULL ");
	while(rs.next()){
		price=rs.getInt(4);
		total_price=rs.getInt(5);
		quantity=rs.getInt(3);
	}
	if(quantity==1 && want.equals("decrement")){
		response.sendRedirect("myCart.jsp?msg=one");
	}
	else if(want.equals("decrement")){
		total_price=total_price-price;
		quantity=quantity-1;
		st.executeUpdate("update orders set total_price='"+total_price+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is null");
		response.sendRedirect("myCart.jsp?msg=dec");
	}
	else{
		total_price=total_price+price;
		quantity=quantity+1;st.executeUpdate("update orders set total_price='"+total_price+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is null");
		response.sendRedirect("myCart.jsp?msg=inc");

		
	}
}
catch(Exception e){
	System.out.print(e);
}
%>