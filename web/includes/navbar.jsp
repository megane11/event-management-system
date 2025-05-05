<!-- includes/header.jsp -->
<%@ page import="com.ems.util.FileUploadUtil" %>

<% String pageTitle=request.getParameter("title"); if (pageTitle==null || pageTitle.isEmpty()) {
    pageTitle="Default Title" ; } %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@include file="/includes/header.jsp" %>
        <script src="<%= request.getContextPath() %>/assets/js/navbar.js" defer></script>
        <script src="<%= request.getContextPath() %>/assets/js/register.js" defer></script>
        <title>
            <%= pageTitle %>
        </title>
    </head>

    <body class="py-5 flex flex-col gap-5 justify-center w-screen items-center">
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

                    <div class="flex gap-3 bg-secondary-bg rounded-lg px-1 h-[40px]">
                    <div class="w-full flex flex-col relative">
                        <input 
                            required
                            type="text" 
                            name="global_search" 
                            id="global_search" 
                            value="" 
                            placeholder="Search Activities" 
                            class=" placeholder:font-normal p-2 w-full bg-transparent border-2 border-border_clr focus:border-accent transition-all ease-in-out duration-600 border-none outline-none min-w-[320px] placeholder:text-slate-400 placeholder:text-sm"
                        />
                    </div> 
                    <button class="p-2">
                        <%
                            try {
                                String svg = FileUploadUtil.readFileAsString(application, "/assets/icons/search.svg");
                                out.print(svg);
                            } catch (Exception e) {
                                out.print("<!-- Error loading SVG: " + e.getMessage() + " -->");
                            }
                        %>
                    </button>
                </div>

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