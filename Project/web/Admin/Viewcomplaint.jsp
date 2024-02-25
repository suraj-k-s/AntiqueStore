<%-- 
    Document   : Viewcomplaint
    Created on : 12 May, 2022, 12:14:45 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaint</title>
    </head>
     <%@include file="header.jsp" %>
    <body>
        <h1 align="Complaints"></h1>
        <form method="post">
            <h1>
                User Complaints
            </h1>
            <table border="1" align="center">
        <tr>
                <td>Sl.no</td>
                <td>Title</td>
                <td>Content</td>
                <td>Name of User</td>
                <td>Action</td>
            </tr>
            <%
                String sel="select * from tbl_complaint c inner join tbl_customer cr on cr.customer_id=c.customer_id where c.complaint_status=0";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next()){
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("complaint_title")%></td>
                        <td><%=rs.getString("complaint_content")%></td>
                        <td><%=rs.getString("customer_name")%></td>
                        <td><a href="Reply.jsp?cid=<%=rs.getString("complaint_id")%>">Reply</a></td>
                    </tr>
                    <%
                }
                
            %>
            </table>
            
            <br>
            <hr>
            <br>
             <h1>
                Shop Complaints
            </h1>
            <table border="1" align="center">
        <tr>
                <td>Sl.no</td>
                <td>Title</td>
                <td>Content</td>
                <td>Name of Shop</td>
                <td>Action</td>
            </tr>
            <%
                String sel1="select * from tbl_complaint c inner join tbl_shop s on s.shop_id=c.shop_id where c.complaint_status=0";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next()){
                    j++;
                    %>
                    <tr>
                        <td><%=j%></td>
                        <td><%=rs1.getString("complaint_title")%></td>
                        <td><%=rs1.getString("complaint_content")%></td>
                        <td><%=rs1.getString("shop_name")%></td>
                        <td><a href="Reply.jsp?cid=<%=rs1.getString("complaint_id")%>">Reply</a></td>
                    </tr>
                    <%
                }
            %>
            </table>
        </form>
    </body>
</html>
<%@include file="footer.jsp" %>
