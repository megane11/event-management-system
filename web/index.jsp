<%-- Document : index Created on : Apr 22, 2025, 8:07:16 PM Author : afany --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>

        <!-- include the header file -->
        <jsp:include page="includes/navbar.jsp">
            <jsp:param name="title" value="EventStar - Home" />
        </jsp:include>

        <!-- Slider -->
        <%@include file='/includes/hero-carousel.jsp'%>

        <!-- upcoming events section -->
        <section class="flex flex-col gap-4 border h-[90vh]">
            <div class="flex flex-col gap-4">
                <h1>Upcoming Events Section</h1>

                <div class="grid grid-cols-3">
                    <div>
                        <img src="" alt="">
                        text
                    </div>
                </div>
            </div>

         </section>

        <script src="<%= request.getContextPath() %>/assets/js/index.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        </body>

        </html>