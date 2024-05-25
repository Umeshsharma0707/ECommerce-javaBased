<%@page import="Modal.Customer"%>
<%@page import="Modal.Seller"%>
<%@page import="Modal.Product"%>
<%@page import="java.util.List"%>
<%@page import="Dao.AdminDao"%>
<%@page import="Modal.Seller"%>
<%@page import="Modal.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Footwear</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- Bootstrap Core CSS -->
<link href="admin/css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="admin/css/style.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link href="admin/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons CSS -->

 <!-- side nav css file -->
 <link href='admin/css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
 <!-- side nav css file -->
 
 <!-- js-->
<script src="admin/js/jquery-1.11.1.min.js"></script>
<script src="admin/js/modernizr.custom.js"></script>

<!--webfonts-->
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
<!--//webfonts--> 

<!-- Metis Menu -->
<script src="admin/js/metisMenu.min.js"></script>
<script src="admin/js/custom.js"></script>
<link href="admin/css/custom.css" rel="stylesheet">
<!--//Mesetis Menu -->

</head> 
<body class="cbp-spmenu-push">
<%
Admin a =null;
if(session.getAttribute("data")!=null){
	a= (Admin)session.getAttribute("data");
}
else{
	response.sendRedirect("admin-customer.jsp");
}
%>

	<div class="main-content">
	<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
		<!--left-fixed -navigation-->
		<aside class="sidebar-left">
        <nav class="navbar navbar-inverse">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
 `           <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <h1><a class="navbar-brand" href="admin-index.jsp"><span class="fa fa-area-chart"></span>Foot<span class="dashboard_text">Wear</san></a></h1>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header">MAIN NAVIGATION</li>
              <li class="treeview">
                <a href="admin-index.jsp">
                <i class="fa fa-dashboard"></i> <span>Home</span>
                </a>
              </li>
			  <li class="treeview">
                <a href="admin-seller.jsp">
                <i class="fa fa-user"></i>
                <span>Seller</span>
                </a>
              </li>
              <li class="treeview">
              <li class="treeview">
                <a href="admin-customer.jsp">
                <i class="fa fa-user"></i>
                <span>Customer</span>
                </a>
              </li>
			  <li>
                <a href="admin-product.jsp">
                <i class="fa fa-product-hunt"></i> <span>Product</span>
                </a>
              </li>
            </ul>
          </div>
          <!-- /.navbar-collapse -->
      </nav>
    </aside>
	</div>
		<!--left-fixed -navigation-->
		
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--toggle button start-->
				<button id="showLeftPush"><i class="fa fa-bars"></i></button>
				<!--toggle button end-->
				
				<div class="clearfix"> </div>
			</div>
			<div class="header-right">		
				<div class="profile_details">		
					<ul>
						<li class="dropdown profile_details_drop">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<div class="profile_img">	
									<span class="prfil-img"><img src="images/2.jpg" alt=""> </span> 
									<div class="user-name">
										<p><%=a.getEmail() %></p>
										<span>Administrator</span>
									</div>
									<i class="fa fa-angle-down lnr"></i>
									<i class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>	
								</div>	
							</a>
							<ul class="dropdown-menu drp-mnu">
								<li> <a href="admin-logout.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>				
			</div>
			<div class="clearfix"> </div>	
		</div>
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<div class="tables">
					<h2 class="title1">Tables</h2>
					<div class="bs-example widget-shadow" data-example-id="contextual-table"> 
						<h4>Customer Table</h4>
						<table class="table">
						 <thead>
						   <tr>
						      <th>Id</th>
						      <th>Name</th>
						      <th>Contact</th>
						      <th>Address</th>
						      <th>Email</th>
						      <th>Password</th>
						      <th>Gender</th>
						      <th>Delete</th>
						    </tr> 
						  </thead> 
						  <tbody>
								<%
								List<Customer> list = AdminDao.getAllCustomer();
								%>
								<%
								for (Customer c1 : list) {
								%>
						     <tr class="active"> 
						     
						       <td><%=c1.getId() %></td>
						       <td><%=c1.getFname()%></td> 
						       <td><%=c1.getContact()%></td>
						       <td><%=c1.getAddress()%></td> 
						       <td><%=c1.getEmail()%></td>
						       <td><%=c1.getPassword() %></td>
						       <td><%=c1.getGender() %></td>
						     	<td>
						     		<form action="AdminController" method="post">
						     			<input type="hidden" name="id" value="<%=c1.getId()%>">
						     			<button class="btn" name="action" value="removee">
											<i class="fa fa-trash"></i>
										</button>
						     			<!-- <input type="submit" name="action" value="removee"> -->
						     		</form>
						     	</td> 
						     </tr> 
						     <%
							   }
							 %> 
			      </tbody>
			      
				  </table> 
					</div>
				</div>
			</div>
		</div>
		
		<!--footer-->
		<div class="footer">
		   <p>&copy; 2018 Glance Design Dashboard. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts</a></p>
	   </div>
        <!--//footer-->
	</div>
	
	<!-- side nav js -->
	<script src='admin/js/SidebarNav.min.js' type='text/javascript'></script>
	<script>
      $('.sidebar-menu').SidebarNav()
    </script>
	<!-- //side nav js -->
	
	<!-- Classie --><!-- for toggle left push menu script -->
		<script src="admin/js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			
			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!-- //Classie --><!-- //for toggle left push menu script -->
	
	<!--scrolling js-->
	<script src="admin/js/jquery.nicescroll.js"></script>
	<script src="admin/js/scripts.js"></script>
	<!--//scrolling js-->
	
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"> </script>
	
</body>
</html>