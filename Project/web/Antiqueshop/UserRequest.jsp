<%-- 
    Document   : UserRequest
    Created on : May 17, 2022, 6:16:35 AM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Requests</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            if(request.getParameter("aid")!=null){
                String del="update tbl_request set req_status=1 where request_id='"+request.getParameter("aid")+"'";
                con.executeCommand(del);
                
                String up="update tbl_biddingproduct set bp_cstatus=1 where bp_id='"+request.getParameter("pid")+"'";
                con.executeCommand(up);
                
                
                response.sendRedirect("UserRequest.jsp");
            }
            if(request.getParameter("rid")!=null){
                String del="delete from tbl_request where request_id='"+request.getParameter("rid")+"'";
                con.executeCommand(del);
                response.sendRedirect("UserRequest.jsp");
            }
        %>
        <div id="tab">
        <form method="post">
            <center><h1>New Request</h1></center>
            <table border="1" cellpadding="10" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Name Of User</th>
                    <th>Bid Rate</th>
                    <th>Product Name</th>
                    <th>Action</th>
                </tr>
                <%
                    String sel="select * from tbl_request r inner join tbl_biddingproduct bp on bp.bp_id=r.bp_id inner join tbl_customer c on c.customer_id=r.customer_id where r.req_status=0";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("customer_name")%></td>
                            <td><%=rs.getString("bid_rate")%></td>
                            <td><%=rs.getString("bp_name")%></td>
                            <td><a href="UserRequest.jsp?aid=<%=rs.getString("request_id")%>&pid=<%=rs.getString("bp_id")%>">Accept</a>/<a href="UserRequest.jsp?rid=<%=rs.getString("request_id")%>">Reject</a></td>
                        </tr>
                        <%
                    }
                %>
            </table>
            <hr>
            <br>
             <center><h1>Accepted Request</h1></center>
            <table border="1" cellpadding="10" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Name Of User</th>
                    <th>Bid Rate</th>
                    <th>Product Name</th>
                    <th>Action</th>
                </tr>
                <%
                    String sel1="select * from tbl_request r inner join tbl_biddingproduct bp on bp.bp_id=r.bp_id inner join tbl_customer c on c.customer_id=r.customer_id where r.req_status=1";
                    ResultSet rs1=con.selectCommand(sel1);
                    int j=0;
                    while(rs1.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs1.getString("customer_name")%></td>
                            <td><%=rs1.getString("bid_rate")%></td>
                            <td><%=rs1.getString("bp_name")%></td>
                            <td><a href="UserRequest.jsp?rid=<%=rs1.getString("request_id")%>">Reject</a></td>
                        </tr>
                        <%
                    }
                %>
            </table>
        </form>
        </div>
    </body>
    <br><br><br><br><br><br>
    <%@include file="footer.jsp" %>
</html>
