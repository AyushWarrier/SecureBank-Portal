package dao;

import java.sql.*;
import model.User;

public class UserDAO {

    public User login(String username, String password) {
        User user = null;

        try {
            Connection con = DBConnection.getConn();
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public int getAccountNumber(int userId) {
        int accNo = 0;

        try {
            Connection con = DBConnection.getConn();
            String sql = "SELECT acc_no FROM accounts WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                accNo = rs.getInt("acc_no");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return accNo;
    }
}