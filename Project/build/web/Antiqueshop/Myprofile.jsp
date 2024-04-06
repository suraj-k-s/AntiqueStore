<%-- 
    Document   : Myprofile
    Created on : 24 Feb, 2022, 10:48:50 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        
         <form method="post">
            <table border="1" align="center" cellpadding="10">
                <%
                String sels="select * from tbl_shop where shop_id='"+session.getAttribute("shopid")+"'";
               ResultSet rs=con.selectCommand(sels);
                    if(rs.next()){
                
                %>
                <tr>
                    <td colspan="2" align="center">
                        <img src="../Assets/Shopphoto/<%=rs.getString("shop_photo")%>" width="120" height="120">
                    </td>
                </tr>
                <tr>
                    <td> Shop Name</td>
                    <td><%=rs.getString("shop_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("shop_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("shop_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("shop_address")%></td>
                </tr>
                <%
                   }
                %>
            </table>
             </form>
        
    </body>
     
</html>
<%@include file="footer.jsp" %>
