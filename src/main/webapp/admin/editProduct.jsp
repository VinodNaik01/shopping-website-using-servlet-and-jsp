<%
   
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
   
    if (session.getAttribute("email") == null) {
        response.sendRedirect("../login.jsp"); 
    }
%>


<%@page import="com.util.*" %>
<%@page import="java.sql.*" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>

<%
String id=request.getParameter("id");
try
{
	Connection con=DbConnection.connect();
	PreparedStatement st=con.prepareStatement("select* from product where id=?");
	st.setInt(1, Integer.parseInt(id));

	ResultSet rs=st.executeQuery();
	while(rs.next()){

%>
<form action="<%= request.getContextPath() %>/EditProduct" method="post">
<input type="hidden" name="id" value="<%=id %>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" value="<%=rs.getString(2) %>" required>

<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<input class="input-style" type="text" name="category" value="<%=rs.getString(3) %>" required>
 
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style" type="text" name="price" value="<%=rs.getString(4) %>" required>
 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<input class="input-style" type="text" name="active" value="<%=rs.getString(5) %>" required>

 <hr>
</div>
 <button class="button" ><i class='far fa-arrow-alt-circle-right'></i>Change</button>
 </form>

<% }
	}
	catch(Exception e){
	System.out.print(e);
	}%>

</body>
<br><br><br>
</body>
</html>