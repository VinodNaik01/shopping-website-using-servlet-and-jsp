<%@include file="adminHeader.jsp" %>
<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%@include file="../footer.jsp" %>;

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String query="select max(id) from product";
int id=1;
try
{
Connection con=DbConnection.connect();
PreparedStatement st=con.prepareStatement(query);
ResultSet rs=st.executeQuery();
while(rs.next()){
	id=rs.getInt(1);
	id=id+1;
	
}

}
catch(Exception e){
	System.out.print(e);
	
}

%>
<%String msg=request.getParameter("msg");
if("success".equals(msg)){
%>

<h3 class="alert">Product Added Successfully!</h3>
<%}
if("fail".equals(msg)){
%>

<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>

<form action="<%= request.getContextPath() %>/AddProduct" method="post">



<h3 style="color: yellow;">Product ID:<%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%= id %>"  >

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Product Name" required>
 
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="product Category" required>
 
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="price" required>
 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active" required>
  <option value="yes">Yes</option>
  <option value="no">No</option>
</select>

   
<hr>
</div>

 <button class="button">save<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>

</body>
<br><br><br>
</body>
</html>