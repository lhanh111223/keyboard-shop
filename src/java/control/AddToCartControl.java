/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import daoo.DAO;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author HoangAnh
 */
@WebServlet(name="AddToCartControl", urlPatterns={"/addtocart"})
public class AddToCartControl extends HttpServlet {
   
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
        DAO dao = new DAO();
        List<Product> listAll = dao.getAllProduct();
        Cookie [] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for(Cookie o : arr){
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String num = request.getParameter("num");
        String id = request.getParameter("id");
        if(txt.isEmpty()){
            txt = id + ":" + num;
        }else{
            txt = txt + "/" + id + ":" + num;
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(3600*24*2);
        response.addCookie(c);
        Cart cart = new Cart(txt, listAll);
        int size = cart.getItems().size();
        request.setAttribute("listItems", cart.getItems());
        request.setAttribute("size", size);
        request.setAttribute("pid", id);
        request.setAttribute("numI", num);
        request.getRequestDispatcher("shopgrid").forward(request, response);
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
        DAO dao = new DAO();
        List<Product> listAll = dao.getAllProduct();
        Cookie [] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for(Cookie o : arr){
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String num = request.getParameter("num");
        String id = request.getParameter("id");
        if(txt.isEmpty()){
            txt = id + ":" + num;
        }else{
            txt = txt + "/" + id + ":" + num;
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(3600*24*2);
        response.addCookie(c);
        Cart cart = new Cart(txt, listAll);
        int size = cart.getItems().size();
        request.setAttribute("listItems", cart.getItems());
        request.setAttribute("size", size);
        request.setAttribute("pid", id);
        request.setAttribute("numI", num);
        request.getRequestDispatcher("detail?pid="+id).forward(request, response);
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
