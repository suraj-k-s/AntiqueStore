<%-- 
    Document   : header
    Created on : 11 May, 2022, 3:36:44 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- MORRIS CHART STYLES-->
        <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <link href="form.css" rel="stylesheet" />
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Antique Store</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;">  <a href="../Guest/Login.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li class="text-center">
                            <img src="assets/img/find_user.png" class="user-image img-responsive"/>

                        </li>


                        <li>
                            <a class="active-menu"  href="Homepage.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-3x"></i>Privacy<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="Myprofile.jsp">My Profile</a>
                                </li>
                                <li>
                                    <a href="Editprofile.jsp">Edit Profile</a>
                                </li>
                                <li>
                                    <a href="Changepassword.jsp">Change Password</a>
                                </li>

                            </ul>



                        </li>

                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-3x"></i>Product Details<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="Searchshop.jsp">Search Shop</a>
                                </li>
                                <li>
                                    <a href="ViewBiddingProducts.jsp">Bidding Product</a>
                                </li>

                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-3x"></i>View<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ViewBidding.jsp">Product Bidding</a>
                                </li>
                                <li>
                                    <a href="ViewBooking.jsp">Product Booking</a>
                                </li>

                            </ul>
                        </li>
                        <li>
                            <a href="Complaint.jsp"><i class="fa fa-dashboard fa-3x"></i> Complaint</a>
                        </li>
                        <li>
                            <a  href="mycart.jsp"><i class="fa fa-dashboard fa-3x"></i> Cart</a>
                        </li>
                    </ul>








                </div>

            </nav>  
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Customer Dashboard</h2>   
                            <h5>Welcome </h5>
                        </div>
                    </div>              
                    <!-- /. ROW  -->
                    <div id="tab" align="center">