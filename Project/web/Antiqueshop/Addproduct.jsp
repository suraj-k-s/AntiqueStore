<%-- 
    Document   : Addproduct.jsp
    Created on : 25 Feb, 2022, 3:44:15 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
       
        <%
            if(request.getParameter("fid")!=null){
                session.setAttribute("pid", request.getParameter("fid"));
                response.sendRedirect("Productgallery.jsp");
            }
            if(request.getParameter("btnsave")!=null)
            {
                  {
               // String ins="insert into tbl_product(product_name,anticat_id,product_description,product_image,product_rate)values('"+request.getParameter("txtname")+"','"+request.getParameter("sel_cat")+"','"+request.getParameter("txtdesc")+"','"+request.getParameter("txtimage")+"','"+request.getParameter("txtrate")+"')";
                  }
            }
                if(request.getParameter("aid")!=null){
                String del="delete from tbl_product where product_id='"+request.getParameter("aid")+"'";
                con.executeCommand(del);
                response.sendRedirect("Addproduct.jsp");
                                }
        %>
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Productuploadaction.jsp">
            <table border="1" align="center" cellpadding="10">
                 <tr>
                            <td>Name</td>
                            <td><input type="text" name="txtname" required="" value=""></td>
                        </tr>
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
                            <td>Description</td>
                            <td><input type="text" name="txtdesc" required="" value=""></td>
                        </tr>
                        <tr>
                    <td>Image</td>
                    <td><input type="file" name="txtimage"  required=""></td>
                </tr>
                <tr>
                            <td>Rate</td>
                            <td><input type="text" name="txtrate" required="" value=""></td>
                        </tr>
                         <tr>
                             <td colspan="2" align="center"><input type="submit" name="btnsave" value="SAVE"><input type="reset" name="btncancel" value="CANCEL"></td> 
                </tr>
            </table>
 </form>
                            <h1 align="center">Product Details</h1>
                            <table border="1" align="center">
                                
            <tr>
                <td>Sl.no</td>
                <td>Name</td>
                <td>Category</td>
                <td>Description</td>
                <td>Image</td>
                <td>Rate</td>
                <td>Action</td>
            </tr>
            <%
            int i=0;
            String selQry = "select * from tbl_product where shop_id='"+session.getAttribute("shopid")+"'";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("product_name")%></td>
                   <td><%=rs.getString("anticat_id")%></td>
                   <td><%=rs.getString("product_description")%></td>
                   <td><img src="../Assets/Productphoto/<%=rs.getString("product_image")%>" width="120" height="120"></td>
                   <td><%=rs.getString("product_rate")%></td>
                    <td><a href="Addproduct.jsp?aid=<%=rs.getString("product_id")%>">Delete</a></td>
                    <td><a href="Addproduct.jsp?fid=<%=rs.getString("product_id")%>">Add Gallery</a></td>
                    <td><a href="Productstock.jsp?pid=<%=rs.getString("product_id")%>">Add Product Stock</a></td>
               </tr>
               <%
            }
               %>
                            </table>
                            <br><br><br>
                       
    </body>
     
</html>
<%@include file="footer.jsp" %>
