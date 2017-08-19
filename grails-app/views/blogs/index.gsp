<!DOCTYPE html>
<html>
<head>
<title>My Pets | Blogs</title>
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
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
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
				<p class="location"><i class="location"></i>18A, Polo Street (Yellow Door)</p>
				<p class="phonenum">+ 655 8858 2068 54892</p>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="container">
				<div class="logo">
					<a href="${createLink(controller: 'home', action: 'index')}"><img src="${resource(dir:'images', file:'logo.png')}" alt="" /></a>
				</div>
				<span class="menu"></span>
				<div class="top-menu">
					<ul>
					<nav class="cl-effect-5">
						<li><a href="${createLink(controller: 'home', action: 'index')}">Home</a></li>
						<li><a href="${createLink(controller: 'about', action: 'index')}">About</a></li>
						<li><a href="${createLink(controller: 'photos', action: 'index')}">Photos</a></li>
						<li><a href="${createLink(controller: 'blog', action: 'index')}">Blog</a></li>
						<li><a class="active" href="${createLink(controller: 'blogs', action: 'index')}">Blogs</a></li>
						<!--<li><a href="${createLink(controller: 'contact', action: 'index')}"><span data-hover="Contact">Contact</span></a></li>-->
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
						</g:else></nav>
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
	<!-- content-section-starts -->
		<div class="content">
			<div class="main">
	<div class="container">
		<div class="blog-content">
	     <div class="blog-content-head text-left">
			<h3>Blogs</h3>
	    </div>
			<div class="section group">
				<div class="cont span_2_of_3">
					  <div class="blog_posts">
						<div class="section group example">
							<div class="col blog_1_of_2">
				                <div class="blog_img">
										<a href="${createLink(controller: 'blog', action: 'index')}"><img src="${resource(dir:'images', file:'about-img2.jpg')}" alt=""></a>
				                </div>
							</div>
								<div class="col blogdata_1_of_2">
									<div class="blog_heading">
									<p><a href="${createLink(controller: 'blog', action: 'index')}"><span>Lorem ipsum dolor sit amet consec.</span></a></p>
									<p class="post">Posted on jan 13th, 2015 by <a href="#">Finibus Bonorum </a></p>
							     </div>
									<div class="blog_data">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation consequat.</p>				                     
				                    <div class="more">
				         	  		<a href="${createLink(controller: 'blog', action: 'index')}" class="btn btn-1 btn-1d">Read More</a>
				         	  			</div>
				                   </div>
								</div>
								 <div class="clearfix"></div>	
							</div>
						 <div class="clearfix"></div>
				</div>
				<div class="blog_posts">
						<div class="section group example">			
							<div class="col blog_1_of_2">
				                <div class="blog_img">
				                	<a href="${createLink(controller: 'blog', action: 'index')}"><img src="${resource(dir:'images', file:'about-img1.jpg')}" alt=""></a>
				                </div>
							</div>
								<div class="col blogdata_1_of_2">
								<div class="blog_heading">
									<p><a href="${createLink(controller: 'blog', action: 'index')}"><span>Lorem ipsum dolor sit amet consec.</span></a></p>
									<p class="post">Posted on apr 10th, 2015 by <a href="#">Finibus Bonorum </a></p>
							     </div>
									<div class="blog_data">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation consequat.</p>				                     
				                    <div class="more">
				         	  			<a href="${createLink(controller: 'blog', action: 'index')}" class="btn btn-1 btn-1d">Read More</a>
				         	  			</div>
				                   </div>
								</div>								
								 <div class="clearfix"></div>
							</div>
						 <div class="clearfix"></div>	
					</div>
				<div class="blog_posts">
						<div class="section group example">		
							<div class="col blog_1_of_2">
				                <div class="blog_img">
				                	<a href="${createLink(controller: 'blog', action: 'index')}"><img src="${resource(dir:'images', file:'about-img3.jpg')}" alt=""></a>
				                </div>
							</div>
								<div class="col blogdata_1_of_2">
								<div class="blog_heading">
									<p><a href="${createLink(controller: 'blog', action: 'index')}"><span>Lorem ipsum dolor sit amet consec.</span></a></p>
									<p class="post">Posted on june 27th, 2015 by <a href="#">Finibus Bonorum </a> </p>
							     </div>	
									<div class="blog_data">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation consequat.</p>				                     
				                    <div class="more">
				         	  			<a href="${createLink(controller: 'blog', action: 'index')}" class="btn btn-1 btn-1d">Read More</a>
				         	  			</div>
				                   </div>
								</div>
								 <div class="clearfix"></div>
							</div>
						 <div class="clearfix"></div>	
				</div>
				<div class="content-pagenation">
						<li><a href="#">Frist</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><span>. . . . . . . . . .</span></li>
						<li><a href="#">Last</a></li>
						<div class="clearfix"> </div>
					</div>
		 </div>
				<div class="rsidebar span_1_of_3">
					 <h3>What We Offer</h3>
				     		<ul>
		  						<li>Lorem ipsum dolor sit amet</li>
		  						<li>Duis aute irure dolor in culpa </li>
		  						<li>Sunt in culpa qui illum Sunt qui</li>
		  						<li>vel illum qui dolorem man Sunt qui</li>
		  						<li>The wise man therefore culpa qui</li>
		  						<li>Sunt in culpa qui officia Sunt</li>
		  						<li>Lorem ipsum dolor sit qui</li>
		  						<li>Duis aute irure dolor in culpa qui </li>
		  						<li>Sunt in culpa qui officia vel</li>
		  					</ul>
		  					<div class="latest_comments">
					<h3>Latest Comments</h3>
				<div class="comments">
					<p><span>admin</span> commented on</p>
					 <h4><a href="#">Lorem ipsum dolor sit dolor more normal!</a></h4>
					 <p>June 25th, 2013</p>
				</div>
				<div class="comments">
					<p><span>admin</span> commented on</p>
					 <h4><a href="#">Lorem ipsum dolor sit dolor more normal!</a></h4>
					 <p>June 20th, 2013</p>
				</div>
				<div class="comments">
					<p><span>admin</span> commented on</p>
					 <h4><a href="#">Lorem ipsum dolor sit dolor more normal!</a></h4>
					 <p>June 15th, 2013</p>
				</div>
				</div>
				</div>
		    </div>
	 	
</div>
	</div>
</div>			
		</div>
	<!-- content-section-ends -->
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