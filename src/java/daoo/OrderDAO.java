/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoo;

import context.DBContext;
import entity.Account;
import entity.Brand;
import entity.Cart;
import entity.Category;
import entity.Item;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HoangAnh
 */
public class OrderDAO {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void addOrder(Account acc, Cart cart, String address) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        // add order
        String sql = "INSERT INTO [Order]\n"
                + "values(?,?,?,?,?,?,1,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acc.getId());
            ps.setString(2, acc.getFullname());
            ps.setString(3, acc.getEmail());
            ps.setString(4, acc.getPhone());
            ps.setString(5, address);
            ps.setString(6, date);
            ps.setDouble(7, cart.getTotalMoney());

            ps.executeUpdate();

            // lay ID cua Order vua add
            String sql1 = "SELECT TOP 1 oid from [Order] order by oid desc";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            rs = ps1.executeQuery();

            // add vao bang order detail
            while (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [OrderDetail] values (?,?,?,?,?)";
                    PreparedStatement ps2 = conn.prepareStatement(sql2);
                    ps2.setInt(1, i.getProduct().getId());
                    ps2.setInt(2, oid);
                    ps2.setDouble(3, i.getPrice());
                    ps2.setInt(4, i.getQuantity());
                    ps2.setDouble(5, cart.getTotalMoney());
                    ps2.executeUpdate();
                }
                // update so luong sold
                String sql3 = "UPDATE Product\n"
                        + "SET sold = ?\n"
                        + "where id = ?";
                PreparedStatement ps3 = conn.prepareStatement(sql3);
                for (Item i : cart.getItems()) {
                    ps3.setInt(1, i.getQuantity());
                    ps3.setInt(2, i.getProduct().getId());
                    ps3.executeUpdate();
                }
            }
        } catch (Exception e) {
        }
    }

    // revenue
    public List<Brand> getRevenueByYear(String bid, String year) {
        List<Brand> list = new ArrayList<>();
        int month[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
        for (int i : month) {
            String sql = "SELECT b.bid, b.bname, SUM(od.price) as 'revenue'\n"
                    + "FROM Brand b\n"
                    + "JOIN Product p ON b.bid = p.brandID\n"
                    + "JOIN OrderDetail od ON p.id = od.product_id\n"
                    + "JOIN [Order] o ON o.oid = od.order_id\n"
                    + "WHERE YEAR(o.order_date) = ? \n"
                    + "	AND MONTH(o.order_date) = ? AND b.bid = ?\n"
                    + "GROUP BY b.bid, b.bname";

            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1, year);
                ps.setInt(2, i);
                ps.setString(3, bid);
                rs = ps.executeQuery();
                if (rs.next()) {
                    Brand b = new Brand();
                    b.setBid(rs.getInt(1));
                    b.setBname(rs.getString(2));
                    b.setRevenue(rs.getDouble(3));
                    list.add(b);
                } else {
                    Brand b = new Brand();
                    b.setBid(Integer.parseInt(bid));
                    b.setRevenue(0);
                    list.add(b);
                }

            } catch (Exception e) {
            }

        }
        return list;
    }

    // revenue by Cate each month
    public List<Category> getRevenueByCateForBrand(String cid, String bid, String year) {
        List<Category> list = new ArrayList<>();
        int month[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};

        for (int i : month) {
                String sql = "SELECT c.cname, SUM(od.price) as 'revenue'\n"
                        + "FROM Brand b\n"
                        + "JOIN Product p ON b.bid = p.brandID\n"
                        + "JOIN Category c ON p.cateID = c.cid\n"
                        + "JOIN OrderDetail od ON p.id = od.product_id\n"
                        + "JOIN [Order] o ON o.oid = od.order_id\n"
                        + "WHERE YEAR(o.order_date) = ?\n"
                        + "	AND MONTH(o.order_date) = ?\n"
                        + "	AND p.cateID = ?\n"
                        + "	AND b.bid = ?\n"
                        + "GROUP BY c.cname";
                try {
                    conn = new DBContext().getConnection();
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, year);
                    ps.setInt(2, i);
                    ps.setString(3, cid);
                    ps.setString(4, bid);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        Category cate = new Category();
                        cate.setCname(rs.getString(1));
                        cate.setRevenue(rs.getDouble(2));
                        list.add(cate);
                    }else{
                        Category cate = new Category();
                        cate.setCname("");
                        cate.setRevenue(0);
                        list.add(cate);
                    }
                } catch (Exception e) {
                }
        }
        return list;
    }

    public List<Category> getRevenueByCate(String bid) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT c.cname, SUM(od.price) as 'revenue'\n"
                + "FROM Category c\n"
                + "	JOIN Product p ON c.cid = p.cateID\n"
                + "	JOIN Brand b ON p.brandID = b.bid\n"
                + "	JOIN OrderDetail od ON p.id = od.product_id\n"
                + "	JOIN [Order] o ON o.oid = od.order_id \n"
                + "WHERE b.bid = ?\n"
                + "GROUP BY c.cname";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCname(rs.getString(1));
                c.setRevenue(rs.getDouble(2));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // views
    public List<Category> getViewByCate(String bid) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT c.cname, SUM(p.[view]) as 'views'\n"
                + "FROM Category c\n"
                + "	FULL JOIN Product p ON c.cid = p.cateID\n"
                + "	FULL JOIN Brand b ON p.brandID = b.bid\n"
                + "	FULL JOIN OrderDetail od ON p.id = od.product_id\n"
                + "	FULL JOIN [Order] o ON o.oid = od.order_id \n"
                + "WHERE b.bid = ?\n"
                + "GROUP BY c.cname";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCname(rs.getString(1));
                c.setQuantity(rs.getInt(2));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // top selling product
    public List<Product> getTopSellingProdByCate(String bid) {
        List<Product> list = new ArrayList<>();
        String sql = "select top (40) percent *\n"
                + "from Product p\n"
                + "	JOIN Category c ON p.cateID = c.cid\n"
                + "where brandID = ?\n"
                + "order by sold desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCname(rs.getString(14));
                Product p = new Product();
                p.setName(rs.getString(2));
                p.setImage(rs.getString(6));
                p.setCategory(c);
                p.setPrice(rs.getDouble(3));
                p.setSold(rs.getInt(5));
                p.setDiscount(rs.getDouble(11));
                p.setQuantity(rs.getInt(4));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // top instock product
    public List<Product> getTopInStockProdByCate(String bid) {
        List<Product> list = new ArrayList<>();
        String sql = "select top (30) percent *\n"
                + "from Product p\n"
                + "	JOIN Category c ON p.cateID = c.cid\n"
                + "where brandID = ?\n"
                + "order by (quantity - sold) desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCname(rs.getString(14));
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setImage(rs.getString(6));
                p.setCategory(c);
                p.setPrice(rs.getDouble(3));
                p.setSold(rs.getInt(5));
                p.setDiscount(rs.getDouble(11));
                p.setQuantity(rs.getInt(4));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        DAO dao = new DAO();
        List<Category> cate = dao.getAllCategory();
        List<Category> c = od.getRevenueByCateForBrand("1", "2", "2023");
        for (Category category : c) {
            System.out.println(category.getRevenue());
        }

    }

}
