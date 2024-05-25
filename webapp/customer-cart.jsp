<%@page import="Dao.ProductDao"%>
<%@page import="java.util.Random"%>
<%@page import="Modal.Product"%>
<%@page import="Dao.CartDao"%>
<%@page import="Modal.Cart"%>
<%@page import="Modal.Customer"%>
<%@page import="java.util.List"%>
<%
Random randomGenerator = new Random();
int randomInt = randomGenerator.nextInt(1000000);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.btn {
	background-color: gray;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 16px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%
	Customer c = null;
	if (session.getAttribute("Data") != null) {
		c = (Customer) session.getAttribute("Data");
	} else {
		response.sendRedirect("customer-login.jsp");
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
								<a href="customer-index.jsp">Footwear</a>
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
								<li><a href="customer-index.jsp">Home</a></li>
								<li><a href="men.jsp">Men</a></li>
								<li><a href="women.jsp">Women</a></li>
								<li><a href="kid.jsp">kids</a></li>
								<li class="cart"><a href="customer-cart.jsp"> <i
										class="icon-shopping-cart"></i> Cart [0]
								</a></li>

								<li class="cart has-dropdown"><a href="#"><%=c.getFname()%></a>
									<ul class="dropdown">
										<li><a href="customer-profile.jsp">Profile</a></li>
										<li><a href="customer-change-password.jsp">Change
												Password</a></li>
										<li><a href="customer-logout.jsp">Logout</a></li>
									</ul></li>
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
							<span><a href="customer-index.jsp">Home</a></span> / <span>Shopping
								Cart</span>
						</p>
					</div>
				</div>
			</div>
		</div>


		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<table class="table table-image">
										<thead>
											<tr>
											<tr>
												<th>Image</th>
												<th>Brands</th>
												<th>Quantity</th>
												<th>Category</th>
												<th>Type</th>
												<th>Price</th>
												<th>Delete</th>
											</tr>

										</thead>
										<tbody>
											<%
											int id = c.getId();
											%>
											<%
											int net_price = 0;
											%>
											<%
											List<Cart> list = CartDao.GetProductByCUSid(id);
											%>
											<%
											for (Cart c1 : list) {
												net_price = net_price + c1.getTotal();
											%>
											<%
											Product p1 = ProductDao.getDataByID(c1.getPid());
											%>
											<%-- <%out.print(p1);%> --%>
											<tr>
												<td class="w-25">
													<img src="img/<%=p1.getImage()%>"alt="" height="150" width="120">
												</td>
												
												<td><%=c1.getPbrands()%></td>
												
												<td>
													<form action="CartController" method="post">
														<input type="hidden" name="cid" value="<%=c1.getCid()%>">
														<input type="number" name="pqty" min="1" max="10"
															value="<%=c1.getPqty()%>" onchange="this.form.submit();">
													</form>
												</td>
												<td><%=c1.getPcategory()%></td>
												<td><%=c1.getPtype()%></td>
												<td><%=c1.getTotal()%></td>
												<td class="product_cart_item">
													<div class="product_cartitem_text">
														<form action="CartController" method="get">
															<input type="hidden" name="cid" value="<%=c1.getCid()%>">
															<!-- <input type="submit" name="action" value="remove product"> -->
															<button class="btn" name="action" value="remove product">
																<i class="fa fa-trash"></i>
															</button>
														</form>
													</div>
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
				</div>
				<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="total-wrap">
							<div class="row">
								<div class="col-sm-8"></div>
								<div class="col-sm-4 text-center">
									<div class="total">
										<div class="grand-total">
											<form method="post" action="payment.jsp?amount=<%=net_price %>">
												<table border="1">
													<tbody>
														<tr>
															<th>S.No</th>
															<th>Label</th>
															<th>Value</th>
														</tr>
														<tr>
															<td>1</td>
															<td><label>ORDER_ID::*</label></td>
															<td><input id="ORDER_ID" tabindex="1" maxlength="20"
																size="20" name="ORDER_ID" autocomplete="off"
																value="ORDS_<%=randomInt%>"></td>
														</tr>
														<tr>
															<td>2</td>
															<td><label>CUSTID ::*</label></td>
															<td><input id="CUST_ID" tabindex="2" maxlength="30"
																size="12" name="CUST_ID" autocomplete="off"
																value="CUST001"></td>
														</tr>
														<tr>
															<td>3</td>
															<td><label>INDUSTRY_TYPE_ID ::*</label></td>
															<td><input id="INDUSTRY_TYPE_ID" tabindex="4"
																maxlength="12" size="12" name="INDUSTRY_TYPE_ID"
																autocomplete="off" value="Retail"></td>
														</tr>
														<tr>
															<td>4</td>
															<td><label>Channel ::*</label></td>
															<td><input id="CHANNEL_ID" tabindex="4"
																maxlength="12" size="12" name="CHANNEL_ID"
																autocomplete="off" value="WEB"></td>
														</tr>
														<tr>
															<td>5</td>
															<td><label>txnAmount*</label></td>
															<td><input title="TXN_AMOUNT" tabindex="10"
																type="text" name="TXN_AMOUNT" value="<%=net_price%>">
															</td>
														</tr>
														<tr>
															<td></td>
															<td></td>
															<td><input value="CheckOut" type="submit" onclick=""></td>
														</tr>
													</tbody>
												</table>
												* - Mandatory Fields
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer id="colorlib-footer" role="contentinfo">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col footer-col colorlib-widget">
						<h4>About Footwear</h4>
						<p>Even the all-powerful Pointing has no control about the
							blind texts it is an almost unorthographic life</p>
						<p>
						<ul class="colorlib-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
						</p>
					</div>
					<div class="col footer-col colorlib-widget">
						<h4>Customer Care</h4>
						<p>
						<ul class="colorlib-footer-links">
							<li><a href="#">Contact</a></li>
							<li><a href="#">Returns/Exchange</a></li>
							<li><a href="#">Gift Voucher</a></li>
							<li><a href="#">Wishlist</a></li>
							<li><a href="#">Special</a></li>
							<li><a href="#">Customer Services</a></li>
							<li><a href="#">Site maps</a></li>
						</ul>
						</p>
					</div>
					<div class="col footer-col colorlib-widget">
						<h4>Information</h4>
						<p>
						<ul class="colorlib-footer-links">
							<li><a href="#">About us</a></li>
							<li><a href="#">Delivery Information</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Support</a></li>
							<li><a href="#">Order Tracking</a></li>
						</ul>
						</p>
					</div>

					<div class="col footer-col">
						<h4>News</h4>
						<ul class="colorlib-footer-links">
							<li><a href="#">Blog</a></li>
							<li><a href="#">Press</a></li>
							<li><a href="#">Exhibitions</a></li>
						</ul>
					</div>

					<div class="col footer-col">
						<h4>Contact Information</h4>
						<ul class="colorlib-footer-links">
							<li>291 South 21th Street, <br> Suite 721 New York NY
								10016
							</li>
							<li><a href="tel://1234567920">+ 1235 2355 98</a></li>
							<li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
							<li><a href="#">yoursite.com</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="copy">
				<div class="row">
					<div class="col-sm-12 text-center">
						<p>
							<span> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>
									document.write(new Date().getFullYear());
								</script> All rights reserved | This template is made with <i
								class="icon-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
							<span class="block">Demo Images: <a
								href="http://unsplash.co/" target="_blank">Unsplash</a> , <a
								href="http://pexels.com/" target="_blank">Pexels.com</a></span>
						</p>
					</div>
				</div>
			</div>
		</footer>
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
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>