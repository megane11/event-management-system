/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import com.ems.dao.UserDAO;
import com.ems.model.User;

/**
 *
 * @author afany
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
         // Retrieve email and password from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate user credentials using UserDAO
        UserDAO userDAO = new UserDAO();
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            // If user is valid, create a session and redirect to the dashboard
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect based on user role
            String role = user.getRole();
            if ("admin".equalsIgnoreCase(role)) {
                response.sendRedirect("dashboard/admin.jsp.jsp");
            } else if ("organizer".equalsIgnoreCase(role)) {
                response.sendRedirect("dashboard/organizer.jsp");
            }else {
                // Default redirection
                response.sendRedirect("dashboard/attendee.jsp");
            }
        } else {
            // If invalid, redirect back to login.jsp with an error message
            request.setAttribute("error", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("auth/login.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
