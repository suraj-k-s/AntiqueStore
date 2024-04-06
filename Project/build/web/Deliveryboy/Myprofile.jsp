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
                String sels="select * from tbl_dboy where dboy_id='"+session.getAttribute("dboyid")+"'";
               ResultSet rs=con.selectCommand(sels);
                    if(rs.next()){
                
                %>
                <tr>
                    <td> Name</td>
                    <td><%=rs.getString("dboy_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("dboy_contact1")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("dboy_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("dboy_address")%></td>
                </tr>
                <%
                   }
                %>
            </table>
             </form>
        
    </body>
    
</html>
<%@include file="footer.jsp" %>
