<%-- 
    Document   : UserReport
    Created on : 17 Apr, 2022, 7:57:09 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>  
<%//@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Report</title>
        <link rel="stylesheet" href="form.css">
        <style>
            .red{
                text-align: center;
                color: red;
            }
        </style>
        <%@include file="header.jsp" %>
    </head>


    <body>
        <h1>User New List</h1>
        <table border="1" cellpadding="10" align="center">
            <tr>
                <th>Sl.No</th>
                <th>User Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Address</th>
                <
            </tr>
            <%
                String sel = "select * from tbl_customer ";
                ResultSet rs = con.selectCommand(sel);
                //out.println(sel);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("customer_name")%></td>
                <td><%=rs.getString("customer_contact")%></td>
                <td><%=rs.getString("customer_email")%></td>
                <td><%=rs.getString("customer_address")%></td>
               
            </tr>  
            <%
                }

            %>
        </table>
    </body>
    <%@include file="footer.jsp" %>
</html>
