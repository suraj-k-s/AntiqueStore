<%-- 
    Document   : Complaint
    Created on : 7 May, 2022, 3:18:15 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Complaint Page</title>
</head>
<%@include file="header.jsp" %>
<body>

    <%
        if (request.getParameter("btnsnd") != null) {

            String ins = "insert into tbl_complaint(complaint_title,complaint_date,customer_id,complaint_content,complainttype_id)values('" + request.getParameter("txtitle") + "',curdate(),'" + session.getAttribute("customerid") + "','" + request.getParameter("txtcmp") + "','" + request.getParameter("sclcpmlt") + "')";
            out.println(ins);
            con.executeCommand(ins);

        }
    %>
    <br> <br> <br> <br> <br> <br> <br>
    <form method="post">
        <table border="1" align="center">
            <tr><td>Complaint Type</td><td><select name="sclcpmlt">
                        <option value="select">--Select--</option>
                        <%
                            String sel = "select *  from tbl_complainttype";
                            ResultSet rs = con.selectCommand(sel);
                            while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("complainttype_id")%>"><%=rs.getString("complainttype_name")%></option>
                        <%
                            }
                        %>
                    </select>
            </tr>
            <tr>
                <td>Title</td><td><input type="text" name="txtitle" required></td>
            </tr>
            <tr>
                <td>Complaint</td><td><textarea name="txtcmp"></textarea></td>
            </tr>
            <tr><td colspan="2" align="center"><input type="submit" name="btnsnd" value="Send Complaint">
                    <input type="submit" name="btn_cancel" value="Cancel"</td>

        </table>
    </form>
    <table border="1" align="center">

        <tr>
            <td>SL.no</td>
            <td>Type</td>
            <td>Title</td>
            <td>Content</td>
            <td>Date</td>
            <td>Reply</td>
        </tr>


        <%
            int i = 0;
            String selQry = "select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id inner join tbl_customer cu on cu.customer_id=c.customer_id where c.customer_id='" + session.getAttribute("customerid") + "'";

            ResultSet rsC = con.selectCommand(selQry);
            while (rsC.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%=rsC.getString("complainttype_name")%></td>
            <td><%=rsC.getString("complaint_title")%></td>
            <td><%=rsC.getString("complaint_content")%></td>
            <td><%=rsC.getString("complaint_date")%></td>
            <td><%=rsC.getString("complaint_reply")%></td>
        </tr>
        <%
            }


        %>
    </table>
</body>

</html>
<%@include file="footer.jsp" %>