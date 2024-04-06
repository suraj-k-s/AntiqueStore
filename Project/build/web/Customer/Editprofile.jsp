<%-- 
    Document   : Editprofile
    Created on : 24 Feb, 2022, 11:04:32 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        
        <%
            if(request.getParameter("btnupdate")!=null){
        String up="update tbl_customer set customer_name='"+request.getParameter("txtname")+"',customer_contact='"+request.getParameter("txtcontact")+"',customer_email='"+request.getParameter("email")+"',customer_address='"+request.getParameter("txtaddress")+"' where customer_id='"+session.getAttribute("customerid")+"'";
        con.executeCommand(up);
        //response.sendRedirect("Editprofile.jsp");
        
            }
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <%
                String sels="select * from tbl_customer where customer_id='"+session.getAttribute("customerid")+"'";
                    ResultSet rs=con.selectCommand(sels);
                    if(rs.next()){
                
                %>
                <tr>
                    <td> Customer Name</td>
                    <td><input type="text" name="txtname" required="" value="<%=rs.getString("customer_name")%>"</td>
                </tr> 
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="" value="<%=rs.getString("customer_contact")%>"</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" required="" value="<%=rs.getString("customer_email")%>"</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" required="" value="<%=rs.getString("customer_address")%>"></td>
                </tr>
                <tr>
                    
                    <td colspan="2" align="center"><input type="submit" name="btnupdate" required="" value="update"></td>
                </tr>
                <%
                    }
                
                %>
            </table>
        </form>
    </body>
     
</html>
<%@include file="footer.jsp" %>
