<%-- 
    Document   : organizer
    Created on : Apr 22, 2025, 8:10:14 PM
    Author     : afany
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ems.model.User"%>
<%@page import="javax.servlet.http.HttpSession"%>

    <!-- include the header file -->
    <jsp:include page="../includes/dashboard/header.jsp">
        <jsp:param name="title" value="Organizer Dashboard" />
    </jsp:include>
    
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("../auth/login.jsp");
                return;
            }
        %>
        
        <!-- SideBar -->  
        <%@include file='../includes/dashboard/organizer-sidebar.jsp'%>
    </body>
</html>
