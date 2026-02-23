<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Transactions</title>
    <link rel="stylesheet" href="style.css" />

    <style>
      body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .box {
        width: 800px;
        background: #ffffff;
        padding: 30px;
        border: 1px solid black;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      }

      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
      }

      th {
        background-color: #e0e7ff;
        color: #1e3a8a;
        padding: 12px;
        text-align: left;
      }

      td {
        padding: 10px;
        border-bottom: 1px solid #e5e7eb;
      }

      .debit {
        color: #dc2626;
        font-weight: 600;
      }

      .credit {
        color: #16a34a;
        font-weight: 600;
      }

      .bottom-part {
        margin-top: 20px;
        text-align: right;
      }
    </style>
  </head>

  <body>
    <%
      model.User user = (model.User) session.getAttribute("user");
      if (user == null) {
        response.sendRedirect("login.jsp");
        return;
      }

      List<String[]> transactions =
          (List<String[]>) request.getAttribute("transactions");
    %>

    <div class="box">
      <h2>Transaction History</h2>

      <table>
        <tr>
          <th>Type</th>
          <th>From</th>
          <th>To</th>
          <th>Amount</th>
          <th>Date</th>
        </tr>

        <% if (transactions != null) {
             for (String[] row : transactions) { %>
        <tr>
          <td class="<%= row[0].equals("Debit") ? "debit" : "credit" %>">
            <%= row[0] %>
          </td>
          <td><%= row[1] %></td>
          <td><%= row[2] %></td>
          <td>&#8377; <%= row[3] %></td>
          <td><%= row[4] %></td>
        </tr>
        <% } } %>
      </table>

      <div class="bottom-part">
        <a href="dashboard.jsp">Back to Dashboard</a>
      </div>
    </div>
  </body>
</html>