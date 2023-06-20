/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import daoo.DAO;
import daoo.FilterDAO;
import daoo.SortDAO;
import entity.Brand;
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
import java.util.List;

/**
 *
 * @author Hoang Anh
 */
@WebServlet(name = "SortProductControl", urlPatterns = {"/sortproduct"})
public class SortProductControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
        
        SortDAO sd = new SortDAO();
        DAO dao = new DAO();
        // Load data default
        List<Category> listC = dao.getAllCategory();
        List<Product> listLast = dao.getLast();
        // set data to JSP
        request.setAttribute("listC", listC);
        request.setAttribute("listLP", listLast);

        String cid = request.getParameter("cid");
        request.setAttribute("tag", cid);

        String txt = request.getParameter("textSearch");
        request.setAttribute("textSearch", txt);

        String option = request.getParameter("optionSort");
        switch (option) {
            case "1":
                request.setAttribute("option", "Price Ascending");
                break;
            case "2":
                request.setAttribute("option", "Price Descending");
                break;
            case "3":
                request.setAttribute("option", "Latest");
                break;
            case "4":
                request.setAttribute("option", "Sold");
                break;
            default:
                throw new AssertionError();
        }
        
        String minPrice = request.getParameter("minP");
        if(minPrice.isEmpty()){
            minPrice = "0";
        }
        String maxPrice = request.getParameter("maxP");
        if(maxPrice.isEmpty()){
            maxPrice = "1000";
        }
        String[] brand = request.getParameterValues("brandA");
        String[] color = request.getParameterValues("colorA");
        String[] layout = request.getParameterValues("layoutA");
        String[] connect = request.getParameterValues("connectA");
        String[] material = request.getParameterValues("materialA");
        request.setAttribute("brandA", brand);
        request.setAttribute("colorA", color);
        request.setAttribute("layoutA", layout);
        request.setAttribute("connectA", connect);
        request.setAttribute("materialA", material);
        

        List<Product> list = sd.sortProduct(brand, minPrice, maxPrice, color, layout, connect, material, cid, txt, option);
        request.setAttribute("listP", list);

        request.getRequestDispatcher("ShopGrid.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
