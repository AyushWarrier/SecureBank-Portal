<!DOCTYPE html>
<html>
  <head>
    <title>Transfer Money</title>
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
    null) { response.sendRedirect("login.jsp"); return; } %>
    <div class="box">
      <h2>Transfer Money</h2>

      <form action="transfer" method="post">
        Receiver Account No:
        <input type="number" name="toAcc" required /><br /><br />

        Amount:
        <input type="number" name="amount" step="0.01" required /><br /><br />

        <input type="submit" value="Transfer" />
      </form>

      <p style="color: red">
        <%= request.getAttribute("error") != null ?
        request.getAttribute("error") : "" %>
      </p>

      <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
  </body>
</html>
