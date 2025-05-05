<!-- includes/header.jsp -->
<% String pageTitle=request.getParameter("title"); if (pageTitle==null || pageTitle.isEmpty()) {
    pageTitle="Default Title" ; } %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@include file="/includes/header.jsp" %>
        <script src="<%= request.getContextPath() %>/assets/js/navbar.js" defer></script>
        <title>
            <%= pageTitle %>
        </title>
    </head>

    <body class="py-5 flex flex-col justify-center w-screen items-center">
        <header class="w-full flex flex-col z-20 shadow-xs">
            
            <nav class="container flex items-center justify-around md:justify-between py-1 px-3 relative z-10 bg-white">
                <!-- <button type="button"
                    class="btn flexbox gap-2 text-xl md:hidden z-10 min-w-fit min-h-fit">
                    <span><i class='fas fa-bars'></i></span>
                </button> -->
                <!-- Logo -->
                <%@include file="/includes/logo.jsp" %>

                <div id="navbar"
                    class="absolute left-[-250%] top-[100%] transition-all duration-500 ease-in-out bg-accent-light flex flex-col justify-center min-w-[300px] min-h-[60vh] md:min-h-fit md:bg-transparent md:static md:left-auto md:flex-row md:flex-end items-start md:w-auto md:items-center md:justify-between z-1">
                    <ul
                        class="flex flex-col md:flex-row justify-between gap-6 sm:gap-2 sm:mr-0 md:items-center h-full space-x-5 mb-4 md:mb-0 lg:mr-36">

                        <!-- Search component -->

                        <li class="list-item"><a href="">Events</a></li>
                        <li class="list-item"><a href="">Create Event</a></li>
                    </ul>
                    <div class="flex flex-col ml-1 md:flex-row md:gap-[2px] items-center">
                        <a href="<%= request.getContextPath() %>/auth/login.jsp">
                            <button type="button"
                                class="btn flexbox gap-2 bg-transparent text-black min-w-fit hover:bg-accent-light w-[90px]"
                            >
                            Login                     
                            </button>
                        </a>
                        <a href="<%= request.getContextPath() %>/auth/register.jsp">
                            <button type="button"
                                class="btn flexbox gap-2 bg-accent text-white min-w-fit rounded-[2px] hover:opacity-80 w-[90px]"
                            >
                            Sign Up                     
                            </button>
                        </a>
                    </div>
                </div>
            </nav>
        </header>