<%-- 
    Document   : SendReq
    Created on : May 9, 2022, 5:56:17 AM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Request</title>
    </head>
    <%@include file="header.jsp" %>
    <body>

        <%
            session.setAttribute("bid", request.getParameter("aid"));
            if (request.getParameter("btnsave") != null) {

                String selBid = "select * from tbl_biddingproduct  where bp_id='" + request.getParameter("aid") + "' and bp_cstatus=1";
                ResultSet rsBid = con.selectCommand(selBid);
                if (rsBid.next()) {

                                %>
                                <script>
                                    alert('Bidding Completed')
                                    window.location='ViewBiddingProducts.jsp'
                                </script>
                                <%     
                } else {

                    String sel = "select *  from tbl_request where bp_id='" + session.getAttribute("bid") + "' and customer_id='" + session.getAttribute("customerid") + "'";
                    ResultSet rsd = con.selectCommand(sel);
                    if (rsd.next()) {
                        String ins = "update tbl_request set bid_rate='" + request.getParameter("bidrate") + "' where request_id='" + rsd.getString("request_id") + "'";
                        con.executeCommand(ins);
                        response.sendRedirect("SendReq.jsp?aid=" + request.getParameter("aid"));

                    } else {
                        String ins = "insert into tbl_request(bp_id,customer_id,bid_rate)values('" + session.getAttribute("bid") + "','" + session.getAttribute("customerid") + "','" + request.getParameter("bidrate") + "')";
                        con.executeCommand(ins);
                        response.sendRedirect("SendReq.jsp?aid=" + request.getParameter("aid"));
                    }
                }
            }
        %>
        <form method="post">
            <table border="1" align="center">
                <%
                    int i = 0;
                    String selQry = "select * from tbl_biddingproduct bp inner join tbl_anticat ac on ac.anticat_id=bp.anticat_id where bp_id='" + request.getParameter("aid") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    rs.next();
                    int amount = rs.getInt("bp_rate");
                    String sele = "select max(bid_rate) as rate  from tbl_request where bp_id='" + request.getParameter("aid") + "'";
                    ResultSet rs1 = con.selectCommand(sele);
                    if (rs1.next()) {
                        if(rs1.getInt("rate")!=0)
                        {
                            amount = rs1.getInt("rate");
                        }
                        
                    }
                    i++;
                %>                 
                <tr>

                    <td>Category</td> <td><%=rs.getString("anticat_name")%></td>
                </tr>
                <tr>
                    <td>Name</td><td><%=rs.getString("bp_name")%></td>
                </tr>
                <tr>
                    <td>Description</td><td><%=rs.getString("bp_description")%></td>
                </tr>
                <tr>
                    <td>About Product</td>  <td><img src="../Assets/Biddingproductphoto/<%=rs.getString("bp_aboutproduct")%>" width="120" height="120"></td>
                </tr>
                <tr>
                    <td>Current Rate</td><td><%=amount%></td>
                </tr>
                <tr>
                    <td>Start Date</td> <td><%=rs.getString("bp_Startdate")%></td>
                </tr>
                <tr>
                    <td>End Date</td>    <td><%=rs.getString("bp_enddate")%></td>
                </tr>
                <tr>
                    <td>Start Time</td> <td><%=rs.getString("bp_Starttime")%></td>
                </tr>
                <tr>
                    <td>End Time</td>  <td><%=rs.getString("bp_endtime")%></td>

                </tr>

                <tr>
                    <td colspan="2"><input type="number" name="bidrate" required="" min="<%=amount + 1%>" value="<%=amount%>" step="100" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Send"></td>
                </tr>

            </table>
        </form>
    </body>

</html>
<%@include file="footer.jsp" %>
