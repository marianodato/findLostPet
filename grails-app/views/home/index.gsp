<!DOCTYPE html>
<html>
<head>
<title>Find Lost Pet | Home</title>
	<link href="${resource(dir:'css', file:'bootstrap.css')}" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${resource(dir:'js', file:'jquery.min.js')}"></script>
<!-- Custom Theme files -->
	<link href="${resource(dir:'css', file:'style.css')}" rel='stylesheet' type='text/css' media='all' />
<!-- Custom Theme files -->
<!-- navigation -->
<!-- navigation -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Pets Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<script src="${resource(dir:'js', file:'responsiveslides.min.js')}"></script>
 <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
  <script type="text/javascript" src="${resource(dir:'js', file:'move-top.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'easing.js')}"></script>
</head>
<style>
	.submitLink {
		background-color: transparent;
		text-decoration:none;
		border: none;
		cursor: pointer;
		margin: 0px;
		padding: 0px 10px 0px 0px;
	}

	.submitLink:hover{
		color: #4597a8;
		text-decoration:none;
	}

</style>
<body>
    <!-- header-section-starts -->
	<div class="header">
		<div class="header-top">
			<div class="container">
				<p class="location">University of Belgrano</p>
				<p class="phonenum">
					<g:if test="${logged == true}">
						<img src="${resource(dir:'images', file:'user.png')}" alt="" /> ${username}
					</g:if>
					<g:else>
						<img src="${resource(dir:'images', file:'user.png')}" alt="" /> Not logged in
					</g:else>
				</p>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="container">
				<div class="logo">
					<a href="${createLink(controller: 'home', action: 'index')}"><img src="${resource(dir:'images', file:'logo2.png')}" alt="" /></a>
				</div>
				<span class="menu"></span>
				<div class="top-menu">
					<ul>
						<nav class="cl-effect-5">
							<li><a class="active" href="${createLink(controller: 'home', action: 'index')}">Home</a></li>
							<g:if test="${logged == true}">
								<li><a href="${createLink(controller: 'info', action: 'index')}">Info</a></li>
								<li><a href="${createLink(controller: 'photos', action: 'index')}">Photos</a></li>
								<li><a href="${createLink(controller: 'blog', action: 'index')}">Blog</a></li>
								<li><a href="${createLink(controller: 'blogs', action: 'index')}">Blogs</a></li>
								<li><a href="${createLink(controller: 'contact', action: 'index')}">Contact</a></li>
								<li><a href="${createLink(controller: 'post', action: 'index')}">Post</a></li>
							</g:if>
							<g:if test="${logged == true}">
								<li>
									<a>
										<form method="post" controller="login" action="logout">
											<input type="submit" class="submitLink" value="LOG OUT"/>
										</form>
									</a>
								</li>
							</g:if>
							<g:else>
								<li><a href="${createLink(controller: 'login', action: 'index')}">Login</a></li>
							</g:else>
						</nav>
					</ul>
				</div>
				<!-- script for menu -->
				<script>
				$( "span.menu" ).click(function() {
				  $( ".top-menu" ).slideToggle( "slow", function() {
				    // Animation complete.
				  });
				});
			</script>
			<!-- script for menu -->
					<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<div class="banner">
		<!----->
	<div class="slider">	  
		  <div class="callbacks_container">
			  <ul class="rslides" id="slider">
				 <li>
					 <img src="${resource(dir:'images', file:'3.jpg')}" alt=""/>
					  <div class="caption">
						<h2>Until one has loved an animal a part of one's soul remains unawakened.</h2>
						<a class="more" href="#">READ MORE</a>
					  </div>
				 </li>
				 <li>
					 <img src="${resource(dir:'images', file:'2.jpg')}" alt=""/>
					  <div class="caption">
						<h2>A dog is the only thing on earth that loves you more than you love yourself.</h2>
						<a class="more" href="#">READ MORE</a>
					  </div>
				 </li>
				 <li>
					 <img src="${resource(dir:'images', file:'1.jpg')}" alt=""/>
					  <div class="caption">
						<h2>Money can buy you a fine dog, but only love can make him wag his tail.</h2>
						<a class="more" href="#">READ MORE</a>
					  </div>
				 </li>
			  </ul>	      
		  </div>
	</div>
	<!----->
	</div>
	<!-- content-section-starts -->
		<div class="content">
			<div class="welcome-section">
				<div class="container">
					<div class="col-md-6 welcome-grid text-center">
						<h3>Welcome</h3>
						<h5>Duis autem vel eum iriure dolor in hendrerit in vulputa</h5>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
						<p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. littera gothica.</p>
					</div>
					<div class="col-md-6 images">
						<div class="img1">
							<img src="${resource(dir:'images', file:'a1.jpg')}" class="img-responsive" alt="" />
						</div>
						<div class="img2">
						<img src="${resource(dir:'images', file:'a2.jpg')}" class="img-responsive" alt="" />
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="about-section text-center">
				<div class="container">
					<h2>Info</h2>
					<div class="col-md-6 about-section-grid text-left">
						<h4>Mirum est notare quam littera </h4>
						<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio</p>
					</div>
					<div class="col-md-6 about-section-grid text-left">
						<h4>Mirum est notare quam littera </h4>
						<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio</p>
					</div>
					<div class="clearfix"></div>
					<a href="${createLink(controller: 'info', action: 'index')}" class="btn btn-1 btn-1c">read more</a>
				</div>
			</div>
			<div class="textimonials-section text-center">
				<div class="container">
					<img src="${resource(dir:'images', file:'t.png')}" alt="" />
					<h5>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram</h5>
					<p>Duis autem vel eum iriure dolor</p>
					<a href="" class="btn btn-1 btn-1d">Read Testimonials</a>
				</div>
			</div>
		</div>
	<!-- content-section-ends -->
	<div class="main-map">
		    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d396369.7968760607!2d-94.5757195!3d39.091919000000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x87c0f75eafe99997%3A0x558525e66aaa51a2!2sKansas+City%2C+MO%2C+USA!5e0!3m2!1sen!2sin!4v1416895090472"  frameborder="0" style="border:0"></iframe>
		</div>

	<!-- footer-section-starts -->
	<div class="footer">
		<div class="container">
			<div class="col-md-5 contact-section">
				<h4>Contact Form</h4>
					<input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
					<input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
					<textarea onfocus="if(this.value == 'Message') this.value='';" onblur="if(this.value == '') this.value='Message';" >Message</textarea>
					<input type="submit" value="SEND">
			</div>
			<div class="col-md-7 follow-us">
				<h4>Follow Us</h4>
				<div class="social-icons">
					<i class="facebook"></i>
					<i class="twitter"></i>
					<i class="pinterest"></i>
					<i class="googlepluse"></i>
				</div>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor</p>
				<div class="copyright">
					<p>Design by  <a href="http://w3layouts.com">  W3layouts</a></p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- footer-section-ends -->
	<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>