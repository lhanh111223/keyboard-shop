/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import daoo.DAO;
import daoo.FilterDAO;
import daoo.ManagerDAO;
import entity.Account;
import entity.Category;
import entity.Color;
import entity.Feature;
import entity.Layout;
import entity.Material;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Hoang Anh
 */
@WebServlet(name="UpdateProductControl", urlPatterns={"/updateproduct"})
public class UpdateProductControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ManagerDAO mp = new ManagerDAO();
        FilterDAO fd = new FilterDAO();
        DAO dao = new DAO();
        
        String id = request.getParameter("id");
        request.setAttribute("pid", id);
        Product p = mp.getProductDetail(id);
        request.setAttribute("prod", p);
        
        List<Category> listC = dao.getAllCategory();
        request.setAttribute("listC", listC);
        
        //all color
        List<Color> listColor = fd.getAllColor();
        request.setAttribute("listColor", listColor);
        //all material
        List<Material> listMaterial = fd.getAllMaterial();
        request.setAttribute("listMaterial", listMaterial);
        //all layout
        List<Layout> listLayout = fd.getAllLayout();
        request.setAttribute("listLayout", listLayout);
        //all feature
        List<Feature> listFeature = fd.getAllFeature();
        request.setAttribute("listFeature", listFeature);
        
        HttpSession session = request.getSession();
        Account a = (Account)session.getAttribute("acc");
        if(a!=null){
            request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
        }else{
            PrintWriter out = response.getWriter();
            out.print("You must be login with Admin or Brand account to do this action");
        }
        
        
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        FilterDAO fd = new FilterDAO();
        DAO dao = new DAO();
        List<Category> listC = dao.getAllCategory();
        request.setAttribute("listC", listC);
        //all color
        List<Color> listColor = fd.getAllColor();
        request.setAttribute("listColor", listColor);
        //all material
        List<Material> listMaterial = fd.getAllMaterial();
        request.setAttribute("listMaterial", listMaterial);
        //all layout
        List<Layout> listLayout = fd.getAllLayout();
        request.setAttribute("listLayout", listLayout);
        //all feature
        List<Feature> listFeature = fd.getAllFeature();
        request.setAttribute("listFeature", listFeature);
        
        String id = request.getParameter("id");
        request.setAttribute("pid", id);
        String brandID = request.getParameter("brandID");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String intro = request.getParameter("intro");
        String desc = request.getParameter("description");
        String cateID = request.getParameter("category");
        String quantity = request.getParameter("quantity");
        String discount = request.getParameter("discount");
        String sold = request.getParameter("sold");
        String image = request.getParameter("image");
        String color = request.getParameter("color");
        String material = request.getParameter("material");
        String layout = request.getParameter("layout");
        String connect = request.getParameter("connect");
        
        
        ManagerDAO mp = new ManagerDAO();
        mp.updateProduct(name, price, quantity, sold, image, intro, desc, cateID, brandID, discount, color, material, layout, connect, id);
        Product p = mp.getProductDetail(id);
        request.setAttribute("prod", p);
        request.setAttribute("mess", "Your product has been UPDATE successfully");
        
        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
