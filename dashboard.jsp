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
        width: 380px;
        background-color: #f5f7fb;
        padding: 30px;
        border: 1px solid #111827;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      }

      .actions {
        margin-top: 25px;
      }

      .action-btn {
        display: block;
        width: 100%;
        padding: 12px;
        margin-bottom: 12px;
        background-color: #1e3a8a;
        color: white;
        text-align: center;
        border-radius: 6px;
        font-weight: 600;
      }

      a {
        text-decoration: none;
      }

      .logout {
        display: block;
        text-align: center;
        margin-top: 10px;
        color: #b91c1c;
        font-weight: 600;
      }

      .username {
        text-transform: capitalize;
      }
    </style>
  </head>

  <body>
    <% model.User user = (model.User) session.getAttribute("user"); if (user ==
    null) { response.sendRedirect("login.jsp"); return; } int accNo = (int)
    session.getAttribute("accNo"); AccountDAO accountDao = new AccountDAO();
    double balance = accountDao.getBalance(accNo); %>

    <div class="box">
      <h2>Welcome <span class="username"><%= user.getUsername() %></span>!</h2>
      <h4>Account No: <%= accNo %></h4>
      <h3>Your Balance: &#8377; <%= balance %></h3>

      <div class="actions">
        <a href="transfer.jsp" class="action-btn">Transfer Money</a>
        <a href="transactions" class="action-btn">View Transactions</a>
      </div>

      <a href="logout" class="logout">Logout</a>
    </div>
  </body>
</html>
