<%-- 
    Document   : Productgallery
    Created on : 5 Mar, 2022, 1:57:15 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Gallery</title>
    </head>
    <%@include file="header.jsp" %>
    <body>

        <%

            if (request.getParameter("aid") != null) {
                String del = "delete from tbl_pgallery where pgallery_id='" + request.getParameter("aid") + "'";
                con.executeCommand(del);
                response.sendRedirect("Productgallery.jsp");
            }
        %>
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Galleryuploadaction.jsp">
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="txtimage"  required=""></td>
                </tr>
                <tr>
                    <td>Caption</td>
                    <td><input type="text" name="txtcap" required="" value=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="SAVE"><input type="reset" name="btncancel" value="CANCEL"></td> 
                </tr>

            </table>
        </form>
        <table border="1" align="center">

            <tr>
                <td>Sl.no</td>
                <td>Caption</td>
                <td>Image</td>
                <td>Action</td>
            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_pgallery where product_id='"+session.getAttribute("pid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("pgallery_caption")%></td>
                <td><img src="../Assets/Productphoto/<%=rs.getString("pgallery_image")%>" width="120" height="120"></td>
                <td><a href="Productgallery.jsp?aid=<%=rs.getString("pgallery_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>

</html>
<%@include file="footer.jsp" %>
