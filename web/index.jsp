<%-- 
    Document   : index
    Created on : Apr 22, 2025, 8:07:16 PM
    Author     : afany
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- include the header file -->
<jsp:include page="includes/navbar.jsp">
    <jsp:param name="title" value="Home Page"/>
</jsp:include>

<main>
    <h1 class='text-green-400 text-2xl text-center font-medium mb-2 capitalize'>Welcome to the Centralized Event Management System, EventStar</h1>

    <!-- anchor to displayStudentServlet -->

    <div class='flex items-center gap-5 p-4'>
        <a href='auth/login.jsp' class='border border-slate-200 text-medium text-black px-3 py-2 rounded-xs text-normal'>
            Sign In
        </a>
        <a href='auth/register.jsp' class='border border-slate-200 text-medium text-black px-3 py-2 rounded-xs text-normal'>
            Sign Up
        </a>
    </div>
</main>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
