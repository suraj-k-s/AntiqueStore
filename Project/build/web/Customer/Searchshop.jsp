<%-- 
    Document   : Searchshop
    Created on : 15 Mar, 2022, 7:14:17 AM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Shop</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <br><br><br><br><br><br><br><br>
        <form method="POST">
            <table border="0" align="center" cellpadding="10">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_dis" onchange="getPlace(this.value)">
                            <option>---Select---</option>
                            <%
                                String dist = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(dist);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select></td>
                    <td>Place</td>
                    <td><select name="sel_plc" id="slctplace">
                            <option>---Select---</option>
                        </select>
                    </td>
                    <td colspan="2">
                        <input type="submit" name="btnsave" value="Search Shop" style="width: 100%">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <hr>
        <br>
        <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>Sl.no</td>
                <td>Shop Name</td>
                <td>Contact</td>
                <td>Email</td>
                <td>Photo</td>

                <td>Address</td>
                <td>Action</td>
            </tr>
            <tr>
                <%
                    int i = 0;
                    if (request.getParameter("btnsave") != null) {

                        String sel = "select * from tbl_shop sh inner join tbl_place pl on sh.place_id=pl.place_id inner join tbl_district dis on pl.district_id=dis.district_id where sh.place_id='" + request.getParameter("sel_plc") + "'";
                        ResultSet rsShops = con.selectCommand(sel);

                        while (rsShops.next()) {
                            i++;

                %>

            </tr>
            <tr>
            <tr>
                <td><%=i%></td>
                <td><%=rsShops.getString("shop_name")%></td>
                <td><%=rsShops.getString("shop_contact")%></td>
                <td><%=rsShops.getString("shop_email")%></td>
                <td><img src="../Assets/Shopphoto/<%=rsShops.getString("shop_photo")%>" width="120" height="120"></td>

                <td><%=rsShops.getString("shop_address")%></td>
                <td><a href="Shopproduct.jsp?fid=<%=rsShops.getString("shop_id")%>">View Products</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>

    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                            function getPlace(did)
                            {
                                //  alert(did);

                                $.ajax(
                                        {
                                            url: "../Assets/Ajaxpages/Ajaxplace.jsp?did=" + did,
                                            success: function(result)
                                            {
                                                //alert(result)
                                                $("#slctplace").html(result);

                                            }
                                        });
                            }
    </script>
</html>
<%@include file="footer.jsp" %>
