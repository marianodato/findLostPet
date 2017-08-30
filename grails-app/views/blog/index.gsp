<!DOCTYPE html>
<html>
<head>
<title>FindLostPet | Blog</title>
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
				<p class="location">Universidad de Belgrano</p>
				<p class="phonenum">
					<img src="${resource(dir:'images', file:'user.png')}" alt="" /> ${username}
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
							<li><a href="${createLink(controller: 'home', action: 'index')}">Home</a></li>
							<li><a href="${createLink(controller: 'info', action: 'index')}">Info</a></li>
							<li><a href="${createLink(controller: 'photos', action: 'index')}">Photos</a></li>
							<li><a class="active" href="${createLink(controller: 'blog', action: 'index')}">Blog</a></li>
							<li><a href="${createLink(controller: 'blogs', action: 'index')}">Blogs</a></li>
							<li><a href="${createLink(controller: 'contact', action: 'index')}">Contact</a></li>
							<li><a href="${createLink(controller: 'post', action: 'index')}">Post</a></li>
							<li>
								<a>
									<form method="post" controller="login" action="logout">
										<input type="submit" class="submitLink" value="LOG OUT"/>
									</form>
								</a>
							</li>
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
	<!-- content-section-starts -->
		<div class="content">
			<div class="main">
	<div class="container">
		<div class="blog-content">
	     <div class="blog-content-head text-left">
			<h3>Blog</h3>
	    </div>
			<div class="section group">
				<div class="cont span_2_of_3">
					       <div class="blog_desc">
						<div class="section group example">			
							<div class="col blog_1_of_2">
				                <div class="blog_img">
				                	<img src="${resource(dir:'images', file:'about-img2.jpg')}" alt="">
				                </div>
							</div>
								<div class="col blogdata_1_of_2">								
								<div class="blog_heading">
									<p><span>Lorem ipsum dolor sit amet consec.</span></p>
									<p class="post">Posted on jan 13th, 2015 by Finibus Bonorum </p>
							     </div>
								 <div class="blog_data">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation consequat.</p>
				                   </div>
								</div>
								<div class="clearfix"></div>
							</div>
						 <div class="clearfix"></div>	
					</div>
				<div class="single">
				<p class="text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.Donec vel ornare orci. Donec gravida, felis eu venenatis ultricies, neque libero auctor tortor, nec aliquet dolor massa quis est. Ut ut molestie turpis. Curabitur semper purus tortor, vel mollis nunc vestibulum gravida. Proin vehicula magna non dui aliquet rhoncus. In massa nisl; sollicitudin et nulla ac, feugiat auctor nisl. Nulla sed nisl nisi. Phasellus et arcu augue? Praesent sit amet vestibulum est. Maecenas ut ultrices, nunc sed auctor eleifend, tellus enim placerat velit, id porttitor ante est non nisl. Duis molestie lacus varius suscipit ullamcorper. Nullam at auctor ante. Praesent laoreet elit varius odio porta tincidunt. Morbi in nisl id eros volutpat ornare a et diam. Phasellus tempus non arcu at eleifend</p>
										<div class="clearfix"></div>
										<div class="leave">
				<h4>Leave a comment</h4>
				</div>
				<form id="commentform">
				     <p class="comment-form-author"><label for="author">Name</label>
						<input id="author" name="author" type="text" value="" size="30" aria-required="true">
					 </p>
					 <p class="comment-form-email">
						<label for="email">Email</label>
						<input id="email" name="email" type="text" value="" size="30" aria-required="true">
					 </p>
					 <p class="comment-form-url">
						<label for="url">Website</label>
						<input id="url" name="url" type="text" value="" size="30">
					 </p>
					 <p class="comment-form-comment">
						<label for="comment">Comment</label>
						<textarea></textarea>
					 </p>
					 <div class="clearfix"></div>
					<p class="form-submit">
			           <input name="submit" type="submit" id="submit" value="Send">
					</p>
					<div class="clearfix"></div>
				   </form>
				   	<div class="comments1">
								<h4>COMMENTS</h4>
			  				<div class="comments-main">
									<div class="col-md-2 cmts-main-left">
										<img src="${resource(dir:'images', file:'avatar.png')}" alt="">
									</div>
									<div class="col-md-10 cmts-main-right">
										<h5>TOM BROWN</h5>
										<p>Vivamus congue turpis in augue pellentesque scelerisque. Pellentesque aliquam laoreet sem nec ultrices. Fusce blandit nunc vehicula massa vehicula tincidunt. Nam venenatis cursus urna sed gravida. Ut tincidunt elit ut quam malesuada consequat. Sed semper purus sit amet lorem elementum faucibus.</p>
										<div class="cmts">
											<div class="col-md-6 cmnts-left">
												<p>On April 14, 2014, 18:01</p>
											</div>
											<div class="col-md-6 cmnts-right">
												<a href="#">Reply</a>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="comments-main">
									<div class="col-md-2 cmts-main-left">
										<img src="${resource(dir:'images', file:'avatar.png')}" alt="">
									</div>
									<div class="col-md-10 cmts-main-right">
										<h5>MARK JOHNSON</h5>
										<p>Vivamus congue turpis in augue pellentesque scelerisque. Pellentesque aliquam laoreet sem nec ultrices. Fusce blandit nunc vehicula massa vehicula tincidunt. Nam venenatis cursus urna sed gravida. Ut tincidunt elit ut quam malesuada consequat. Sed semper purus sit amet lorem elementum faucibus.</p>
										<div class="cmts">
											<div class="col-md-6 cmnts-left">
												<p>On April 14, 2014, 18:01</p>
											</div>
											<div class="col-md-6 cmnts-right">
												<a href="#">Reply</a>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
			  				</div>
							</div>
							</div>
					</div>
			<div class="clearfix"> 
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