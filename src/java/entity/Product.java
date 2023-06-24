/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hoang Anh
 */
public class Product {

    private int id;
    private String name;
    private double price;
    private int quantity;
    private int sold;
    private String image;
    private String intro;
    private String description;
    private Category category;
    private Brand brand;
    private double discount;
    private ProductDetail productDetail;
    
    

    public Product() {
    }

    public Product(int id, String name, double price, int quantity, int sold, String image, String intro, String description, Category category, Brand brand, double discount) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.sold = sold;
        this.image = image;
        this.intro = intro;
        this.description = description;
        this.category = category;
        this.brand = brand;
        this.discount = discount;
    }

    public Product(int id, String name, double price, int quantity, int sold, String image, String intro, String description, Category category, Brand brand, double discount, ProductDetail productDetail) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.sold = sold;
        this.image = image;
        this.intro = intro;
        this.description = description;
        this.category = category;
        this.brand = brand;
        this.discount = discount;
        this.productDetail = productDetail;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", sold=" + sold + ", image=" + image + ", intro=" + intro + ", description=" + description + ", category=" + category + ", brand=" + brand + '}';
    }
    
    

    
    
    
}
