package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {

    public void addTransaction(int fromAcc, int toAcc, double amount) {

        try {
            Connection con = DBConnection.getConn();

            String sql = "INSERT INTO transactions(from_acc,to_acc,amount) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, fromAcc);
            ps.setInt(2, toAcc);
            ps.setDouble(3, amount);

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<String[]> getTransactions(int accNo) {

        List<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConn();

            String sql =
                "SELECT t.from_acc, t.to_acc, " +
                "u1.username AS from_user, " +
                "u2.username AS to_user, " +
                "t.amount, t.date " +
                "FROM transactions t " +
                "JOIN accounts a1 ON t.from_acc = a1.acc_no " +
                "JOIN users u1 ON a1.user_id = u1.id " +
                "JOIN accounts a2 ON t.to_acc = a2.acc_no " +
                "JOIN users u2 ON a2.user_id = u2.id " +
                "WHERE t.from_acc=? OR t.to_acc=? " +
                "ORDER BY t.date DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accNo);
            ps.setInt(2, accNo);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int fromAcc = rs.getInt("from_acc");
                int toAcc = rs.getInt("to_acc");

                String type;

                if (fromAcc == accNo) {
                    type = "Debit";
                } else {
                    type = "Credit";
                }

                String[] row = new String[5];

                row[0] = type;
                row[1] = rs.getString("from_user");
                row[2] = rs.getString("to_user");
                row[3] = String.valueOf(rs.getDouble("amount"));
                row[4] = rs.getTimestamp("date").toString();

                list.add(row);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}