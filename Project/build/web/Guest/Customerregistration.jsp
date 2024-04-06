<%-- 
    Document   : Customerregistration
    Created on : 24 Feb, 2022, 7:50:31 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
       
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Customeraction.jsp">
            <table border="2" align="center" cellpadding="10" style="border-collapse:collapse;">
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="txtname" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>Contact</td>
                            <td><input type="text" name="txtcontact" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="email" name="txtemail" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                    <td><input type="radio" name="gender" value="Male">Male<input type="radio" name="gender" value="FeMale">FeMale</td>
                        </tr>
                       <tr>
                            <td>District</td>
                            <td>
                                <select name="sel_dis" onchange="getPlace(this.value)">
                            <option>--select--</option>
                            <%
                                String dist="select * from tbl_district";
                                ResultSet rs=con.selectCommand(dist);
                                while(rs.next()){
                                    %>
                                    <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                    <%
                                }
                            %>
                            
                        </select></td>
                        </tr>
                        <tr>
                            <td>Place</td>
                            <td><select name="sel_plc" id="slctplace">
                                     <option>--select--</option>
                                 </select>
                            </td>
                             
                        </tr>
                         <tr>
                            <td> Customer Address</td>
                            <td><input type="text" name="txtaddress" required="" value=""></td>
                        </tr>
                        
                        <tr>
                            <td>Adhaar No</td>
                            <td><input type="text" name="Aadharno" required="" value=""></td>
                        </tr>
                       <tr>
                            <td>Proof</td>
                            <td><input type="file" name="flproof" required="" value=""></td>
                        </tr>
                        <tr>
                            <td>User Name</td>
                            <td><input type="text" name="txtusername" required="" value=""></td>
                        </tr>
                        <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword" required="" value=""></td>
                        </tr>
                          <tr>
                            <td>Confirm Password</td>
                            <td><input type="password" name="txtpassword" required="" value=""></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                             <input type="submit" name="btnsave" required="" value="Register">
                             <input type="reset" name="btncancel" required="" value="Cancel"></td>
                          </tr>
                        </table>
        </form>
                            
                       </body>
                       
                       <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getPlace(did)
{
    //  alert(did);
	
	$.ajax(
		{
			url:"../Assets/Ajaxpages/Ajaxplace.jsp?did="+did,
			success:function(result)
			{
                            //alert(result)
				$("#slctplace").html(result);
				
			}
		});
}
        </script>
</html>
 <%@include file="footer.jsp" %>