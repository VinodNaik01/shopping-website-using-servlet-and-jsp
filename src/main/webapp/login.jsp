
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="login" method="post">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Submit">
        </form>
     
      <h2><a href="signup.jsp">SignUp</a></h2>
       
  </div>
  <div class='whysignLogin'>
  <%String msg=request.getParameter("msg");
  if("notExist".equals(msg)){
  %>
 
  <h1>Incorrect Username or Password</h1>
  
<% } %>
<%if("invalid".equals(msg)){ %>
<h2>Something went wrong</h2>
<%} %>
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