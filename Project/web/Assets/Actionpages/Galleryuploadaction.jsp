<%-- 
    Document   : Galleryuploadaction
    Created on : 5 Mar, 2022, 2:05:04 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
        File savedFile=null; 
        FileItem f_item=null;
        
        

String field_name="";
String file_name="";
String image="";
String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                
                k++;
        }
       else
       {
		   
		   
           //f_item=(FileItem)itr.next();
            
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           
           
           
         if(field_name.equals("txtimage"))
          {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Assets\\Productphoto\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            image="Productphoto_"+r_num+ext;
            //creating a file object
           savedFile=new File(file_path+image);
            try
            {
                //writing the file object
               f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
          
           
       }
           
           }
    //Strinh str1="insert into tbl_wantedlist ()";
    
        String str1="insert into tbl_pgallery(product_id,pgallery_image,pgallery_caption)values('" + session.getAttribute("pid")+ "','" + image +"','" + value[0] + "')";
   out.println(str1);
    boolean status=con.executeCommand(str1);
    
    if(status==true)
    {
      %> 
      <script type="text/javascript">
            alert("Upload Successfully..");
         setTimeout(function(){window.location.href = '../../Antiqueshop/Productgallery.jsp'},100);
        </script>
     <%
    }
    %>
<%

  }

        %>
    </body>
</html>
