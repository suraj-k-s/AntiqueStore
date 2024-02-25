<%-- 
    Document   : Login
    Created on : 24 Feb, 2022, 10:25:44 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="tab">

            <%
                if (request.getParameter("btnlogin") != null) {
                    String sela = "select * from tbl_admin where admin_username='" + request.getParameter("txtemail") + "' and admin_password='" + request.getParameter("txtpassword") + "'";
                    ResultSet rs = con.selectCommand(sela);

                    String selu = "select * from tbl_customer where customer_email='" + request.getParameter("txtemail") + "' and customer_password='" + request.getParameter("txtpassword") + "'";
                    ResultSet rsu = con.selectCommand(selu);

                    String sels = "select * from tbl_shop where shop_email='" + request.getParameter("txtemail") + "' and shop_password='" + request.getParameter("txtpassword") + "' and shop_isactive=1";
                    ResultSet rss = con.selectCommand(sels);

                    String seld = "select * from tbl_dboy where dboy_email='" + request.getParameter("txtemail") + "' and dboy_password='" + request.getParameter("txtpassword") + "'";
                    ResultSet rsd = con.selectCommand(seld);

                    if (rs.next()) {
                        session.setAttribute("adminid", rs.getString("admin_id"));
                        response.sendRedirect("../Admin/HomePage.jsp");
                    }
                    if (rsu.next()) {
                        session.setAttribute("customerid", rsu.getString("customer_id"));
                        session.setAttribute("customername", rsu.getString("customer_name"));
                        response.sendRedirect("../Customer/Homepage.jsp");
                    } else if (rss.next()) {
                        session.setAttribute("shopid", rss.getString("shop_id"));
                        session.setAttribute("shopname", rss.getString("shop_name"));
                        response.sendRedirect("../Antiqueshop/Homepage.jsp");
                    } else if (rsd.next()) {
                        session.setAttribute("dboyid", rsd.getString("dboy_id"));
                        session.setAttribute("dboyname", rsd.getString("dboy_name"));
                        response.sendRedirect("../Deliveryboy/Homepage.jsp");
                    } else {
            %>
            <script>alert('Invalid Username and Password')</script>
            <%
                    }

                }
            %>
            <form method="post">
                <table border="1" align="center" cellpadding="10">
                    <tr>
                        <td>Email/Contact</td>
                        <td><input type="text" name="txtemail" required="" value=""></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword" required="" value=""></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="btnlogin" value="Login"></td>
                    </tr>
                </table>
            </form>
    </body>

</html>
<%@include file="footer.jsp" %>