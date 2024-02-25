<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("customerid") == null)
        {
            response.sendRedirect("../");
        }
    %>