<%-- 
    Document   : Complaint
    Created on : 18 Feb, 2022, 12:47:15 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <%
            String eid="",ename="";
            if (request.getParameter("txtbtn") != null) {
                if(request.getParameter("txthidden").equals("")){
                   String ins = "insert into tbl_complainttype(complainttype_name) values('" + request.getParameter("txtcat") + "')";
                //out.println(ins);
                con.executeCommand(ins);
                }
                else{
               
                String up="update tbl_complainttype set complainttype_id='"+request.getParameter("txtcat")+"' where complainttype_id='"+request.getParameter("txthidden")+"'";
                  con.executeCommand(up);
                   response.sendRedirect("Complaint.jsp");
                }
            }
            if(request.getParameter("catid")!=null){
                String del="delete from tbl_complainttype where complainttype_id='"+request.getParameter("catid")+"'";
                con.executeCommand(del);
                response.sendRedirect("Complaint.jsp");
            }
            if(request.getParameter("eid")!=null){
                String sel1="select * from tbl_complainttype where complainttype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next()){
                    eid=rs1.getString("complainttype_id");
                    ename=rs1.getString("complainttype_name");
                }
            }


        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <tr>
                <input type="hidden" name="txthidden" value="<%=eid%>">
                    <td> Complaint Type</td>
                    <td><input type="text" name="txtcat" required="" value="<%=ename%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txtbtn" value="SAVE"></td>
                </tr>
            </table>

        </form>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td> Complaint Type</td>
                <td>Action</td>
            </tr>
            <%
            int i=0;
            String selQry = "select * from tbl_complainttype";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("complainttype_name")%></td>
                   <td><a href="Complainttype.jsp?catid=<%=rs.getString("complainttype_id")%>">Delete</a>/<a href="Complainttype.jsp?eid=<%=rs.getString("complainttype_id")%>">Edit</a></td>
               </tr>
               <%
            }
            %>
        </table>
    </body>
</html>
 <%@include file="footer.jsp" %>