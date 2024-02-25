<%-- 
    Document   : Viewmoreproduct
    Created on : 15 Mar, 2022, 12:16:26 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewmore Product</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        
        <form method="POST">
              <table border="1" align="center" cellpadding="10">
                  <%
                                int i=0;
                                String sel1="select * from tbl_product where Product_id='"+request.getParameter("pid")+"'";
                                ResultSet rsp1= con.selectCommand(sel1);
                                if(rsp1.next()){
                                    i++;
                                    %>
                                    <tr>
                                        <td colspan="2"><img src="../Assets/Productphoto/<%=rsp1.getString("product_image")%>" width="150" height="150"></td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <td>Name:</td>
                                        <td><%=rsp1.getString("product_name")%></td>
                                    </tr>
                                            
                                    <tr>
                                        <td>Description</td>
                                        <td><%=rsp1.getString("product_description")%></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Rate</td>
                                        <td><%=rsp1.getString("product_rate")%></td>
                                    </tr>
                                          
                                            
                                        </p>
                                    </td>
                                    <%
                                    if(i==4){
                                        out.println("</tr>");
                                        i=0;
                                        out.println("<tr>");
                                    }
                                }
                    %>
                </table>
    </form>
    </body>
     
</html>
<%@include file="footer.jsp" %>
