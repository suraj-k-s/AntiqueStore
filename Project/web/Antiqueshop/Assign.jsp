<%-- 
    Document   : Assign
    Created on : May 9, 2022, 9:28:44 AM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign</title>
    </head>
    <%@include file="header.jsp" %>
    <body>

        <%
            session.setAttribute("cid", request.getParameter("cid"));
            if (request.getParameter("catid") != null) {
                String ins = "update tbl_carthead set dboy_id='" + request.getParameter("catid") + "' where cart_id='" + session.getAttribute("cid") + "'";
                con.executeCommand(ins);
        %>
        <script>alert("Assigned SucessFully.....")
            window.location = "Userbookings.jsp";
        </script>
        <%
            }
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse:collapse;">
                <tr>
                    <td>Sl.no</td>
                    <td>Name</td>
                    <td>Contact 1</td>
                    <td>Contact 2</td>
                    <td>Email</td>
                    <td>Gender</td>
                    <td>District</td>
                    <td>Address</td>
                    <td>Username</td>
                    <td>Password</td>
                    <td>Action</td>
                </tr>
                <%
                    int i = 0;
                    String selQry = "select * from tbl_dboy db inner join tbl_district dis on db.district_id=dis.district_id where shop_id='" + session.getAttribute("shopid") + "'";
                    //out.print(selQry);
                    ResultSet rsd = con.selectCommand(selQry);
                    while (rsd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rsd.getString("dboy_name")%></td>
                    <td><%=rsd.getString("dboy_contact1")%></td>
                    <td><%=rsd.getString("dboy_contact2")%></td>
                    <td><%=rsd.getString("dboy_email")%></td>
                    <td><%=rsd.getString("dboy_gender")%></td>
                    <td><%=rsd.getString("dboy_address")%></td>
                    <td><%=rsd.getString("district_name")%></td>
                    <td><%=rsd.getString("dboy_username")%></td>
                    <td><%=rsd.getString("dboy_password")%></td>
                    <td><a href="Assign.jsp?catid=<%=rsd.getString("dboy_id")%>&cid=<%=request.getParameter("cid")%>">Assign</a></td>

                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>

</html>
<%@include file="footer.jsp" %>
