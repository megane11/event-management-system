<%-- Document : index Created on : Apr 22, 2025, 8:07:16 PM Author : afany --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>

        <!-- include the header file -->
        <jsp:include page="includes/navbar.jsp">
            <jsp:param name="title" value="EventStar - Home" />
        </jsp:include>

        <main class="container">
            <%@include file='/includes/hero-carousel.jsp'%>
        </main>

        <script src="<%= request.getContextPath() %>/assets/js/index.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        </body>

        </html>