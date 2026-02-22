package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import dao.AccountDAO;
import model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(600);

            UserDAO userDao = new UserDAO();
            int accNo = userDao.getAccountNumber(user.getId());

            request.getSession().setAttribute("accNo", accNo);

            response.sendRedirect("dashboard.jsp");

        } else {
            request.setAttribute("error", "Invalid Credentials!");
            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);
        }
    }
}