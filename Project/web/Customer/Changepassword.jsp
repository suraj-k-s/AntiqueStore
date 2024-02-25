<%-- 
    Document   : Changepassword
    Created on : 24 Feb, 2022, 11:04:50 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <%@include file="SessionValidator.jsp" %>
    </head>
    <%@include file="header.jsp" %>
    <body>

        <%            if (request.getParameter("btnedit") != null) {
                String selu = "select * from tbl_customer where customer_password='" + request.getParameter("txtcurntpassword") + "' and customer_id='" + session.getAttribute("customerid") + "'";
                ResultSet rsu = con.selectCommand(selu);
                System.out.println(selu);
                if (rsu.next()) {
                    String up = "update tbl_customer set customer_password='" + request.getParameter("txtnewpassword") + "' where customer_id='" + session.getAttribute("customerid") + "'";
                    con.executeCommand(up);
                    response.sendRedirect("Changepassword.jsp");
                } else {
        %>
        <script type="text/javascript">
            alert("Password missmatches...");
            setTimeout(function() {
                window.location.href = 'changepassword.jsp';
            }, 40);//40millisecend it go to next page
        </script>
        <%
                }
            }
        %>

        <h1 align="center">Change Password</h1>
        <form method="post" >
            <table border="1" cellpadding="10" align="center">
                <tr>
                    <th>Current Password</th><td><input type="password" name="txtcurntpassword"></td></tr>
                <tr> <th>New Password</th><td><input type="password" name="txtnewpassword"></td></tr>
                <tr> <th>Confirm Password</th><td><input type="password" name="txtconfirm"></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="btnedit" value="Change"></td>

                </tr>
            </table>
        </form>
    </body>

</html>
<%@include file="footer.jsp" %>
