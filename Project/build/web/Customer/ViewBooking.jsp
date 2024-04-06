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
        <%

           

            String selQ = "select DISTINCT(ch.cart_id) as id from tbl_carthead ch inner join tbl_cartbody cb on cb.cart_id=ch.cart_id inner join tbl_product p on p.product_id=cb.product_id where ch.customer_id='" + session.getAttribute("customerid") + "'";
            ResultSet rsQ = con.selectCommand(selQ);
            if (rsQ.next()) {
        %>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>Date</td>
                <td>Products</td>
                <td>Total Amount</td>
                <td>Status</td>
            </tr>
            <%
                int i = 0;

                String selQry = "select * from tbl_carthead ch inner join tbl_customer c on c.customer_id=ch.customer_id where ch.cart_id='" + rsQ.getString("id") + "' and booking_status>0";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%

                    String sel = "select * from tbl_cartbody cb inner join tbl_product p on p.product_id=cb.product_id where cart_id='" + rs.getString("cart_id") + "'";
                    ResultSet rs1 = con.selectCommand(sel);
                    while (rs1.next()) {
                        out.println(rs1.getString("product_name") + " ,<br>");
                    }


                    %></td>
                <td><%=rs.getString("grand_total")%></td>
                <td><%

                    if (rs.getString("booking_status").equals("1")) {
                    %>
                    Order Placed | <a href="Userbookings.jsp?id=<%=rs.getString("cart_id")%>&sts=2">Product Packed ?</a>
                    <%
                    } else if (rs.getString("booking_status").equals("2")) {
                    %>
                    Packed | <a href="Userbookings.jsp?id=<%=rs.getString("cart_id")%>&sts=3">Product Dispatched ?</a>
                    <%
                    } else if (rs.getString("booking_status").equals("3")) {
                    %>
                    Dispatched | <a href="Userbookings.jsp?id=<%=rs.getString("cart_id")%>&sts=4">Product Shipped ?</a>
                    <%
                    } else if (rs.getString("booking_status").equals("4")) {
                    %>
                    Shipped | <a href="Userbookings.jsp?aid=<%=rs.getString("cart_id")%>&sts=5">Assign Delivery Boy </a>
                    <%
                    } else if (rs.getString("booking_status").equals("5")) {
                    %>
                    Delivery Boy Assigned 
                    <%
                    } else if (rs.getString("booking_status").equals("6")) {
                    %>
                    Order Picked Up 
                    <%
                    } else if (rs.getString("booking_status").equals("7")) {
                    %>
                    Delivered
                    <%
                        }
                    %></td>
            </tr>
            <%                }
            %>
        </table>
        <%
        } else {
        %>
        <h1 align="center">No Bookings Found</h1>
        <%
            }
        %>
    </body>
</html>
<%@include file="footer.jsp" %>
