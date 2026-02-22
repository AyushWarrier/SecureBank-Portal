<%@ page import="java.util.List" %> 
<!DOCTYPE html>
<html>
  <head>
    <title>Transactions</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
  <% model.User user = (model.User)
  session.getAttribute("user"); if (user == null) {
  response.sendRedirect("login.jsp"); return; } List<String[]>
    transactions = (List<String[]
      >) request.getAttribute("transactions"); %>

      <h2>Transaction History</h2>

      <table border="1" cellpadding="5">
        <tr>
          <th>Type</th>
          <th>From</th>
          <th>To</th>
          <th>Amount</th>
          <th>Date</th>
        </tr>

        <% if (transactions != null) { for (String[] row : transactions) { %>
        <tr>
          <td style="color:<%=row[0].equals("Debit") ? "red" : "green" %>; font-weight:bold;"><%= row[0] %></td>
          <td><%= row[1] %></td>
          <td><%= row[2] %></td>
          <td>&#8377; <%= row[3] %></td>
          <td><%= row[4] %></td>
        </tr>
        <% } } %>
      </table>

      <br />
      <a href="dashboard.jsp">Back to Dashboard</a></String[]
    ></String[]>
  </body>
</html>
