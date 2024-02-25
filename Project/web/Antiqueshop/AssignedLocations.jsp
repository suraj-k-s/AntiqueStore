<%-- 
    Document   : AssignedLocations
    Created on : 15 Mar, 2022, 3:27:23 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assigned Locations</title>
    </head>
    <%@include file="header.jsp" %>
    <body>

        <%
            if (request.getParameter("btnsave") != null) {
                String ins = "insert into tbl_assignedloc(dboy_id,dboy_pincodes,place_id) values('" + request.getParameter("did") + "','" + request.getParameter("pincode") + "','" + request.getParameter("sel_plc") + "')";
                con.executeCommand(ins);
            }
        %>
        <form method="POST">
            <table border="0" align="center" cellpadding="10">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_dis" onchange="getPlace(this.value)">
                            <option>--select--</option>
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
                </tr>
                <tr>
                    <td>Place</td>
                    <td><select name="sel_plc" id="slctplace">
                            <option>--select--</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Pin Code</td>
                    <td><input type="varchar" name="pincode" required="" value=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" required="" value="Assign Now">
                </tr>
            </table>
        </form>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>District</td>
                <td>Place</td>
                <td>Pin Code</td>

            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_assignedloc db inner join tbl_place pl on db.place_id=pl.place_id inner join tbl_district dis on pl.district_id=dis.district_id";
                ResultSet rs1 = con.selectCommand(selQry);
                //out.print(selQry);
                while (rs1.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("place_name")%></td>
                <td><%=rs1.getString("dboy_pincodes")%></td>

            </tr>
            <%
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
