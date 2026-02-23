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
        width: 450px;
        background-color: #f5f7fb;
        padding: 30px;
        border: 1px solid #111827;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      }

      .field {
        margin-bottom: 15px;
      }

      label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
      }

      input[type="number"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #d1d5db;
        border-radius: 5px;
        box-sizing: border-box;
      }

      input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #1e3a8a;
        color: white;
        border: none;
        border-radius: 6px;
        font-weight: 600;
        cursor: pointer;
        margin-top: 10px;
        margin-bottom: 10px;
      }

      .error {
        margin-top: 15px;
      }
    </style>
  </head>

  <body>
    <% model.User user = (model.User) session.getAttribute("user"); if (user ==
    null) { response.sendRedirect("login.jsp"); return; } %>

    <div class="box">
      <h2>Transfer Money</h2>

      <form action="transfer" method="post">
        <div class="field">
          <label>Receiver Account No</label>
          <input type="number" name="toAcc" required />
        </div>

        <div class="field">
          <label>Amount</label>
          <input type="number" name="amount" step="0.01" required />
        </div>

        <p class="error">
          <%= request.getAttribute("error") != null ?
          request.getAttribute("error") : "" %>
        </p>

        <input type="submit" value="Transfer" />
      </form>

      <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
  </body>
</html>
