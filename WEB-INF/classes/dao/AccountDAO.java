package dao;

import java.sql.*;

public class AccountDAO {

    public double getBalance(int accNo) {

        double balance = 0;

        try {
            Connection con = DBConnection.getConn();
            String sql = "SELECT balance FROM accounts WHERE acc_no=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accNo);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                balance = rs.getDouble("balance");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return balance;
    }

    public void updateBalance(int accNo, double newBalance) {

        try {
            Connection con = DBConnection.getConn();
            String sql = "UPDATE accounts SET balance=? WHERE acc_no=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, newBalance);
            ps.setInt(2, accNo);

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean accountExists(int accNo) {
        boolean exists = false;

        try {
            Connection con = DBConnection.getConn();
            String sql = "SELECT acc_no FROM accounts WHERE acc_no=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accNo);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                exists = true;
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
}