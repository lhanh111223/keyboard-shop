/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import daoo.DAO;
import daoo.ManagerDAO;
import entity.Cart;
import entity.Item;
import entity.Product;
import java.io.IOException;
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
@WebServlet(name="ProcessControl", urlPatterns={"/process"})
public class ProcessControl extends HttpServlet {
   
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
        ManagerDAO md = new ManagerDAO();
        List<Product> list = dao.getAllProduct();
        Cookie arr[] = request.getCookies();
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
        Cart cart = new Cart(txt, list);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        
        int id = 0; int num = 0;
        try {
            id = Integer.parseInt(id_raw);
            Product p = dao.getProductByID(id_raw);
            int numStore = p.getQuantity();
            num = Integer.parseInt(num_raw);
            if ((num == -1 && (cart.getQuantityById(id) <= 1)) || num == 3) {
                cart.removeItem(id);
            } else {
                if (num == 1 && cart.getQuantityById(id) >= numStore) {
                    num = 0;
                }
                double price = p.getPrice() * 2;
                Item t = new Item(p, num, price);
                cart.addItem(t);

            }
        } catch (Exception e) {
        }
        
        List<Item> items = cart.getItems();
        txt = "";
        if(items.size() > 0){
            txt = items.get(0).getProduct().getId() + ":" + items.get(0).getQuantity();
            for(int i=1; i < items.size(); i++){
                txt += "/" + items.get(i).getProduct().getId() + ":" + items.get(i).getQuantity();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(3600*24*2);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
        
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
