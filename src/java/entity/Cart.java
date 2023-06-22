/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HoangAnh
 */
public class Cart {
    private List<Item> items;

    public Cart() {
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    // id cua item ~ product id
    private Item getItemById(int id){
        for(Item i : items){
            if(i.getProduct().getId() == id){
                return i;
            }
        }
        return null;
    }
    
    // get quantity of 1 item
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    
    //add item
    public void addItem(Item t){
        if(getItemById(t.getProduct().getId()) != null){
            Item existedItem = getItemById(t.getProduct().getId());
            existedItem.setQuantity(existedItem.getQuantity() + t.getQuantity());
        }else{
            items.add(t);
        }
    }
    
    // remove item
    public void removeItem(int id){
        if(getItemById(id) != null){
            items.remove(getItemById(id));
        }
    }
    
    // get total money
    public double getTotalMoney(){
        double total = 0;
        for(Item i : items){
            total += (i.getPrice() * i.getQuantity());
        }
        return total;
    }
    
    private Product getProductById(int id, List<Product> list){
        for(Product p : list){
            if(p.getId() == id){
                return p;
            }
        }
        return null;
    }
    
    // list items in Cart
    public Cart(String txt, List<Product> list){
        items = new ArrayList<>();
        try {
            if(txt != null && txt.length() != 0){
                String [] item = txt.split("/");
                for(String s : item){
                    String [] p = s.split(":");
                    int id = Integer.parseInt(p[0]);
                    int quantity = Integer.parseInt(p[1]);
                    Product product = getProductById(id, list);
                    Item t = new Item(product, quantity, product.getPrice()*(1-product.getDiscount()/100));
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
        }
    }
    
}
