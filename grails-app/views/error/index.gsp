<!DOCTYPE html>
<html>
<head>
	<title>FindLostPet | Error</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="My Pets Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<!-- Custom Theme files -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link href="${resource(dir:'css', file:'style.css')}" rel='stylesheet' type='text/css' media='all' />
	<!--webfont-->
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
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
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<!-- header-section-starts -->
			<div class="header">
				<div class="header-top">
					<div class="container">
						<p class="location">Universidad de Belgrano</p>
						<p class="phonenum">
							<g:if test="${logged == true}">
								<img src="${resource(dir:'images', file:'user.png')}" alt="" /> ${username}
							</g:if>
							<g:else>
								<img src="${resource(dir:'images', file:'user.png')}" alt="" /> No logueado
							</g:else>
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="header-bottom">
					<div class="container">
						<div class="logo">
							<g:if test="${logged == true}">
								<a href="${createLink(controller: 'search', action: 'index')}"><img src="${resource(dir:'images', file:'logo2.png')}" alt="" /></a>
							</g:if>
							<g:else>
								<a href="${createLink(controller: 'home', action: 'index')}"><img src="${resource(dir:'images', file:'logo2.png')}" alt="" /></a>
							</g:else>
						</div>
						<span class="menu"></span>
						<div class="top-menu">
							<ul>
								<nav class="cl-effect-5">
									<g:if test="${logged == true}">
										<li><a href="${createLink(controller: 'search', action: 'index')}">Buscar</a></li>
										<li><a href="${createLink(controller: 'post', action: 'index')}">Cargar</a></li>
										<li><a href="${createLink(controller: 'pet', action: 'index')}">Mis mascotas</a></li>
										<li><a <g:if test="${pending}">style="color: #FF0000"</g:if> href="${createLink(controller: 'activity', action: 'index')}">Actividad <g:if test="${pending}">(${pending})</g:if></a></li>
										<li>
											<a>
												<form method="post" controller="login" action="logout">
													<input type="submit" class="submitLink" value="  SALIR"/>
												</form>
											</a>
										</li>
									</g:if>
									<g:else>
										<li><a href="${createLink(controller: 'home', action: 'index')}">Inicio</a></li>
										<li><a href="${createLink(controller: 'login', action: 'index')}">Entrar</a></li>
									</g:else>
								</nav>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!-- header-section-ends -->
            <!-- content-section-starts -->
			<div class="content">
				<div class="container">
					<!--404-->
					<div class="error">
						<div class="error-head">
							<h1>Ups...</h1>
							<h2>Disculpa, ocurrió un error en el servidor!</h2>
							<g:if test="${logged == true}">
								<a class="hvr-bounce-to-left button" href="${createLink(controller: 'search', action: 'index')}">Volver</a>
							</g:if>
							<g:else>
								<a class="hvr-bounce-to-left button" href="${createLink(controller: 'home', action: 'index')}">Volver</a>
							</g:else>
						</div>
					</div>
				</div>
			</div>

			<!-- content-section-ends -->
            <!-- footer-section-starts -->
			<div class="header" style="padding-top: 103px">
				<div class="header-top" style="background-color: #474747;">
					<div class="container">
						<p class="location">Copyright © 2017 FindLostPet</p>
					</div>
				</div>
			</div>
			<!-- footer-section-ends -->
			<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
		</g:else>

            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
			<script src="${resource(dir:'js', file:'jquery.min.js')}"></script>
			<script src="${resource(dir:'js', file:'responsiveslides.min.js')}"></script>
			<script type="text/javascript" src="${resource(dir:'js', file:'move-top.js')}"></script>
			<script type="text/javascript" src="${resource(dir:'js', file:'easing.js')}"></script>
			<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
			<script>
                $(function () {
                    $("#slider").responsiveSlides({
                        auto: true,
                        speed: 500,
                        namespace: "callbacks",
                        pager: true
                    });
                });
			</script>
			<!-- script for menu -->
			<script>
                $( "span.menu" ).click(function() {
                    $( ".top-menu" ).slideToggle( "slow", function() {
                        // Animation complete.
                    });
                });
			</script>
			<!-- script for menu -->
			<script type="text/javascript">
                $(document).ready(function() {

                    $().UItoTop({ easingType: 'easeOutQuart' });

                });
			</script>
	</body>
</html>
