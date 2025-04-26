/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ems.controller;

import com.ems.dao.UserDAO;
import com.ems.model.User;
import com.ems.util.DBUtil;
import com.ems.util.FileUploadUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import java.io.File;

/**
 *
 * @author afany
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 5,   // 5MB
    maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class RegisterServlet extends HttpServlet {

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
       
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String role = request.getParameter("role");
        String gender = request.getParameter("gender");

        String errorMessage = null;
        // Validate input fields
        if (name == null || name.isEmpty()) {
            errorMessage = "Name is required.";
        } else if (email == null || email.isEmpty()) {
            errorMessage = "Email is required.";
        } else if (password == null || password.isEmpty()) {
            errorMessage = "Password is required.";
        } else if (cpassword == null || cpassword.isEmpty()) {
            errorMessage = "Confirm Password is required.";
        } else if (!password.equals(cpassword)) {
            errorMessage = "Passwords do not match.";
        } else if (role == null || role.isEmpty()) {
            errorMessage = "Role is required.";
        }

        // If there is an error, redirect back to the register page with an error message
        if (errorMessage != null) {
            response.sendRedirect("auth/register.jsp?error=" + errorMessage);
            return;
        }
        // Handle profile image upload
        try{
            Part filePart = request.getPart("profile_image");
            String profileImage = FileUploadUtil.uploadFile(filePart, getServletContext());
            
            // Create a new User object
            User user = new User(name, email, password, role, gender, profileImage);

            // Register the user using UserDAO
            UserDAO userDAO = new UserDAO();
            boolean isRegistered = userDAO.registerUser(user);

            // Redirect based on the result
            if (isRegistered) {
                // Redirect to login page with a success message
                response.sendRedirect("auth/login.jsp?message=Account created successfully! Please log in.");
            } else {
                // Redirect back to register page with an error message
                response.sendRedirect("auth/register.jsp?error=Failed to create account. Please try again.");
            }

        }catch (ServletException e){
            e.printStackTrace();
            response.sendRedirect("auth/register.jsp?error=File upload failed. Please try again.");
            return;
        }catch (IOException e){
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
