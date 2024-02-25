<%-- 
    Document   : ShopReport
    Created on : 17 Apr, 2022, 7:57:09 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>  
<%//@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Report</title>
        <link rel="stylesheet" href="form.css">
        <style>
            .red{
                text-align: center;
                color: red;
            }
        </style>
        <%@include file="header.jsp" %>
    </head>
    
    
    <%
    
    
    if(request.getParameter("aid")!=null)
    {
       String accept = "update tbl_shop set shop_isactive=1 where shop_id='"+request.getParameter("aid")+"'"; 
       if(con.executeCommand(accept))
       {
           %>
           <script>
               alert('Accepted');
               window.location='ShopList.jsp';
           </script>
           <%
       }
       else
       {
           %>
           <script>
               alert('Failed');
               window.location='ShopList.jsp';
           </script>
           <%
       }
    }
    
   if(request.getParameter("rid")!=null)
    {
       String reject = "update tbl_shop set shop_isactive=2 where shop_id='"+request.getParameter("rid")+"'"; 
       if(con.executeCommand(reject))
       {
           %>
           <script>
               alert('Rejected');
               window.location='ShopList.jsp';
           </script>
           <%
       }
       else
       {
           %>
           <script>
               alert('Failed');
               window.location='ShopList.jsp';
           </script>
           <%
       }
    }
    
    %>
    <body>
        <h1>Shop New List</h1>
        <table border="1" cellpadding="10" align="center">
            <tr>
                <th>Sl.No</th>
                <th>Shop Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            <%
                String sel = "select * from tbl_shop where shop_isactive=0";
                ResultSet rs = con.selectCommand(sel);
                //out.println(sel);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("shop_name")%></td>
                <td><%=rs.getString("shop_contact")%></td>
                <td><%=rs.getString("shop_email")%></td>
                <td><%=rs.getString("shop_address")%></td>
                <td>
                    <a href="ShopList.jsp?aid=<%=rs.getString("shop_id")%>">Accept</a>
                    / <a href="ShopList.jsp?rid=<%=rs.getString("shop_id")%>">Reject</a>
                </td>
            </tr>  
            <%
                }

            %>
        </table>
        <br><br><br><br>
        <h1>Shop accepted List</h1>
        <table border="1" cellpadding="10" align="center">
            <tr>
                <th>Sl.No</th>
                <th>Shop Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Address</th>
                                <th>Action</th>

            </tr>
            <%                String sel1 = "select * from tbl_shop where shop_isactive=1";
                ResultSet rs1 = con.selectCommand(sel1);
                //out.println(sel);
                int i1 = 0;
                while (rs1.next()) {
                    i1++;
            %>
            <tr>
                <td><%=i1%></td>
                <td><%=rs1.getString("shop_name")%></td>
                <td><%=rs1.getString("shop_contact")%></td>
                <td><%=rs1.getString("shop_email")%></td>
                <td><%=rs1.getString("shop_address")%></td>
                <td><a href="ShopList.jsp?rid=<%=rs1.getString("shop_id")%>">Reject</a></td>
            </tr>  
            <%
                }

            %>
        </table>
        <br><br><br><br>

        <h1>Shop rejected List</h1>
        <table border="1" cellpadding="10" align="center">
            <tr>
                <th>Sl.No</th>
                <th>Shop Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Address</th>                <th>Action</th>

            </tr>
            <%                String sel2 = "select * from tbl_shop where shop_isactive=2";
                ResultSet rs2 = con.selectCommand(sel2);
                //out.println(sel);
                int i2 = 0;
                while (rs2.next()) {
                    i2++;
            %>
            <tr>
                <td><%=i2%></td>
                <td><%=rs2.getString("shop_name")%></td>
                <td><%=rs2.getString("shop_contact")%></td>
                <td><%=rs2.getString("shop_email")%></td>
                <td><%=rs2.getString("shop_address")%></td>
                <td><a href="ShopList.jsp?aid=<%=rs2.getString("shop_id")%>">Accept</a></td>
            </tr>  
            <%
                }

            %>
        </table>
        <br><br><br><br>    </body>
        <%@include file="footer.jsp" %>
</html>
