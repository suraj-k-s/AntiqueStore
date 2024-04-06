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
        <title>View Bid Request</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <%
            if(request.getParameter("aid")!=null){
                String up="update tbl_biddingproduct set bp_vstatus=1 where bp_id='"+request.getParameter("aid")+"'";
                con.executeCommand(up);
                response.sendRedirect("ViewBidRequest.jsp");
            }
             if(request.getParameter("rid")!=null){
                String up="update tbl_biddingproduct set bp_vstatus=2 where bp_id='"+request.getParameter("rid")+"'";
                con.executeCommand(up);
                response.sendRedirect("ViewBidRequest.jsp");
            }
        %>
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
            String selQry = "select * from tbl_biddingproduct where bp_vstatus=0";
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
                   <td><a href="ViewBidRequest.jsp?aid=<%=rs.getString("bp_id")%>">Accept</a>/<a href="ViewBidRequest.jsp?rid=<%=rs.getString("bp_id")%>">Reject</a></td>
                     </tr>
               <%
            }
               %>
                            </table>
                       
    </body>
</html>
  <%@include file="footer.jsp" %>