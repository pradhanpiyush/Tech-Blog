/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.UserTable;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author piyush
 */
@MultipartConfig
public class UpdateServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about");
            Part part = request.getPart("user_profile");

            String image_name = part.getSubmittedFileName();
 
            System.out.println("file name " +image_name);
            
            HttpSession session = request.getSession();

            UserTable user = (UserTable) session.getAttribute("current_user");

            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setAbout(about);
            
            String old_profile_name = user.getProfile();
    
            user.setProfile(image_name);

            UserDao ud = new UserDao(ConnectionProvider.getConnection());

            if (ud.updateUserData(user)) {

                String path;
                
                String oldpath;
                oldpath = request.getRealPath("/") + "pics" + File.separator + old_profile_name;
                
                if (!old_profile_name.equals("default.png")) {
                    Helper.deleteProfile(oldpath);
                }

                
                path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
               

                InputStream is = part.getInputStream();

                if (Helper.saveProfile(is, path)) {
                    Message msg = new Message("Details Successfully Update", "success", "alert-success");
                    session.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Details Successfully Update", "success", "alert-success");
                    session.setAttribute("msg", msg);
                }

            } else {
//               out.println("Update Fail");  
                Message msg = new Message("Details Update Fail", "error", "alert-danger");
                session.setAttribute("msg", msg);
            }
            response.sendRedirect("profile_page.jsp");

            out.println("</body>");
            out.println("</html>");
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
