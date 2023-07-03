/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hoang Anh
 */
public class Brand {
    private int bid;
    private String bname;
    private int quantity;
    private double revenue;

    public Brand() {
    }

    public Brand(int bid, String bname) {
        this.bid = bid;
        this.bname = bname;
    }

    public Brand(int bid, String bname, int quantity) {
        this.bid = bid;
        this.bname = bname;
        this.quantity = quantity;
    }
    
    public Brand(int bid, String bname, double revenue){
        this.bid = bid;
        this.bname = bname;
        this.revenue = revenue;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    @Override
    public String toString() {
        return "Brand{" + "bid=" + bid + ", bname=" + bname + ", quantity=" + quantity + ", revenue=" + revenue + '}';
    }

    
    
    
}
