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
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;

public class FileUploadUtil {

    public static String uploadFile(Part filePart, ServletContext context) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null; // No file uploaded
        }

        // Validate file type
        String contentType = filePart.getContentType();
        if (!contentType.startsWith("image/")) {
            throw new IOException("Invalid file type. Only images are allowed.");
        }

        // Generate a safe file name
        String originalName = filePart.getSubmittedFileName();
        String safeName = originalName.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
        String fileName = UUID.randomUUID().toString() + "_" + safeName;

        // Get uploads directory (outside build folder)
        String projectPath = context.getRealPath("/");
        File webRoot = new File(projectPath);
        File projectRoot = webRoot.getParentFile().getParentFile();
        File uploadDir = new File(projectRoot, "uploads");

        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create uploads directory if it doesn't exist
        }

        // Save the file
        filePart.write(uploadDir.getAbsolutePath() + File.separator + fileName);

        // Return the relative path to store in the DB (you will serve from /uploads/filename)
        return "uploads/" + fileName;
    }
}
