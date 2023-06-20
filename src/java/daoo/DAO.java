/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoo;

import context.DBContext;
import entity.Account;
import entity.Brand;
import entity.Category;
import entity.Product;
import entity.ProductDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoang Anh
 */
public class DAO {
    
    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // get all category
    public List<Category> getAllCategory() {
        FilterDAO cd = new FilterDAO();
        List<Category> list = new ArrayList<>();
        
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2),
                        cd.categoryQuantity("" + rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        
        return list;
    }

    // get all product
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11)));
                
            }
        } catch (Exception e) {
        }
        return list;
    }

    // login
    public Account login(String user, String pass) {
        String query = "select * from Account\n"
                + "where username = ? and [password] = ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
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

    //check account is exist ???
    public Account checkAccountExist(String user) {
        String query = "select * from Account\n"
                + "where username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
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
                        rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    //sign up
    public void signup(String fullname, String email, String user, String pass, String phone) {
        String query = "insert into Account\n"
                + "values (?, ?, ?, ?, ?, 0, null)";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, user);
            ps.setString(4, pass);
            ps.setString(5, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // get product by cid
    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11)));
            }
        } catch (Exception e) {
        }
        
        return list;
    }

    //get lastest product
    public List<Product> getLast() {
        List<Product> list = new ArrayList<>();
        String query = "select top 6 * from Product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11)));
            }
        } catch (Exception e) {
        }
        
        return list;
    }

    // get product by ID
    public Product getProductByID(String id) {
        String query = "select * from Product\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // get catefory by id
    public Category getCateByID(String cid) {
        String query = "select * from Category\n"
                + "where cid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(
                        rs.getInt(1),
                        rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Product> getFeaturedByCID(String cid) {
        String query = "select top 4 * from Product \n"
                + "where cateID = ?\n"
                + "order by price desc, sold desc";
        List<Product> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getTopSold() {
        String query = "select top 6 * from Product\n"
                + "order by sold desc";
        List<Product> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    // get related product
    public List<Product> getRelated(String cid) {
        String query = "select top 4 * from Product\n"
                + "where cateID = ? order by sold asc";
        List<Product> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //search by name
    public List<Product> searchByname(String text) {
        String query = "select * from Product\n"
                + "where [name] like ?";
        List<Product> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + text + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        c,
                        b,
                        rs.getDouble(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Category> list = dao.getAllCategory();
        for (Category p : list) {
            System.out.println(p.getQuantity());
        }
        
    }
}
