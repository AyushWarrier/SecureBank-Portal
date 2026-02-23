<!DOCTYPE html>
<html>
  <head>
    <title>SecureBank Login</title>
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

      .branding {
        text-align: center;
        margin-bottom: 20px;
      }

      .branding p {
        font-size: 14px;
        color: #6b7280;
      }

      input {
        display: block;
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #d1d5db;
        border-radius: 5px;
      }

      input[type="submit"] {
        background: #1e3a8a;
        color: white;
        border: none;
        font-weight: 600;
        cursor: pointer;
      }

      input[type="submit"]:hover {
        background: #1d4ed8;
      }
    </style>
  </head>
  <body>
    <div class="box">
      <div class="branding">
        <h2>SecureBank</h2>
        <p>We never go on Lunch Break</p>
      </div>

      <form action="login" method="post">
        Username:
        <input
          type="text"
          name="username"
          placeholder="Enter Username"
          required
        />
        Password:
        <input
          type="password"
          name="password"
          placeholder="Enter Password"
          required
        />
        <p style="color: red; text-align: center">
          <%= request.getAttribute("error") != null ?
          request.getAttribute("error"): "" %>
        </p>
        <input type="submit" value="Login" />
      </form>
    </div>
  </body>
</html>
