/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HoangAnh
 */
public class Order {
    private int oid;
    private int account_id;
    private String fullname, email, phone, address, order_date, status;
    private double total_money;

    public Order() {
    }

    public Order(int oid, int account_id, String fullname, String email, String phone, String address, String order_date, String status, double total_money) {
        this.oid = oid;
        this.account_id = account_id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.order_date = order_date;
        this.status = status;
        this.total_money = total_money;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(double total_money) {
        this.total_money = total_money;
    }

    @Override
    public String toString() {
        return "Order{" + "oid=" + oid + ", account_id=" + account_id + ", fullname=" + fullname + ", email=" + email + ", phone=" + phone + ", address=" + address + ", order_date=" + order_date + ", status=" + status + ", total_money=" + total_money + '}';
    }
    
    
}
