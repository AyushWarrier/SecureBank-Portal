package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.TransactionDAO;

@WebServlet("/transactions")
public class TransactionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int accNo = (int) session.getAttribute("accNo");

        TransactionDAO dao = new TransactionDAO();
        List<String[]> list = dao.getTransactions(accNo);

        request.setAttribute("transactions", list);

        request.getRequestDispatcher("transactions.jsp")
               .forward(request, response);
    }
}