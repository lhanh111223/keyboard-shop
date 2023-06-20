/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hoang Anh
 */
public class Material {
    private int material_id;
    private String material_name;

    public Material() {
    }

    public Material(int material_id, String material_name) {
        this.material_id = material_id;
        this.material_name = material_name;
    }

    public int getMaterial_id() {
        return material_id;
    }

    public void setMaterial_id(int material_id) {
        this.material_id = material_id;
    }

    public String getMaterial_name() {
        return material_name;
    }

    public void setMaterial_name(String material_name) {
        this.material_name = material_name;
    }

    @Override
    public String toString() {
        return "Material{" + "material_id=" + material_id + ", material_name=" + material_name + '}';
    }
    
    
}
