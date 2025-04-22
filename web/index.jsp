<%-- 
    Document   : index
    Created on : Apr 22, 2025, 8:07:16 PM
    Author     : afany
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Event Management System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body class="py-5 flex flex-col justify-center w-screen items-center">
        <h1 class='text-green-400 text-2xl text-center font-medium mb-2 capitalize'>Welcome to the Centralized Event Management System</h1>

        <!-- anchor to displayStudentServlet -->

        <div class='flex items-center gap-5 p-4'>
            <a href='auth/login.jsp' class='border border-slate-200 text-medium text-black px-3 py-2 rounded-xs text-normal'>
                Sign In
            </a>
            <a href='auth/register.jsp' class='border border-slate-200 text-medium text-black px-3 py-2 rounded-xs text-normal'>
                Sign Up
            </a>
        </div>
    </body>
</html>
