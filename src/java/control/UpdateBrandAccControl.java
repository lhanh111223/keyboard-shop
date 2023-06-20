/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import daoo.AccountDAO;
import daoo.FilterDAO;
import daoo.ManagerDAO;
import entity.Account;
import entity.Brand;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;
import static org.apache.tomcat.jni.User.username;

/**
 *
 * @author Hoang Anh
 */
@WebServlet(name="UpdateBrandAccControl", urlPatterns={"/updatebrandacc"})
public class UpdateBrandAccControl extends HttpServlet {
   
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
        AccountDAO ad = new AccountDAO();
        String aid = request.getParameter("aid");
        Account a = ad.getAccountProfileByID(aid);
        FilterDAO fd = new FilterDAO();
        List<Brand> listBrand = fd.getAllBrand();
        request.setAttribute("listBrand", listBrand);
        request.setAttribute("brandAcc", a);
        request.getRequestDispatcher("UpdateBrandAccount.jsp").forward(request, response);
        
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
        String brandID = request.getParameter("brandOption");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String avatar = request.getParameter("avatar");
        String aid = request.getParameter("aid");
        
        ManagerDAO mp = new ManagerDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            if (a.getIsAdmin() == 1) {
                mp.updateBrandAccount(fullname, email, username, password, phone, brandID, avatar, aid);
                request.setAttribute("messAcc", "This account has been updated successfully");
                request.getRequestDispatcher("loadmanageproduct").forward(request, response);
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("You must be login with Admin account to do this action");
        }
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
