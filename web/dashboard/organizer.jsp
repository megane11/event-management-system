<%-- 
    Document   : organizer
    Created on : Apr 22, 2025, 8:10:14 PM
    Author     : afany
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ems.model.User"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Organizer Dashboard</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("../auth/login.jsp");
                return;
            }
        %>
        <h1>Welcome, Organizer <%= user.getName() %>!</h1>
        <!-- image -->
        <img src="<%= user.getProfileImage() %>" alt="Profile Image" class="rounded-full w-32 h-32">
        <p>Profile Image: <%= user.getProfileImage() %></p>
        <p>Email: <%= user.getEmail() %></p>
        <p>This is the organizer dashboard.</p>

        <p><a href="../LogoutServlet">Logout</a></p>
    </body>
</html>
