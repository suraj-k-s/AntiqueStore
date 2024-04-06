<%-- 
    Document   : Biddingproduct.jsp
    Created on : 18 Mar, 2022, 11:10:05 AM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bidding Product</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        
         <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Productbiddingaction.jsp">
            <table border="1" align="center" cellpadding="10">
                <tr>
                 <td>Category</td>
                    <td><select name="sel_cat" onchange="getPlace(this.value)">
                            <option>--select--</option>
                            <%
                                String cat="select * from tbl_anticat";
                                ResultSet rs1=con.selectCommand(cat);
                                while(rs1.next()){
                                    %>
                                    <option value="<%=rs1.getString("anticat_id")%>"><%=rs1.getString("anticat_name")%></option>
                                    <%
                                }
                              
                            %>
                            
                        </select></td>
                </tr>
                    <tr>
                            <td>Name</td>
                            <td><input type="text" name="txtname" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><input type="text" name="txtdesc" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>About Product</td>
                            <td><input type="file" name="txtabt"  required=""</td>
                        </tr>
                         <tr>
                            <td>Rate</td>
                            <td><input type="text" name="txtrate" required="" value=""></td>
                        </tr>
                         <tr>
                            <td>Start Date</td>
                            <td><input type="date" name="txtdate" required="" value=""></td>
                        </tr>
                        <tr>
                         <td>End Date</td>
                            <td><input type="date" name="txtdate" required="" value=""></td>
                        </tr>
                        <tr>
                        <td>Start Time</td>
                            <td><input type="time" name="txttime" required="" value=""></td>
                        </tr>
                        <tr>
                        <td>End Time</td>
                            <td><input type="time" name="txttime" required="" value=""></td>
                        </tr>
                         <tr>
                             <td colspan="2" align="right"><input type="submit" name="btnsave" value="ADD PRODUCT"></td> 
                </tr>
            </table>
         </form>
                            <h1 align="center">Product Details</h1>
                            <table border="1" align="center">
                                
            <tr>
                <td>Sl.no</td>
                <td>Category</td>
                <td>Name</td>
                <td>Description</td>
                <td>About Product</td>
                <td>Rate</td>
                <td>Start Date</td>
                <td>End Date</td>
                <td>Start Time</td>
                <td>End Time</td>
                <td>Action</td>
            </tr>
            <%
            int i=0;
            String selQry = "select * from tbl_biddingproduct where shop_id='"+session.getAttribute("shopid")+"'";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("anticat_id")%></td>
                   <td><%=rs.getString("bp_name")%></td>
                   <td><%=rs.getString("bp_description")%></td>
                   <td><img src="../Assets/Biddingproductphoto/<%=rs.getString("bp_aboutproduct")%>" width="120" height="120"></td>
                   <td><%=rs.getString("bp_rate")%></td>
                   <td><%=rs.getString("bp_Startdate")%></td>
                   <td><%=rs.getString("bp_enddate")%></td>
                   <td><%=rs.getString("bp_Starttime")%></td>
                   <td><%=rs.getString("bp_endtime")%></td>
                   <td><a href="Biddingproduct.jsp?aid=<%=rs.getString("bp_id")%>">Delete</a></td>
                    <td><a href="Biddingproductgallery.jsp?bpid=<%=rs.getString("bp_id")%>">Add Gallery</a></td>
                     </tr>
               <%
            }
               %>
                            </table>
                       
    </body>
     
</html>
<%@include file="footer.jsp" %>
