<%-- 
    Document   : Antiqueshopregistration
    Created on : 18 Feb, 2022, 2:27:53 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Antique Shop Registration</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Shopaction.jsp">
            <table border="1" align="center" >
                <tr>
                    <td>Shop Name</td>
                    <td><input type="text" name="name" autocomplete="off" required=""></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="con" autocomplete="off" pattern="[6-9]{1}[0-9]{9}" required=""></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" autocomplete="off"required=""></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="txtphoto"  required=""</td>
                </tr>
                <tr>
                    <td>License Number</td>
                    <td><input type="varchar" name="licno"  required=""</td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="txtproof"  required=""</td>
                </tr>
                 <tr>
                    <td>Address</td>
                    <td><input type="text" name="add" autocomplete="off" required=""></td>
                </tr>
               
              <tr>
                            <td>District</td>
                            <td>
                                <select name="sel_dis" onchange="getPlace(this.value)" required="">
                                    <option value="">--select--</option>
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
                            <td><select name="sel_plc" required id="slctplace"required>
                                    <option value="">--select--</option>
                                 </select>
                            </td>
                             
                        </tr>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="user" autocomplete="off" required=""></td>
                </tr>
                <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword" required="" value=""></td>
                        </tr>
                <tr>
                     <td colspan="2" align="center"><input type="submit" name="btnsave" value="submit"><input type="reset" name="btncancel" value="cancel">
                    </td>
                    
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