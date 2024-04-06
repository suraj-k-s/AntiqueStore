<%-- 
    Document   : ManageDeliveryWorkers
    Created on : 15 Mar, 2022, 2:02:56 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Delivery Workers</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
       
        <%
        if (request.getParameter("btnsave") != null) {
               
                   String ins = "insert into tbl_dboy(dboy_name,dboy_contact1,dboy_contact2,dboy_email,dboy_gender,dboy_address,district_id,dboy_username,dboy_password,shop_id) values('" + request.getParameter("txtname") +"','" + request.getParameter("txtcontact") +"','" + request.getParameter("txtcontact") + "','" + request.getParameter("txtemail") + "','" + request.getParameter("gender")+"','" + request.getParameter("txtaddress") + "','" + request.getParameter("sel_dis") + "','" + request.getParameter("txtusername") + "','" + request.getParameter("txtpassword") + "','"+session.getAttribute("shopid")+"')";
                con.executeCommand(ins);
                }
        
        
        
        
        %>
        <form method="post">
        <table border="2" align="center" cellpadding="10" style="border-collapse:collapse;">
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="txtname" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>Contact 1</td>
                            <td><input type="text" name="txtcontact" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>Contact 2</td>
                            <td><input type="text" name="txtcontact" required="" value=""></td>
                        </tr>
                     <tr>
                            <td>Email</td>
                            <td><input type="email" name="txtemail" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                    <td><input type="radio" name="gender" value="Male">Male
                        <input type="radio" name="gender" value="FeMale">Female</td>
                        </tr>
                       
                      <tr>
                            <td> Address</td>
                            <td><textarea name="txtaddress"></textarea></td>
                        </tr>
                        <tr>
                            <td>District</td>
                            <td>
                                <select name="sel_dis">
                            <option>--Select--</option>
                            <%
                                String seldis="select * from tbl_district";
                                ResultSet rs=con.selectCommand(seldis);
                                while(rs.next()){
                                    %>
                                    <option value="<%=rs.getString("district_id") %>"><%=rs.getString("district_name") %></option>
                                    <%
                                }
                            %>
                            
                        </select></td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="txtusername" required="" value=""></td>
                        </tr>
                        <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword" required="" value=""></td>
                        </tr>
                          <tr>
                            <td>Confirm Password</td>
                            <td><input type="password" name="txtpassword" required="" value=""></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                             <input type="submit" name="btnsave" required="" value="Register Now">
                        </tr>
        
                        </table>
        </form>
                            <br>
                            <hr>
                            <br>
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
            int i=0;
            String selQry = "select * from tbl_dboy db inner join tbl_district dis on db.district_id=dis.district_id where shop_id='"+session.getAttribute("shopid")+"'";
            //out.print(selQry);
            ResultSet rsd = con.selectCommand(selQry);
            while(rsd.next())
            {
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
                   <td><a href="ManageDeliveryWorkers.jsp?catid=<%=rsd.getString("dboy_id")%>">Delete</a>/<a href="ManageDeliveryWorkers.jsp?eid=<%=rsd.getString("dboy_id")%>">Edit</a></td>
                   <td><a href="AssignedLocations.jsp?did=<%=rsd.getString("dboy_id")%>">Assigned Locations</a></td>
                </tr>
               <%
            }
            %>
                            </table>
    </body>
     
</html>
<%@include file="footer.jsp" %>
