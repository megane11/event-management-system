/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ems.util;

/**
 *
 * @author afany
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Part;

public class FileUploadUtil {

    public static String uploadFile(Part filePart, ServletContext context) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String originalName = filePart.getSubmittedFileName();
            String safeName = originalName.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
            String fileName = UUID.randomUUID().toString() + "_" + safeName;

            // Validate file type
            String contentType = filePart.getContentType();
            if (!contentType.startsWith("image/")) {
                throw new IOException("Invalid file type. Only images are allowed.");
            }

            // Get path to build directory first
            String buildPath = context.getRealPath("");
            
            // Navigate to project root (up from build/web to project root)
            File buildDir = new File(buildPath);
            File projectRoot = buildDir.getParentFile().getParentFile();
            
            // Create uploads directory in project root
            String uploadPath = projectRoot.getAbsolutePath() + File.separator + "uploads";
            
            System.out.println("Upload Path: " + uploadPath);
            File uploadDir = new File(uploadPath);
            
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Save the file
            filePart.write(uploadPath + File.separator + fileName);
            
            return fileName;
        }

        return null; // No file uploaded
    }

    public static String readFileAsString(ServletContext context, String relativePath) throws IOException {
        String fullPath = context.getRealPath(relativePath);
        return new String(Files.readAllBytes(Paths.get(fullPath)));
    }
}
