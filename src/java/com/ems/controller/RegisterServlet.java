/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ems.controller;

import com.ems.dao.UserDAO;
import com.ems.model.User;
import com.ems.util.DBUtil;

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
        String role = request.getParameter("role");
        String gender = request.getParameter("gender");

        // Handle profile image upload

        try{
            Part filePart = request.getPart("profile_image");
            String profileImage = null;

            if (filePart != null && filePart.getSize() > 0) {
                String originalName = filePart.getSubmittedFileName();
                String safeName = originalName.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
                String fileName = UUID.randomUUID().toString() + "_" + safeName;

                // Validate file type
                String contentType = filePart.getContentType();
                if (!contentType.startsWith("image/")) {
                    throw new ServletException("Invalid file type. Please upload an image.");
                }

                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                filePart.write(uploadPath + File.separator + fileName);
                profileImage = "uploads/" + fileName; // Store this in DB
            }
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
