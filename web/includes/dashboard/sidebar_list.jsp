<%@page import="com.ems.util.FileUploadUtil"%>

<% String pageTitle=request.getParameter("title"); 
    if (pageTitle==null || pageTitle.isEmpty()) {
    pageTitle="Default Title" ; } 

    String active=request.getParameter("class"); 
    if (active==null || active.isEmpty()) {
    active="" ; } 
    String svgPath = request.getParameter("svg");
%>

<li class="<%= active %>" title="<%= pageTitle %>">
    <a href="">
        <%
            try {
                String svg = FileUploadUtil.readFileAsString(application, "/assets/icons/"+ svgPath +".svg");
                out.print(svg);
            } catch (Exception e) {
                out.print("<!-- Error loading SVG: " + e.getMessage() + " -->");
            }
        %>
        <span><%= pageTitle %></span>
    </a>
</li>