/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoo;

import context.DBContext;
import entity.Brand;
import entity.Category;
import entity.Color;
import entity.Feature;
import entity.Layout;
import entity.Material;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoang Anh
 */
public class FilterDAO extends DBContext {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //get quantity by brand
    public int brandQuantity(String bid) {
        int count = 0;
        String query = "select * from Product\n"
                + "where brandID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
            return count;
        } catch (Exception e) {
        }
        return 0;
    }
    
    // quantity category
    public int categoryQuantity(String cid) {
        int count = 0;
        String query = "select * from Product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
            return count;
        } catch (Exception e) {
        }
        return 0;
    }

    //get discount Products
    public List<Product> getDiscountProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where discount > 0\n "
                + "ORDER BY discount desc";

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

    // get all brand
    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        String sql = "select * from Brand";
        FilterDAO fd = new FilterDAO();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(
                        rs.getInt(1),
                        rs.getString(2),
                        fd.brandQuantity(""+rs.getInt(1))));
            }
        } catch (Exception e) {
        }

        return list;
    }

    //get all color
    public List<Color> getAllColor() {
        List<Color> list = new ArrayList<>();
        String sql = "select * from Color";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Color(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    //get all material
    public List<Material> getAllMaterial() {
        List<Material> list = new ArrayList<>();
        String sql = "select * from Material";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Material(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    //get all layout
    public List<Layout> getAllLayout() {
        List<Layout> list = new ArrayList<>();
        String sql = "select * from Layout";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Layout(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    //get all feature
    public List<Feature> getAllFeature() {
        List<Feature> list = new ArrayList<>();
        String sql = "select * from Feature";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feature(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    // filter
    public List<Product> filter(String[] brand, String minPrice, String maxPrice, String[] color, String[] layout, String[] connect, String[] material,
            String cid, String txt) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id, p.[name], p.price, p.quantity, p.sold, p.[image], p.intro, p.[description], p.cateID, p.brandID, p.discount\n"
                + "from Product p\n"
                + "	FULL JOIN ProductDetail pd ON p.id = pd.pid\n"
                + "	FULL JOIN Brand br ON p.brandID = br.bid\n"
                + "	FULL JOIN Color c ON pd.cid = c.color_id\n"
                + "	FULL JOIN Material m ON pd.mid = m.material_id\n"
                + "	FULL JOIN Layout l ON pd.lid = l.layout_id\n"
                + "	FULL JOIN Feature f ON pd.fid = f.feature_id\n"
                + "     FULL JOIN Category ca ON p.cateID = ca.cid\n"
                + "\n"
                + "where 1=1\n"
                + "	AND p.price between ? and ?\n";

        
        // brand
        if (brand != null) {
            sql += "AND br.bid in (0";
            for (String br : brand) {
                sql += "," + br;
            }
            sql += ")\n";
        }

        //color
        if (color != null) {
            sql += "AND pd.cid in (0";
            for (String c : color) {
                sql += "," + c;
            }
            sql += ")\n";
        }
        //layout
        if (layout != null) {
            sql += "AND pd.lid in(0";
            for (String la : layout) {
                sql += "," + la;
            }
            sql += ")\n";
        }
        //connect
        if (connect != null) {
            sql += "AND pd.fid in(0";
            for (String f : connect) {
                sql += "," + f;
            }
            sql += ")\n";
        }
        //Material
        if (material != null) {
            sql += "AND pd.mid in(0";
            for (String m : material) {
                sql += "," + m;
            }
            sql += ")\n";
        }
        //cid & search
        if(txt.isEmpty() && cid.isEmpty()){
            sql += "";
        }else if(!txt.isEmpty() && cid.isEmpty()){
            sql += ("AND p.[name] like '%" +txt+"%'" + "\n");
        }else if(!cid.isEmpty() && txt.isEmpty()){
            sql += ("AND ca.cid = " + cid + "\n");
        }

        //result
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, minPrice);
            ps.setString(2, maxPrice);
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
        System.out.println(sql);
        return list;
    }

    public static void main(String[] args) {
        FilterDAO d = new FilterDAO();
        String[] brand = null;
        String[] color = null;
        String[] layout = null;
        String[] connect = null;
        String[] material = null;
        String min = "0";
        String max = "1000";
        List<Product> list = d.filter(brand, min, max, color, layout, connect, material, "", "");
        
        for (Product product : list) {
            System.out.println(product.getId() + "---" + product.getBrand().getBid());
            System.out.println("1");
        }
    }
}
