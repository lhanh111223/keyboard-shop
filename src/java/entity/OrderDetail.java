/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HoangAnh
 */
public class OrderDetail {
    private int odid;
    private int product_id, order_id;
    private double price;
    private int numItem;
    private double total_money;

    public OrderDetail() {
    }

    public OrderDetail(int odid, int product_id, int order_id, double price, int numItem, double total_money) {
        this.odid = odid;
        this.product_id = product_id;
        this.order_id = order_id;
        this.price = price;
        this.numItem = numItem;
        this.total_money = total_money;
    }

    public int getOdid() {
        return odid;
    }

    public void setOdid(int odid) {
        this.odid = odid;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumItem() {
        return numItem;
    }

    public void setNumItem(int numItem) {
        this.numItem = numItem;
    }

    public double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(double total_money) {
        this.total_money = total_money;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "odid=" + odid + ", product_id=" + product_id + ", order_id=" + order_id + ", price=" + price + ", numItem=" + numItem + ", total_money=" + total_money + '}';
    }
    
    
}
