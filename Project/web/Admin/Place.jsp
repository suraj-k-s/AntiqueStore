<%-- 
    Document   : Place
    Created on : 18 Feb, 2022, 12:03:23 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <%
            if (request.getParameter("btnsave") != null) {
                String ins = "insert into tbl_place (district_id,place_name,place_pincode) values('" + request.getParameter("sel_dis") + "','" + request.getParameter("txtplace") + "','" + request.getParameter("pincode") + "')";
                //out.println(ins);
                con.executeCommand(ins);
            }
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_place where place_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("Place.jsp");

            }

        %>
        <form method="post">
            <table > 
                <tr>
                    <td>District</td>
                    <td><select name="sel_dis">
                            <option>--select--</option>
                            <%                                String dist = "select * from tbl_district";
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
                    <td><input type="text" name="txtplace" required="" value="" ></td>
                </tr>
                <tr>
                    <td>Pin code</td>
                    <td><input type="text" name="pincode" required="" value=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="SAVE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="btncancel" value="CANCEL"></td> 
                </tr>

            </table>
            <br>
            <table >
                <tr>
                    <td>Sl.no</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>pin code</td>
                    <td colspan="2">Action</td>
                </tr>
                <tr>
                    <%
                        int i = 0;
                        String selQry = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
                        ResultSet rs1 = con.selectCommand(selQry);
                        while (rs1.next()) {
                            i++;
                    %>
                </tr>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("district_name")%></td>
                    <td><%=rs1.getString("place_name")%></td>
                    <td><%=rs1.getString("place_pincode")%></td>
                    <td><a href="#">Edit</a></td>
                    <td><a href="Place.jsp?did=<%=rs1.getString("place_id")%>">Delete</a></td>
                </tr>
                <%
                    }

                %>
            </table>
        </form>

    </body>
</html>
<%@include file="footer.jsp" %>