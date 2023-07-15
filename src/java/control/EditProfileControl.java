/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import daoo.AccountDAO;
import entity.Account;
import entity.Order;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Hoang Anh
 */
@WebServlet(name = "EditProfileControl", urlPatterns = {"/editprofile"})
public class EditProfileControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccountDAO ad = new AccountDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        Account act = ad.getActivity(a.getUsername());
        request.setAttribute("act", act);
        List<Order> listOrder = ad.getOrderDetailForUser(a.getId()+"","","","");
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
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
        String avatar = request.getParameter("avatar");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        HttpSession session = request.getSession();

        AccountDAO ad = new AccountDAO();

        ad.editProfile(username, fullname, email, phone, avatar);
        Account acc = ad.getAccountProfile(username);

        session.setAttribute("acc", acc);
        request.setAttribute("acc", acc);
        request.setAttribute("mess", "Your profile has been changed successfully");

        Account act = ad.getActivity(acc.getUsername());
        request.setAttribute("act", act);
        
        String day = request.getParameter("day");
        request.setAttribute("day", day);
        String month = request.getParameter("month");
        request.setAttribute("month", month);
        String year = request.getParameter("year");
        request.setAttribute("year", year);
        List<Order> listOrder = ad.getOrderDetailForUser(acc.getId()+"", day, month, year);
        request.setAttribute("listOrder", listOrder);
        
        request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
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
