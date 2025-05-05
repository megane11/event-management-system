<aside id="sidebar" class="h-[100vh] top-0 bg-white">
    <ul>
        <h2 class="text-lg py-2 text-secondary">Main</h2>

        <jsp:include page="../includes/dashboard/sidebar_list.jsp">
            <jsp:param name="title" value="Dashboard" />
            <jsp:param name="svg" value="dashboard" />
            <jsp:param name="class" value="active" />
        </jsp:include>
        
        <jsp:include page="../includes/dashboard/sidebar_list.jsp">
            <jsp:param name="title" value="Home" />
            <jsp:param name="svg" value="home" />
        </jsp:include>

        <jsp:include page="../includes/dashboard/sidebar_list.jsp">
            <jsp:param name="title" value="My Events" />
            <jsp:param name="svg" value="calendar_month" />
        </jsp:include>

        <jsp:include page="../includes/dashboard/sidebar_list.jsp">
            <jsp:param name="title" value="Profile" />
            <jsp:param name="svg" value="profile" />
        </jsp:include>

    </ul>
</aside>
