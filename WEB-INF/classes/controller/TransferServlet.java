package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.AccountDAO;
import dao.TransactionDAO;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int fromAcc = (int) session.getAttribute("accNo");
        int toAcc = Integer.parseInt(request.getParameter("toAcc"));
        double amount = Double.parseDouble(request.getParameter("amount"));

        AccountDAO accountDao = new AccountDAO();

        if (!accountDao.accountExists(toAcc)) {
            request.setAttribute("error", "Receiver account does not exist!");
            request.getRequestDispatcher("transfer.jsp")
                .forward(request, response);
            return;
        }

        double senderBalance = accountDao.getBalance(fromAcc);

        if (fromAcc == toAcc) {
            request.setAttribute("error", "Cannot transfer to same account!");
            request.getRequestDispatcher("transfer.jsp")
                .forward(request, response);
            return;
        }

        if (senderBalance < amount) {
            request.setAttribute("error", "Insufficient Balance!");
            request.getRequestDispatcher("transfer.jsp")
                   .forward(request, response);
            return;
        }

        // Deduct sender
        accountDao.updateBalance(fromAcc, senderBalance - amount);

        // Add receiver
        double receiverBalance = accountDao.getBalance(toAcc);
        accountDao.updateBalance(toAcc, receiverBalance + amount);

        // Insert transaction
        TransactionDAO txnDao = new TransactionDAO();
        txnDao.addTransaction(fromAcc, toAcc, amount);

        response.sendRedirect("dashboard.jsp");
    }
}