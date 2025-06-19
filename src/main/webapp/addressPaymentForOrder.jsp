
<%@include file="footer.jsp" %>
<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script type="text/javascript">
if(window.history.forward(1)!=null)
	window.history.forward(1);s</script>

</head>
<body>
<br>
<table>
<thead>
<% 
String email=session.getAttribute("email").toString();
int total=0;
int sn=0;
try
{
	Connection con=DbConnection.connect();
	Statement st=con.createStatement();

	ResultSet rs=st.executeQuery("select sum(total_price)  from orders where email='"+email+"' and address is null");
	rs.next();
	total=rs.getInt(1);


%>

          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <% out.println(total); %></th>
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
          </tr>
        </thead>
        <tbody>
        
         <%
        ResultSet ss=st.executeQuery("select * from product inner join orders on product.id=orders.product_id and orders.email='"+email+"' and orders.address is null ");
        while(ss.next()){
        	
        
        %>
      
          <tr>
          <% sn=sn+1; %>
          

           <td><%=sn %></td>
            <td><%=ss.getString(2) %></td>
            <td><%=ss.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=ss.getString(4) %></td>
            <td><a href="incrementDecrement.jsp?id=<%=ss.getString(1)%>&quantity=decrement"><i class='fas fa-plus-circle'></i></a> <%=ss.getString(8) %> <a href="incrementDecrement.jsp?id=<%=ss.getString(1)%>&quantity=increment"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=ss.getString(10) %>  </td>
            <%} %>
            
          </tr>
          </tbody>
          </table>
          <%
          ResultSet sk=st.executeQuery("select* from user where email='"+email+"'");
          sk.next();
          %>
<hr style="width: 100%">
<form action="paymentAction.jsp" method="post">

 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-syle" type="text" name="address" value="<%=sk.getString(5)%>" placeholder="Enter Address" required>


 </div>

<div class="right-div">
<h3>Enter city</h3>
</div>

<div class="left-div">
<h3>Enter State</h3>

</div>

<div class="right-div">
<h3>Enter country</h3>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<select class="input-style" name="paymentMethod">
<option value="Cash on delevery">Cash on delivery</option>
<option value="Online payment">Online Payment</option>
</select>
 
</div>

<div class="right-div">
<h3>Pay online on this vinod@pay.com</h3>
<input class="input-syle" type="text" name="transactionId"  placeholder="Enter id" >
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-syle" type="text" name="mobileNumber" value="<%=sk.getString(4)%>" placeholder="Enter number" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<i class='far fa-arrow-alt-circle-right'></i>
<button class="button" type="submit">fake pay<i class="fa-fa-arrow-alt-circle-right"></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
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