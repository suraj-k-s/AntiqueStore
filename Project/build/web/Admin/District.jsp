<%-- 
    Document   : District
    Created on : 18 Feb, 2022, 11:41:16 AM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
         <%
            String eid="",ename="";
             if(request.getParameter("btnsave")!=null)
              if(request.getParameter("txthidden").equals("")){
            String ins="insert into tbl_district(district_name) values('"+request.getParameter("txtdist")+"')";
          // out.println(ins);
           con.executeCommand(ins);
       }
              else{
                   String up="update tbl_district set district_name='"+request.getParameter("txtdist")+"' where district_id='"+request.getParameter("txthidden")+"'";
                  con.executeCommand(up);
                   response.sendRedirect("District.jsp");
                }
             if(request.getParameter("did")!=null){
                 String del="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
                 con.executeCommand(del);
                 response.sendRedirect("District.jsp");
             }
              if(request.getParameter("eid")!=null){
                String sel1="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next()){
                    eid=rs1.getString("district_id");
                    ename=rs1.getString("district_name");
                }
              }
            
            
            %>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <tr>
                <input type="hidden" name="txthidden" value="<%=eid%>">
                    <td>District Name</td>
                    <td><input type="text" name="txtdist" required="" value="<%=ename%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="SAVE">
                    <input type="reset" name="btncancel" value="CANCEL"></td>  
                </tr>
                
            </table>
            <table border="1" align="center">
                <tr>
                    <td>Sl.no</td>
                    <td>District</td>
                    <td>Action</td>
                </tr>
                <tr>
                    <%
             int i=0;
            String selQry = "select * from tbl_district";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
                    
                  %>
                 
             </tr>
             <tr>
                  <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("district_name")%></td>
                   <td><a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>/<a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td>
               </tr>
               <%
            }
               %>
            </table>
         </form>
    </body>
</html>

 <%@include file="footer.jsp" %>