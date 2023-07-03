/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoo;

import context.DBContext;
import entity.Brand;
import entity.Category;
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
public class SortDAO extends DBContext {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //sort list product
    public List<Product> sortProduct(String[] brand, String minPrice, String maxPrice, String[] color, String[] layout, String[] connect, String[] material,
            String cid, String txt, String option) {
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
                + "     where 1=1\n"
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
        if (txt == null && cid == null) {
            sql += "";
        } else if (txt != null && cid.isEmpty()) {
            sql += ("AND p.[name] like '%" + txt + "%'" + "\n");
        } else if (cid != null && txt.isEmpty()) {
            sql += ("AND ca.cid = " + cid + "\n");
        }

        //option
        switch (option) {
            case "1":
                sql += ("order by price asc\n");
                break;
            case "2":
                sql += ("order by price desc\n");
                break;
            case "3":
                sql += ("order by id desc\n");
                break;
            case "4":
                sql += ("order by sold desc\n");
                break;
            default:
                break;
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
        return list;
    }

    public static void main(String[] args) {
        SortDAO sd = new SortDAO();
        String[] brand = null;
        String minPrice = "1";
        String maxPrice = "1000";
        String[] color = null;
        String[] layout = null;
        String[] connect = null;
        String[] material = {"2"};
        String cid = "2";
        String txt = "";
        String option = "2";
        
        List<Product> list = sd.sortProduct(brand, minPrice, maxPrice, color, layout, connect, material, cid, txt, option);
        for (Product product : list) {
            System.out.println(product.getPrice());

        }

    }
}
