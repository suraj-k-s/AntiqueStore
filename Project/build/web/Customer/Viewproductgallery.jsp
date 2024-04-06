<%-- 
    Document   : Viewproductgallery
    Created on : 15 Mar, 2022, 12:46:42 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product Gallery</title>
    </head>
    <%@include file="header.jsp" %>
    <body>

        <form method="POST">
            <table align="center" cellpadding="10">
                <%
                    int i = 0;
                    String sel1 = "select * from tbl_pgallery where product_id='" + request.getParameter("pid") + "'";
                    ResultSet rsp2 = con.selectCommand(sel1);
                    while (rsp2.next()) {
                        i++;
                %>
                <td>
                    <p>
                        <img src="../Assets/Productphoto/<%=rsp2.getString("pgallery_image")%>" width="150" height="150"><br>
                        Caption:<%=rsp2.getString("pgallery_caption")%><br>
                    </p>
                </td>
                <%
                        if (i == 4) {
                            out.println("</tr>");
                            i = 0;
                            out.println("<tr>");
                        }
                    }
                %>
            </table>
        </form>
    </body>

</html>
<%@include file="footer.jsp" %>
