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
            if(request.getParameter("btnsave")!=null)
            {
                  {
               // String ins="insert into tbl_product(product_name,anticat_id,product_description,product_image,product_rate)values('"+request.getParameter("txtname")+"','"+request.getParameter("sel_cat")+"','"+request.getParameter("txtdesc")+"','"+request.getParameter("txtimage")+"','"+request.getParameter("txtrate")+"')";
                  }
            }
                if(request.getParameter("aid")!=null){
                String del="delete from tbl_bpgallery where bpgallery_id='"+request.getParameter("aid")+"'";
                con.executeCommand(del);
                response.sendRedirect("Biddingproductgallery.jsp");
                                }
        %>
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Bpgalleryuploadaction.jsp">
            <table border="1" align="center" cellpadding="10">
                 <tr>
                    <td>Image</td>
                    <td><input type="file" name="txtimage"  required=""</td>
                </tr>
                 <tr>
                            <td>Caption</td>
                            <td><input type="text" name="txtcap" required="" value=""></td>
                        </tr>
                        <tr>
                             <td colspan="2" align="center"><input type="submit" name="btnsave" value="SAVE"><input type="reset" name="btncancel" value="CANCEL"></td> 
                </tr>
                
            </table>
        </form>
        <table border="1" align="center">
                                
            <tr>
                <td>Sl.no</td>
                <td>Caption</td>
                <td>Image</td>
                <td>Action</td>
            </tr>
            <%
            int i=0;
            String selQry = "select * from tbl_bpgallery where bproduct_id='"+request.getParameter("")+"'";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("bpgallery_caption")%></td>
                   <td><img src="../Assets/Biddingproductphoto/<%=rs.getString("bpgallery_image")%>" width="120" height="120"></td>
                    <td><a href="Biddingproductgallery.jsp?aid=<%=rs.getString("bpgallery_id")%>">Delete</a></td>
               </tr>
               <%
            }
               %>
                            </table>
    </body>
     
</html>
<%@include file="footer.jsp" %>
