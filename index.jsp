<% if (session.getAttribute("user") == null) {
response.sendRedirect("login.jsp"); } else {
response.sendRedirect("dashboard.jsp"); } %>
