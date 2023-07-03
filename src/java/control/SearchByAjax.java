/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import daoo.DAO;
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
 * @author HoangAnh
 */
@WebServlet(name = "SearchByAjax", urlPatterns = {"/searchajax"})
public class SearchByAjax extends HttpServlet {

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
        String txtSearch = request.getParameter("txtSearch");//giay chay bo
        DAO dao = new DAO();
        List<Product> list = dao.searchByname(txtSearch);
        PrintWriter out = response.getWriter();
        for (Product o : list) {
            out.println("<div class=\"col-lg-4 col-md-6 col-sm-6 eachitem\">\n"
                    + "                                        <div class=\"product__item\">\n"
                    + "                                            <div class=\"product__item__pic set-bg\" data-setbg=\""+o.getImage()+"\">\n"
                     +"<img src=\""+o.getImage()+"\" alt=\"alt\"/>\n"       
                    + "                                                <ul class=\"product__item__pic__hover\">\n"
                    + "                                                    <li><a href=\"detail?pid="+o.getId()+"\"><i class=\"fa fa-eye\"></i></a></li>\n"
                    + "                                                    <li><a onclick=\"alertAdd()\" href=\"addtocart?id="+o.getId()+"&num=1\"><i class=\"fa fa-shopping-cart\"></i></a></li>\n"
                    + "                                                </ul>\n"
                    + "                                            </div>\n"
                    + "                                            <div class=\"product__item__text\">\n"
                    + "                                                <h6><a href=\"detail?pid="+o.getId()+"\">"+o.getName()+"</a></h6>\n"
                    + "                                                <h5>"+o.getPrice()+" $</h5>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>");
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
