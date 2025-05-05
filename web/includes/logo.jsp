<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="flex items-center gap-2">
    <!-- Logo Image -->
    <a href="<%= request.getContextPath() %>/index.jsp">
        <img 
            src="<%= request.getContextPath() %>/assets/images/logo.png" 
            alt="EMS Logo" 
            class="rounded-full h-auto w-[150px] object-contain"
        />
    </a>
</div>