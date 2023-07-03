/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import daoo.AccountDAO;
import daoo.DAO;
import daoo.ManagerDAO;
import entity.Account;
import entity.Constants;
import entity.UserGoogle;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Hoang Anh
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

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
        DAO dao = new DAO();
        ManagerDAO md = new ManagerDAO();

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String remember = request.getParameter("remember");

        Cookie cuser = new Cookie("cuser", user);
        Cookie cpass = new Cookie("cpass", pass);
        Cookie crem = new Cookie("crem", remember);

        if (remember != null) {
            cuser.setMaxAge(3600 * 24);
            cpass.setMaxAge(3600 * 24);
            crem.setMaxAge(3600 * 24);
        } else {
            cuser.setMaxAge(0);
            cpass.setMaxAge(0);
            crem.setMaxAge(0);
        }

        response.addCookie(cuser);
        response.addCookie(cpass);
        response.addCookie(crem);
        
        UserGoogle userG = null;
        if (user == null || user.isEmpty()) {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            userG = getUserInfo(accessToken);
        }

        if (userG != null) {
            AccountDAO ad = new AccountDAO();
            String fullname = (String) userG.getGiven_name();
            String email = (String) userG.getEmail();
            List<Account> listAllAcc = md.getAllAccount();
            if (!ad.checkExistAccGoogle(listAllAcc, email)) {
                ad.addAccGoogle(fullname, email, email);
            } else {
                ad.updateAccGoogle(email);
            }
            user = (String) userG.getEmail();
            pass = "123";
            Account a = dao.login(user, pass);
            if (a == null) {
                request.setAttribute("mess", "username or password is incorrect");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else if (a.getIsAdmin() == 2) {
                request.setAttribute("mess", "Your account has been BLOCKED");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("acc", a);
                session.setMaxInactiveInterval(1000);
                response.sendRedirect("index");
            }
        } else {
            Account a = dao.login(user, pass);
            if (a == null) {
                request.setAttribute("mess", "username or password is incorrect");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else if (a.getIsAdmin() == 2) {
                request.setAttribute("mess", "Your account has been BLOCKED");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("acc", a);
                session.setMaxInactiveInterval(1000);
                response.sendRedirect("index");
            }
        }

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
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
