/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hoang Anh
 */
public class ProductDetail {
    private int id;
    private Product pid;
    private Brand bid;
    private Color cid;
    private Material mid;
    private Layout lid;
    private Feature fid;

    public ProductDetail() {
    }

    public ProductDetail(int id, Product pid, Brand bid, Color cid, Material mid, Layout lid, Feature fid) {
        this.id = id;
        this.pid = pid;
        this.bid = bid;
        this.cid = cid;
        this.mid = mid;
        this.lid = lid;
        this.fid = fid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getPid() {
        return pid;
    }

    public void setPid(Product pid) {
        this.pid = pid;
    }

    public Brand getBid() {
        return bid;
    }

    public void setBid(Brand bid) {
        this.bid = bid;
    }

    public Color getCid() {
        return cid;
    }

    public void setCid(Color cid) {
        this.cid = cid;
    }

    public Material getMid() {
        return mid;
    }

    public void setMid(Material mid) {
        this.mid = mid;
    }

    public Layout getLid() {
        return lid;
    }

    public void setLid(Layout lid) {
        this.lid = lid;
    }

    public Feature getFid() {
        return fid;
    }

    public void setFid(Feature fid) {
        this.fid = fid;
    }

    @Override
    public String toString() {
        return "ProductDetail{" + "id=" + id + ", pid=" + pid + ", bid=" + bid + ", cid=" + cid + ", mid=" + mid + ", lid=" + lid + ", fid=" + fid + '}';
    }
    
    
    
    
    
}
