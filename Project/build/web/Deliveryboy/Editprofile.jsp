<%-- 
    Document   : Editprofile
    Created on : 24 Feb, 2022, 11:03:17 PM
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
        String up="update tbl_dboy set dboy_name='"+request.getParameter("txtname")+"',dboy_contact1='"+request.getParameter("txtcontact")+"',dboy_email='"+request.getParameter("email")+"',dboy_address='"+request.getParameter("txtaddress")+"' where dboy_id='"+session.getAttribute("dboyid")+"'";
        con.executeCommand(up);
       response.sendRedirect("Editprofile.jsp");
        
            }
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <%
                String sels="select * from tbl_dboy where dboy_id='"+session.getAttribute("dboyid")+"'";
                    ResultSet rs=con.selectCommand(sels);
                    if(rs.next()){
                
                %>
                <tr>
                    <td>  Name</td>
                    <td><input type="text" name="txtname" required="" value="<%=rs.getString("dboy_name")%>"></td>
                </tr> 
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="" value="<%=rs.getString("dboy_contact1")%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" required="" value="<%=rs.getString("dboy_email")%>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" required="" value="<%=rs.getString("dboy_address")%>"></td>
                </tr>
                <tr>
                    
                    <td colspan="2" align="center"><input type="submit" name="btnupdate"  value="update"></td>
                </tr>
                <%
                    }
                
                %>
            </table>
        </form>
    </body>
     
</html>
<%@include file="footer.jsp" %>
