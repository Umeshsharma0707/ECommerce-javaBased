
<%@page import="Modal.Product"%>
<%@page import="Modal.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<%
Seller s =null;
if(session.getAttribute("Data")!=null){
	s= (Seller)session.getAttribute("Data");
}
else{
	response.sendRedirect("seller-login.jsp");
}
%>

<%
	Product p = (Product) request.getAttribute("Data");
%>

	<div class="colorlib-loader"></div>

	<div id="page">
			<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-sm-7 col-md-9">
							<div id="colorlib-logo">
								<a href="seller-index.jsp">Footwear</a>
							</div>
						</div>
						<div class="col-sm-5 col-md-3">
							<form action="#" class="search-wrap">
								<div class="form-group">
									<input type="search" class="form-control search"
										placeholder="Search">
									<button class="btn btn-primary submit-search text-center"
										type="submit">
										<i class="icon-search"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 text-left menu-1">
							<ul>
								<li class="active"><a href="seller-index.jsp">Home</a></li>
									<li><a href="seller-upload-product.jsp">Upload Product</a></li>
                                    <li><a href="seller-manage-product.jsp">Manage Product</a></li>
								<li class="cart has-dropdown"><a href="#"><%=s.getFname() %></a>
								<ul class="dropdown">
                                    <li><a href="seller-profile.jsp">Profile</a></li>
                                    <li><a href="seller-change-password.jsp">Change Password</a></li>
                                    <li><a href="seller-logout.jsp">Logout</a></li>
                                </ul>         
								</li>		
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="sale">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 offset-sm-2 text-center">
							<div class="row">
								<div class="owl-carousel2">
									<div class="item">
										<div class="col">
											<h3>
												<a href="#">25% off (Almost) Everything! Use Code:
													Summer Sale</a>
											</h3>
										</div>
									</div>
									<div class="item">
										<div class="col">
											<h3>
												<a href="#">Our biggest sale yet 50% off all summer
													shoes</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>

		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread">
							<span><a href="seller-index.jsp">Home</a></span> / <span>Product Edit</span>
						</p>
					</div>
				</div>
			</div>
		</div>


		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h3>Product Edit</h3>
					</div>
				</div>
				<div class="row">
					<div class="12">
						<div class="contact-wrap">
							<form action="ProductController" class="contact-form"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="sid" value="<%=s.getId()%>">
								<div class="row">

									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<input type="file" id="email" class="form-control"
												placeholder="Product Images" name="image">
												<img alt="" src="img/<%=p.getImage() %>"height="100" width="100">
										</div>
									</div>

									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<div class="mb-12">
											<input type="text" id="" class="form-control"
												placeholder="" name="pbrands" value="<%=p.getPbrands()%>">
												<!-- <select class="form-control" aria-label=".form-select-lg example" name="pbrands">
													<option selected="selected" disabled="disabled">Select Brands</option>
													<option value="adidas">Adidas</option>
													<option value="nike">Nike</option>
													<option value="gucci">GUCCI</option>
													<option value="merrell">Merrell</option>
													<option value="puma">Puma</option>
												</select> -->
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<div class="mb-12">
												<input type="text" id="" class="form-control"
												placeholder="" name="pcategory" value="<%=p.getPcategory()%>">
												<%-- <select class="form-control" aria-label=".form-select-lg example" name="pcategory" value="<%=p.getPcategory()%>">
													<option selected="selected" disabled="disabled">Select Category</option>
													<option value="men">Men</option>
													<option value="women">Women</option>
													<option value="kids">Kids</option>
												</select> --%>
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<div class="mb-12">
											<input type="text" id="" class="form-control"
												placeholder="" name="ptype" value="<%=p.getPtype()%>">
												<%-- <select class="form-control" aria-label=".form-select-lg example" name="ptype" value="<%=p.getPtype()%>">
													<option selected="selected" disabled="disabled">Select Type</option>
													<option value="sports">Sports</option>
													<option value="party wear">Party Wear</option>
													<option value="casual">Casual</option>
													<option value="loafer">Loafer</option>
													<option value="heels">Heels</option>
													<option value="cone heels">Cone Heels</option>
													<option value="high tops">High Tops</option>
												</select> --%>
											</div>
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<input type="text" id="email" class="form-control"
												placeholder="Product Price" name="pprice" value="<%=p.getPprice()%>">
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<input type="submit" value="Upload Product"
												class="btn btn-primary" name="action">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- popper -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap 4.1 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>