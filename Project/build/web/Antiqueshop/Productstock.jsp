<%-- 
    Document   : Productstock
    Created on : 5 Mar, 2022, 3:00:48 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Stock</title>
    </head>
    <%@include file="header.jsp" %>
    <%

        if (request.getParameter("btnUpdate") != null) {
            String sel = "select * from tbl_productstock where product_id='" + request.getParameter("pid") + "'";
            ResultSet rs = con.selectCommand(sel);
            if (rs.next()) {
                int stock = Integer.parseInt(rs.getString("pstock_qty"));
                stock = stock + Integer.parseInt(request.getParameter("txtstock"));
                String up = "update tbl_productstock set pstock_qty='" + stock + "' where product_id='" + request.getParameter("pid") + "'";
                con.executeCommand(up);
            } else {
                //out.print("hii");
                String ins = "insert into tbl_productstock(product_id,pstock_qty)values('" + request.getParameter("pid") + "','" + request.getParameter("txtstock") + "')";
                con.executeCommand(ins);


            }
            response.sendRedirect("Addproduct.jsp");
        }
    %>
    <%
        String selProduct = "select * from tbl_product where product_id='" + request.getParameter("pid") + "'";
        ResultSet rsproduct = con.selectCommand(selProduct);
        if (rsproduct.next()) {
    %>


    <body>

        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <td colspan="2" align="center">
                        <img src="../Assets/Productphoto/<%=rsproduct.getString("product_image")%>" width="120" height="120">
                    </td>
                </tr>
                <tr>
                    <td>Rate</td>
                    <td><%=rsproduct.getString("product_rate")%></td>
                </tr>
                <tr>    
                    <td>Stock</td>
                    <td><input type="text" name="txtstock" required="" value=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnUpdate" value="Update Stock"><input type="reset" name="btncancel" value="CANCEL"></td> 
                </tr>
            </table>
        </form>
    </body>

    <%
        }
    %>
</html>
<%@include file="footer.jsp" %>
