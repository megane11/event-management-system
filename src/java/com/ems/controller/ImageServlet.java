/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ems.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author afany
 */

@WebServlet("/uploads/*")
public class ImageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the requested file name from the URL path
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Remove the leading slash
        String filename = pathInfo.substring(1);
        
        // Navigate to project root from build directory
        String buildPath = getServletContext().getRealPath("");
        File buildDir = new File(buildPath);
        File projectRoot = buildDir.getParentFile().getParentFile();
        
        // Create the full file path
        String filePath = projectRoot.getAbsolutePath() + File.separator + "uploads" + File.separator + filename;
        File file = new File(filePath);
        
        // Check if file exists
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Set content type based on file extension
        String contentType = getServletContext().getMimeType(filename);
        if (contentType == null) {
            contentType = "application/octet-stream";
        }
        response.setContentType(contentType);
        
        // Set content length
        response.setContentLength((int)file.length());
        
        // Copy the file to the response output stream
        try (FileInputStream in = new FileInputStream(file);
            OutputStream out = response.getOutputStream()) {
            
            byte[] buffer = new byte[4096];
            int bytesRead;
            
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
