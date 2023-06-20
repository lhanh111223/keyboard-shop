/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hoang Anh
 */
public class Feature {
    private int feature_id;
    private String feature_name;

    public Feature() {
    }

    public Feature(int feature_id, String feature_name) {
        this.feature_id = feature_id;
        this.feature_name = feature_name;
    }

    public int getFeature_id() {
        return feature_id;
    }

    public void setFeature_id(int feature_id) {
        this.feature_id = feature_id;
    }

    public String getFeature_name() {
        return feature_name;
    }

    public void setFeature_name(String feature_name) {
        this.feature_name = feature_name;
    }

    @Override
    public String toString() {
        return "Feature{" + "feature_id=" + feature_id + ", feature_name=" + feature_name + '}';
    }
    
    
}
