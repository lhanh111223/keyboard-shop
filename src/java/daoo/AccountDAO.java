/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoo;

import context.DBContext;
import entity.Account;
import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoang Anh
 */
public class AccountDAO extends DBContext {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // change password
    public void changePassword(String username, String newPassword) {
        String query = "update Account\n"
                + "set [password] = ?\n"
                + "where [username] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // edit profile
    public void editProfile(String username, String fullname, String email, String phone, String avatar) {
        String sql = "update Account\n"
                + "set fullname = ?, email = ?, phone = ?, avatar = ?\n"
                + "where [username] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, avatar);
            ps.setString(5, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // get account info
    public Account getAccountProfile(String username) {
        String sql = "select * from Account\n"
                + "where [username] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // get account info by aid
    public Account getAccountProfileByID(String aid) {
        String sql = "select * from Account\n"
                + "where [aid] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // add account google
    public void addAccGoogle(String name, String email, String username) {
        String sql = "INSERT INTO Account\n"
                + "VALUES (?,?,?,'123','0862810356',0,null,'https://cdn.shopify.com/s/files/1/0565/8070/2297/products/Gateron-logo.jpg')";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    // updateAccGoogle
    public void updateAccGoogle(String email) {
        String sql = "UPDATE Account\n"
                + "SET [password] = 123\n"
                + "WHERE email = ? and username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    // check acc google existed ?
    public boolean checkExistAccGoogle(List<Account> list, String email) {
        for (Account account : list) {
            if (account.getUsername().equals(email) && account.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    // get activities of account
    public Account getActivity(String username) {
        String sql = "SELECT a.aid, a.fullname, COUNT(o.account_id) as 'Bills', SUM(o.total_money) as 'Pay', COUNT(od.product_id) as 'NO Products'"
                + "FROM Account a\n"
                + "	JOIN [Order] o ON o.account_id = a.aid\n"
                + "	JOIN [OrderDetail] od ON od.order_id = o.oid\n"
                + "	WHERE a.username = ?\n"
                + "GROUP BY a.aid, a.fullname";

        String sql2 = "SELECT COUNT(od.order_id) as 'BIILS'\n"
                + "FROM [Account] a\n"
                + "	JOIN [Order] o ON o.account_id = a.aid\n"
                + "	JOIN [OrderDetail] od ON o.oid = od.odid\n"
                + "	WHERE a.username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.setString(1, username);
            ResultSet rs2 = ps2.executeQuery();
            while (rs.next() && rs2.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setFullname(rs.getString(2));
                a.setBill(rs2.getInt(1));
                a.setPaid(rs.getDouble(4));
                a.setNoproducts(rs.getInt(5));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Order> getOrderDetailForUser(String aid, String day, String month, String year) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.oid, p.name, od.price, od.numItem, od.total_money, o.status, o.order_date\n"
                + "FROM Account a\n"
                + "	JOIN [Order] o ON o.account_id = a.aid\n"
                + "	JOIN [OrderDetail] od ON od.order_id = o.oid\n"
                + "	JOIN [Product] p ON p.id = od.product_id\n"
                + "	WHERE a.aid = ?\n";
        
        if(day == null || day.isEmpty()){
            sql += "";
        }else{
            sql += ("\nAND DAY(o.order_date) = " + day);
        }
        if(month == null || month.isEmpty()){
            sql += "";
        }else{
            sql += ("\nAND MONTH(o.order_date) = " + month);
        }
        if(year == null || year.isEmpty()){
            sql += "";
        }else{
            sql += ("\nAND YEAR(o.order_date) = " + year);
        }
        
        sql += ("ORDER BY o.oid DESC");
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOid(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotal_money(rs.getDouble(5));
                o.setPhone(rs.getInt(4) + "");
                o.setStatus(rs.getInt(6) + "");
                o.setOrder_date(rs.getString(7));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        AccountDAO ad = new AccountDAO();
        List<Order> list = ad.getOrderDetailForUser("23", "", "", "");
        for (Order order : list) {
            System.out.println(order);
        }
    }
}
