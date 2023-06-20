/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hoang Anh
 */
public class Layout {
    private int layout_id;
    private String layout_name;

    public Layout() {
    }

    public Layout(int layout_id, String layout_name) {
        this.layout_id = layout_id;
        this.layout_name = layout_name;
    }

    public int getLayout_id() {
        return layout_id;
    }

    public void setLayout_id(int layout_id) {
        this.layout_id = layout_id;
    }

    public String getLayout_name() {
        return layout_name;
    }

    public void setLayout_name(String layout_name) {
        this.layout_name = layout_name;
    }

    @Override
    public String toString() {
        return "Layout{" + "layout_id=" + layout_id + ", layout_name=" + layout_name + '}';
    }
    
    
}
