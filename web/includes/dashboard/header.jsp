<!-- includes/header.jsp -->
<%@ page import="com.ems.util.FileUploadUtil" %>

<% String pageTitle=request.getParameter("title"); if (pageTitle==null || pageTitle.isEmpty()) {
    pageTitle="Default Title" ; } %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@include file="/includes/header.jsp" %>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles/sidebar.css">

        <script src="<%= request.getContextPath() %>/assets/js/sidebar.js" defer></script>

        <title>
            <%= pageTitle %>
        </title>

        <style>
            svg {
                flex-shrink: 0;
                /*prevent size distortion */
                fill: var(--text-clr)
            }
        </style>
    </head>

    <body class="py-5 flex flex-col gap-5 justify-center w-screen items-center">
        <header class="flex w-full justify-between px-4 items-center bg-white ">
            <div class="flex gap-3 items-center">
                <!-- logo -->
                <%@include file="/includes/logo.jsp" %>
                
                <button onclick=toggleSideBar() id="toggle-btn" class="text-secondary">
                    <%
                        try {
                            String svg = FileUploadUtil.readFileAsString(application, "/assets/icons/keyboard_double_arrow_left.svg");
                            out.print(svg);
                        } catch (Exception e) {
                            out.print("<!-- Error loading SVG: " + e.getMessage() + " -->");
                        }
                    %>
                </button>

                <!-- Search bar -->

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
            </div>
            <nav class="flex gap-4 items-center">
                <div class="flex gap-5 items-center">
                    <a class="text-[#b5b6b6bd] text-[18px]" href="">
                        <i class="fas fa-phone relative">
                            <span class="absolute border rounded-full size-[12px] top-[-20%] right-[-35%]"
                                id="call_indicator"></span>
                        </i>
                    </a>
                    <a class="text-[#b5b6b6bd] text-[18px]" href="">
                        <i class="fas fa-message relative">
                            <span class="absolute border rounded-full size-[12px] top-[-20%] right-[-35%]"
                                id="mail_indicator"></span>
                        </i>
                    </a>
                    <a class="text-[#b5b6b6bd] text-[18px]" href="">
                        <i class="fas fa-bell relative">
                            <span class="absolute border rounded-full size-[12px] top-[-20%] right-[-35%]"
                                id="notification_indicator"></span>
                        </i>
                    </a>
                </div>
                <%@include file='../profile-info.jsp'%>
            </nav>
        </header>



 