/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import daoo.DAO;
import daoo.FilterDAO;
import entity.Brand;
import entity.Category;
import entity.Color;
import entity.Feature;
import entity.Layout;
import entity.Material;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Hoang Anh
 */
@WebServlet(name="SearchControl", urlPatterns={"/search"})
public class SearchControl extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DAO dao = new DAO();
        List<Category> listC = dao.getAllCategory();
        List<Product> listLast = dao.getLast();
        // set data to JSP
        request.setAttribute("listC", listC);
        request.setAttribute("listLP", listLast);
        String text = request.getParameter("textSearch");
        List<Product> list = dao.searchByname(text);
        request.setAttribute("listP", list);

        //filter
        //all brand
        FilterDAO fd = new FilterDAO();
        List<Brand> listBrand = fd.getAllBrand();
        request.setAttribute("listBrand", listBrand);
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
        
        //send
        request.getRequestDispatcher("ShopGrid.jsp").forward(request, response);
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
        processRequest(request, response);
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
