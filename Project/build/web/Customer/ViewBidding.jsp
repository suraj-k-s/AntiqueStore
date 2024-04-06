<%-- 
    Document   : ViewBiddingProducts
    Created on : May 9, 2022, 5:11:23 AM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bidding Products</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        
              <table border="1" align="center">
                                
            <tr>
                <td>Sl.no</td>
                <td>Name</td>
                <td>Description</td>
                <td>About Product</td>
                <td>Rate</td>
            </tr>
            <%
            int i=0;
            String selQry = "select * from tbl_request r inner join tbl_biddingproduct bp on bp.bp_id=r.bp_id where r.req_status=1 and customer_id='"+session.getAttribute("customerid")+"'";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("bp_name")%></td>
                   <td><%=rs.getString("bp_description")%></td>
                   <td><img src="../Assets/Biddingproductphoto/<%=rs.getString("bp_aboutproduct")%>" width="120" height="120"></td>
                   <td><%=rs.getString("bid_rate")%></td>
                     </tr>
               <%
            }
               %>
                            </table>
                       
    </body>
     
</html>
<%@include file="footer.jsp" %>
