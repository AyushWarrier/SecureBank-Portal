<%@ page import="dao.AccountDAO" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css" />
    <style>
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      .box {
        width: 350px;
        background-color: #f5f7fb;
        padding: 30px;
        border: 1px solid #111827;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      }
    </style>
  </head>
  <body>
    <% model.User user = (model.User) session.getAttribute("user"); if (user ==
    null) { response.sendRedirect("login.jsp"); return; } int accNo = (int)
    session.getAttribute("accNo"); AccountDAO accountDao = new AccountDAO();
    double balance = accountDao.getBalance(accNo); %>
    <div class="box">
      <h2>Welcome <%= user.getUsername() %>!</h2>
      <h3>Your Balance: &#8377; <%= balance %></h3>

      <a href="logout">Logout</a>
      <br /><br />
      <a href="transfer.jsp">Transfer Money</a>
      <br /><br />
      <a href="transactions">View Transactions</a>
    </div>
  </body>
</html>
