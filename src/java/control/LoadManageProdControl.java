/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import daoo.DAO;
import daoo.FilterDAO;
import daoo.ManagerDAO;
import entity.Account;
import entity.Brand;
import entity.Category;
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
@WebServlet(name = "LoadManageProdControl", urlPatterns = {"/loadmanageproduct"})
public class LoadManageProdControl extends HttpServlet {

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
        ManagerDAO mp = new ManagerDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            if (a.getBrandID() != 0 && a.getIsAdmin() == 0) {
                String bid = request.getParameter("bid");
                List<Product> list = mp.getProductByBrand(bid);
                request.setAttribute("list", list);
                request.getRequestDispatcher("ListProducts.jsp").forward(request, response);
            } else if (a.getBrandID() == 0 && a.getIsAdmin() == 1){
                DAO dao = new DAO();
                List<Category> listCate = dao.getAllCategory();
                request.setAttribute("listCate", listCate);
                FilterDAO fd = new FilterDAO();
                List<Brand> listBrand = fd.getAllBrand();
                request.setAttribute("listBrand", listBrand);
                List<Product> list = mp.loadAllProduct();
                List<Account> listA = mp.getAllAccount();
                request.setAttribute("listA", listA);
                request.setAttribute("list", list);
                request.getRequestDispatcher("ListProducts.jsp").forward(request, response);
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("You must be login with Admin or Brand account to do this action");
        }
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
