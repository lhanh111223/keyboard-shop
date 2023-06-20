/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoo;

import context.DBContext;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
            while(rs.next()){
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
            while(rs.next()){
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
    
    // add new brand id
    
    public static void main(String[] args) {
        AccountDAO ad = new AccountDAO();
        Account a = ad.getAccountProfile("user");
        System.out.println(a);
    }
}
