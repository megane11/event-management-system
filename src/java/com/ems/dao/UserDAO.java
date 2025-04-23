/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ems.dao;

import com.ems.util.DBUtil;
import com.ems.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author afany
 */
public class UserDAO {
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (name, email, password, role, gender, profile_image) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword()); // Password should be hashed
            stmt.setString(4, user.getRole());
            stmt.setString(5, user.getGender());

            // Set profileImage or null to let the database use its default value
            if (user.getProfileImage() != null && !user.getProfileImage().isEmpty()) {
                stmt.setString(6, user.getProfileImage());
            } else {
                stmt.setNull(6, java.sql.Types.VARCHAR);
            }

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0; // Return true if the user was successfully registered
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Login a user

    public User loginUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password); // Password should ideally be hashed

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Create a User object from the result set
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getString("gender"));
                user.setProfileImage(rs.getString("profile_image"));
                user.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Return null if no user is found
    }
}
