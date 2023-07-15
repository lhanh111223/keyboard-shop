/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoo;

import context.DBContext;
import entity.Account;
import entity.Brand;
import entity.Category;
import entity.Color;
import entity.Feature;
import entity.Layout;
import entity.Material;
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
public class ManagerDAO extends DBContext {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // update category
    public void updateCategoryByCid(String cname, String cid) {
        String sql = "UPDATE Category\n"
                + "SET cname = ?\n"
                + "WHERE cid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, cname);
            ps.setString(2, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // update brand
    public void updateBrandByCid(String bname, String bid) {
        String sql = "UPDATE Brand\n"
                + "SET bname = ?\n"
                + "WHERE bid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bname);
            ps.setString(2, bid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // get product by brand id
    public List<Product> getProductByBrand(String bid) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id, p.[name], p.price, p.quantity, p.sold, p.[image], p.intro, p.[description], p.cateID, p.brandID, p.discount\n"
                + "from Product p\n"
                + "	FULL JOIN ProductDetail pd ON p.id = pd.pid\n"
                + "	FULL JOIN Brand br ON p.brandID = br.bid\n"
                + "	FULL JOIN Color c ON pd.cid = c.color_id\n"
                + "	FULL JOIN Material m ON pd.mid = m.material_id\n"
                + "	FULL JOIN Layout l ON pd.lid = l.layout_id\n"
                + "	FULL JOIN Feature f ON pd.fid = f.feature_id\n"
                + "\n"
                + "	where br.bid = ?\n"
                + "ORDER BY id DESC";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
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

    // get product detail by id
    public Product getProductDetail(String id) {
        String sql = "select p.id, p.[name], p.price, p.quantity, p.sold, p.[image], p.intro, p.[description], p.cateID, p.brandID, p.discount, pd.cid, pd.mid, pd.lid, pd.fid\n"
                + "from Product p\n"
                + "	FULL JOIN ProductDetail pd ON p.id = pd.pid\n"
                + "	FULL JOIN Brand br ON p.brandID = br.bid\n"
                + "	FULL JOIN Color c ON pd.cid = c.color_id\n"
                + "	FULL JOIN Material m ON pd.mid = m.material_id\n"
                + "	FULL JOIN Layout l ON pd.lid = l.layout_id\n"
                + "	FULL JOIN Feature f ON pd.fid = f.feature_id\n"
                + "\n"
                + "where p.id = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(9));
                Brand b = new Brand();
                b.setBid(rs.getInt(10));
                Color co = new Color();
                co.setColor_id(rs.getInt(12));
                Material ma = new Material();
                ma.setMaterial_id(rs.getInt(13));
                Layout la = new Layout();
                la.setLayout_id(rs.getInt(14));
                Feature fe = new Feature();
                fe.setFeature_id(rs.getInt(15));

                ProductDetail pd = new ProductDetail();
                pd.setCid(co);
                pd.setMid(ma);
                pd.setLid(la);
                pd.setFid(fe);

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
                        rs.getDouble(11),
                        pd);

            }
        } catch (Exception e) {
        }
        return null;
    }

    //UPDATE PRODUCT
    public void updateProduct(String name, String price, String quantity, String sold, String image, String intro, String description, String cateID,
            String brandID, String discount, String cid, String mid, String lid, String fid, String id) {
        String sql = "BEGIN TRANSACTION;\n"
                + "UPDATE Product\n"
                + "	SET [name] = ?,\n"
                + "		[price] = ?,\n"
                + "		[quantity] = ?,\n"
                + "		[sold] = ?,\n"
                + "		[image] = ?,\n"
                + "		[intro] = ?,\n"
                + "		[description] = ?,\n"
                + "		[cateID] = ?,\n"
                + "		[brandID] = ?,\n"
                + "		[discount] = ?\n"
                + "	where id = ?\n"
                + "UPDATE ProductDetail\n"
                + "	SET [cid] = ?,\n"
                + "		[mid] = ?,\n"
                + "		[lid] = ?,\n"
                + "		[fid] = ?\n"
                + "	where pid = ?\n"
                + "COMMIT TRANSACTION;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, quantity);
            ps.setString(4, sold);
            ps.setString(5, image);
            ps.setString(6, intro);
            ps.setString(7, description);
            ps.setString(8, cateID);
            ps.setString(9, brandID);
            ps.setString(10, discount);
            ps.setString(11, id);
            ps.setString(12, cid);
            ps.setString(13, mid);
            ps.setString(14, lid);
            ps.setString(15, fid);
            ps.setString(16, id);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    // add product
    public void addProduct(String name, String price, String quantity, String sold, String image, String intro, String description,
            String cateID, String brandID, String discount, String cid, String mid, String lid, String fid) {

        String sql = "insert into Product\n"
                + "values(?,?,?,?,?,?,?,?,?,?,0)\n"
                + "\n"
                + "DECLARE @productID int;\n"
                + "SET @productID = SCOPE_IDENTITY();\n"
                + "\n"
                + "insert into ProductDetail\n"
                + "values(@productID,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, quantity);
            ps.setString(4, sold);
            ps.setString(5, image);
            ps.setString(6, intro);
            ps.setString(7, description);
            ps.setString(8, cateID);
            ps.setString(9, brandID);
            ps.setString(10, discount);
            ps.setString(11, brandID);
            ps.setString(12, cid);
            ps.setString(13, mid);
            ps.setString(14, lid);
            ps.setString(15, fid);

            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    // delete product
    public void deleteProduct(String pid) {
        String sql = "delete from Product\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // load all product for ADMIN
    public List<Product> loadAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id, p.[name], p.price, p.quantity, p.sold, p.[image], p.intro, p.[description], p.cateID, p.brandID, \n"
                + "p.discount, pd.cid, pd.mid, pd.lid, pd.fid\n"
                + "from Product p\n"
                + "	FULL JOIN ProductDetail pd ON p.id = pd.pid\n"
                + "	FULL JOIN Brand br ON p.brandID = br.bid\n"
                + "	FULL JOIN Color c ON pd.cid = c.color_id\n"
                + "	FULL JOIN Material m ON pd.mid = m.material_id\n"
                + "	FULL JOIN Layout l ON pd.lid = l.layout_id\n"
                + "	FULL JOIN Feature f ON pd.fid = f.feature_id";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
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

    // get All Account to manage
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    // delete Category
    public void deleteCategory(String cid) {
        String sql = "delete from Category\n"
                + "where cid =  ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //add category
    public void addCategory(String cname) {
        String sql = "insert into Category\n"
                + "values(?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, cname);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //delete brand
    public void deleteBrand(String bid) {
        String sql = "delete from Brand\n"
                + "where bid =  ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //add brand
    public void addBrand(String bname) {
        String sql = "insert into Brand\n"
                + "values(?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bname);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // delete account
    public void deleteAccount(String aid) {
        String sql = "UPDATE Account\n"
                + "SET isAdmin = 2\n"
                + "WHERE aid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, aid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void unlockAccount(String aid) {
        String sql = "UPDATE Account\n"
                + "SET isAdmin = 0\n"
                + "WHERE aid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, aid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // add brand account
    public void addBrandAccount(String fullname, String email, String username, String password, String phone, String brandID, String avatar) {
        String sql = "insert into Account\n"
                + "values(?,?,?,?,?,'0',?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, brandID);
            ps.setString(7, avatar);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    // update acc brand
    public void updateBrandAccount(String fullname, String email, String username, String password, String phone, String brandID,
            String avatar, String aid) {
        String sql = "update Account\n"
                + "	SET fullname = ?,\n"
                + "	email = ?,\n"
                + "	username = ?,\n"
                + "	[password] = ?,\n"
                + "	phone = ?,\n"
                + "	isAdmin = 0,\n"
                + "	brandID = ?,\n"
                + "	avatar = ?\n"
                + "where aid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, brandID);
            ps.setString(7, avatar);
            ps.setString(8, aid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ManagerDAO mp = new ManagerDAO();
//        List<Product> list = mp.loadAllProduct();
//        for (Product product : list) {
//            System.out.println(product.toString());
//        }
        Product a = mp.getProductDetail("1");
        System.out.println(a);
    }

}
