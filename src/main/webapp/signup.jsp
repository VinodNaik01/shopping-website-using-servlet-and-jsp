<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/signup-style.css">
    <title>Signup</title>
</head>
<body>
<div id="container">
    <div class="signup">
     <form action="signup" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="number" name="mobileNumber" placeholder="Phone Number" required>
            <input type="submit" value="Submit">
        </form>
    
        <h2><a href="login.jsp">Login</a></h2>
        
    </div>

    <div class="whysign">

        <% 
            String msg = request.getParameter("msg");
            if ("updated".equals(msg)) {
        %>
                <h1>Successfully Updated</h1>
                <h1>Please Login</h1>
        <%
            } else if ("notUpdated".equals(msg)) {
        %>
                <h1>Something Went Wrong! Try Again!</h1>
        <%
            }
        %>

         <h2 style="
      font-family: 'Arial Black', 'Segoe UI', sans-serif;
      font-size: 28px;
      font-weight: bold;
      color: #ffffff;
      background: linear-gradient(135deg, #7f00ff, #e100ff);
      padding: 6px 12px;
      border-radius: 8px;
      letter-spacing: 0.6px;
      text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
      margin-top: 10px;
      margin-bottom: 6px;
      display: inline-block;
    ">
      ShopNOW 
      <span style="
        font-size: 13px;
        font-weight: 600;
        background-color: #ffffff;
        color: #a100ff;
        padding: 3px 8px;
        border-radius: 12px;
        margin-left: 6px;
        text-shadow: none;
      ">(by <strong>Vinod S M</strong>)</span>
    </h2>
    
    <br>
    <br>
        <p>ShopNOw is a application that allows the users to shop online without going to the shops to buy them.<br><br><br> use admin@gmail.com with pasword "admin" to enjoy admin previlages</p>
    </div>
</div>
</body>
</html>
