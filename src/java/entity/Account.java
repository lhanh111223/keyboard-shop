/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/*      aid int IDENTITY(1,1) primary key,
	fullname nvarchar(50),
	email nvarchar(250),
	username nvarchar(50),
	[password] nvarchar(32),
	phone nvarchar(15),
	isAdmin int,
	brandID int 
 */
public class Account {
    private int id;
    private String fullname;
    private String email;
    private String username;
    private String password;
    private String phone;
    private int isAdmin;
    private Integer brandID;
    private String avatar;

    public Account() {
    }

    public Account(int id, String fullname, String email, String username, String password, String phone, int isAdmin, Integer brandID, String avatar) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.isAdmin = isAdmin;
        this.brandID = brandID;
        this.avatar = avatar;
    }
    

    public Account(int id, String fullname, String email, String username, String password, String phone, int isAdmin, Integer brandID) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.isAdmin = isAdmin;
        this.brandID = brandID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Integer getBrandID() {
        return brandID;
    }

    public void setBrandID(Integer brandID) {
        this.brandID = brandID;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", fullname=" + fullname + ", email=" + email + ", username=" + username + ", password=" + password + ", phone=" + phone + ", isAdmin=" + isAdmin + ", brandID=" + brandID + ", avatar=" + avatar + '}';
    }

    

    

    
    
}
