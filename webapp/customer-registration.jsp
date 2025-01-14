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

<script>
	function check_fname() {
		var f = document.vinform.fname.value;
		var reg = /^[A-Za-z]+$/;
		if (f.trim() == "") {
			document.getElementById("errorfname").innerHTML = "Please enter your First name";
		} else if (!reg.test(f)) {
			document.getElementById("errorfname").innerHTML = "Please enter only Alphabet";

		} else {
			document.getElementById("errorfname").innerHTML = "";
		}
	}

	function check_lname() {
		var f = document.vinform.lname.value;
		var reg = /^[A-Za-z]+$/;
		if (f.trim() == "") {
			document.getElementById("errorlname").innerHTML = "Please enter your last name";
		} else if (!reg.test(f)) {
			document.getElementById("errorlname").innerHTML = "Please enter only Alphabet";

		} else {
			document.getElementById("errorlname").innerHTML = "";
		}
	}

	function check_contact() {
		var f = document.vinform.contact.value;
		var reg = /^[0-9]+$/;
		if (f.trim() == "") {
			document.getElementById("errorcontact").innerHTML = "Please enter your contact";
		} else if (!reg.test(f)) {
			document.getElementById("errorcontact").innerHTML = "Please enter only number";

		} else {
			document.getElementById("errorcontact").innerHTML = "";
		}
	}

	function check_address() {
		var f = document.vinform.address.value;
		var reg = /^[A-Za-z]+$/;
		if (f.trim() == "") {
			document.getElementById("erroraddress").innerHTML = "Please enter your address";
		} else if (!reg.test(f)) {
			document.getElementById("erroraddress").innerHTML = "";

		} else {
			document.getElementById("erroraddress").innerHTML = "";
		}
	}

	function check_password() {
		var f = document.vinform.password.value;
		var reg = /^[A-Za-z]+$/;
		if (f.trim() == "") {
			document.getElementById("errorpassword").innerHTML = "Please enter your password";
		} else if (!reg.test(f)) {
			document.getElementById("errorpassword").innerHTML = "";

		} else {
			document.getElementById("errorpassword").innerHTML = "";
		}
	}
</script>

</head>
<body>
	<script>
		var request = new XMLHttpRequest();
		function searchInfo() {
			var name = document.vinform.email.value;
			var url = "AjaxSearch.jsp?val=" + name;
			try {
				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						var val = request.responseText;
						document.getElementById('tops').innerHTML = val;
					}
				}
				request.open("GET", url, true);
				request.send();
			} catch (e) {
				alert("Unable to connect to server");
			}
		}
		function check() {

			var mobile = document.getElementById('contact');

			var message = document.getElementById('message');

			var goodColor = "#0C6";
			var badColor = "#FF9B37";

			if (contact.value.length != 10) {

				contact.style.backgroundColor = badColor;
				message.style.color = badColor;
				//message.innerHTML = "required 10 digits, match requested format!"
			}
		}
		function check_pass() {
			var password = document.getElementById('password');
			var message = document.getElementById('message');

			var goodColor = "#0C6";
			var badColor = "#FF9B37";
			if ((password.length <= 5) || (password.length > 20)) {
				 document.getElemntById('password');
				 contact.style.backgroundColor = badColor;
					message.style.color = badColor;
						message.innerHTML = "required 10 digits, match requested format!"
			}
		}
	</script>
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-sm-7 col-md-9">
							<div id="colorlib-logo">
								<a href="index.jsp">Footwear</a>
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
								<li><a href="index.jsp">Home</a></li>
								<li class="has-dropdown"><a href="#">Registration</a>
									<ul class="dropdown">
										<li><a href="customer-registration.jsp">Customer</a></li>
										<li><a href="seller-registration.jsp">Seller</a></li>
									</ul></li>

								<li class="has-dropdown"><a href="#">Login</a>
									<ul class="dropdown">
										<li><a href="customer-login.jsp">Customer</a></li>
										<li><a href="seller-login.jsp">Seller</a></li>
										<li><a href="admin-login.jsp">Admin</a></li>
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
												<a href="#"></a>
											</h3>
										</div>
									</div>
									<div class="item">
										<div class="col">
											<h3>
												<a href="#"></a>
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
							<span><a href="index.jsp">Home</a></span> / <span>Registration</span>
						</p>
					</div>
				</div>
			</div>
		</div>


		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h3>Customer Registration</h3>
					</div>
				</div>
				<div class="row">
					<div class="12">
						<div class="contact-wrap">
							<form action="CustomerController" class="contact-form"
								method="post" name="vinform">
								<div class="row">

									<div class="col-md-6">
										<div class="form-group">
											<label for="fname">First Name</label> <input type="text"
												id="fname" class="form-control" placeholder="Your firstname"
												name="fname" onblur="check_fname();" required="required"
												autocomplete="off"> <span id="errorfname"
												style="color: red;"></span>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label for="lname">Last Name</label> <input type="text"
												id="lname" class="form-control" placeholder="Your lastname"
												name="lname" onblur="check_lname();" required="required"
												autocomplete="off"> <span id="errorlname"
												style="color: red;"></span>
										</div>
									</div>

									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<label for="email">Contact</label> <input type="tel"
												id="contact" class="form-control" placeholder="Your Contact"
												name="contact" onblur="check_contact();"
												onkeyup="check(); return false;" minlength="10"
												Maxlength="10" required="required" autocomplete="off">
											<span id="message"></span> <span id="errorcontact"
												style="color: red;"></span>
										</div>
									</div>

									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<label for="email">Email</label> <input type="email"
												id="email" class="form-control"
												placeholder="Your email address" name="email"
												onblur="searchInfo()" required="required"> <span
												id="tops" style="color: red;"></span>
										</div>
									</div>

									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<label for="email">Address</label> <input type="text"
												id="address" class="form-control" placeholder="Your address"
												name="address" onblur="check_address();" required="required">
											<span id="erroraddress" style="color: red;"></span>
										</div>
									</div>

									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<label for="email">Password</label> <input type="password"
												id="password" class="form-control"
												placeholder="Your Password" name="password"
												onblur="check_password();"
												onkeyup="check_pass(); return false;"
												required="required">
												<span id="message"></span> 
												<span id="errorpassword"style="color: red;"></span>
										</div>
									</div>

									<div class="col-sm-12">
										<label for="exampleInputEmail1" class="form-label">Gender:
										</label> <input type="radio" name="gender" value="male"
											required="required"> Male <input type="radio"
											name="gender" value="female" required="required">Female
									</div>

									<div class="w-100"></div>
									<div class="col-sm-12">
										<div class="form-group">
											<input type="submit" value="register" class="btn btn-primary"
												name="action">
										</div>
									</div>
								</div>
							</form>
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
								href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span> <span class="block">Demo Images: <a
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
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>

