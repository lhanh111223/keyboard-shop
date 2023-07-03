/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import daoo.DAO;
import daoo.OrderDAO;
import entity.Brand;
import entity.Category;
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
 * @author HoangAnh
 */
@WebServlet(name="DashboardControl", urlPatterns={"/dashboard"})
public class DashboardControl extends HttpServlet {
   
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
        OrderDAO od = new OrderDAO();
        DAO dao = new DAO();
        
        String bid = request.getParameter("bid");
        String year = request.getParameter("year");
        List<Brand> listBrand = od.getRevenueByYear(bid, year);
        request.setAttribute("listBrand", listBrand);
        request.setAttribute("tag", year);
        List<Category> listCate = od.getRevenueByCate(bid);
        request.setAttribute("listCate", listCate);
        List<Category> listCateView = od.getViewByCate(bid);
        request.setAttribute("listCateView", listCateView);
        List<Product> listTopSell = od.getTopSellingProdByCate(bid);
        request.setAttribute("listTopSell", listTopSell);
        List<Product> listTopInStock = od.getTopInStockProdByCate(bid);
        request.setAttribute("listTopInStock", listTopInStock);
        List<Category> c = dao.getAllCategory();
        for(int i=0; i<c.size(); i++){
            List<Category> cate = od.getRevenueByCateForBrand(c.get(i).getCid()+"", bid, year);
            request.setAttribute("listCateRevenue"+(i+1), cate);
        }
        
        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
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
