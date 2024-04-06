<%-- 
    Document   : Biddingproductgallery
    Created on : 18 Mar, 2022, 1:05:56 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bidding Product Gallery</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        
         <%
            session.setAttribute("bpid",request.getParameter("bpid"));
         %>
        <table align="center" cellpadding="60">
                                
         
           
               <tr>
                    <%
            int i=0;
            String selQry = "select * from tbl_bpgallery where bproduct_id='"+session.getAttribute("bpid")+"'";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %>
                 
               <td><img src="../Assets/Biddingproductphoto/<%=rs.getString("bpgallery_image")%>" width="120" height="120"><br>
                   <%=rs.getString("bpgallery_caption")%><br>
                   
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
    </body>
    
</html>
<%@include file="footer.jsp" %>
