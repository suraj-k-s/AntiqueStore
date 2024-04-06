<%-- 
    Document   : Reply
    Created on : 12 May, 2022, 12:15:19 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reply</title>
    </head>
     <%@include file="header.jsp" %>
    <body>
        <%
            if(request.getParameter("btnsnd")!=null){
                String up="update tbl_complaint set complaint_reply='"+request.getParameter("txtcmp")+"',complaint_status=1 where complaint_id='"+request.getParameter("cid")+"'";
                con.executeCommand(up);
                response.sendRedirect("Viewcomplaint.jsp");
            }
        %>
        <h1 align="center">Reply</h1>
        <br><br><br><br>
        <form method="post">
            <table border="1" align="center">
                 <tr>
                                <td>Reply</td><td><textarea name="txtcmp"></textarea></td>
                            </tr>
                            <tr><td colspan="2" align="center"><input type="submit" name="btnsnd" value="Send">
                                <input type="submit" name="btn_cancel" value="Cancel"</td>
                            </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="footer.jsp" %>
