<!DOCTYPE html>
<html>
<head>
<title>FindLostPet | Inicio</title>
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
					<a href="${createLink(controller: 'home', action: 'index')}"><img src="${resource(dir:'images', file:'logo2.png')}" alt="" /></a>
				</div>
				<span class="menu"></span>
				<div class="top-menu">
					<ul>
						<nav class="cl-effect-5">
							<li><a class="active" href="${createLink(controller: 'home', action: 'index')}">Inicio</a></li>
							<g:if test="${logged == true}">
								<li><a href="${createLink(controller: 'post', action: 'index')}">Carga</a></li>
							</g:if>
							<g:if test="${logged == true}">
								<li>
									<a>
										<form method="post" controller="login" action="logout">
												<input type="submit" class="submitLink" value="  SALIR"/>
										</form>
									</a>
								</li>
							</g:if>
							<g:else>
								<li><a href="${createLink(controller: 'login', action: 'index')}">Entrar</a></li>
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
						<h2>Hasta que uno ama a un animal, una parte de su alma permanece dormida.</h2>
						  <a class="more" href="${createLink(controller: 'login', action: 'index')}">UNIRME</a>
					  </div>
				 </li>
				 <li>
					 <img src="${resource(dir:'images', file:'2.jpg')}" alt=""/>
					  <div class="caption">
						<h2>Una mascota es lo único en la tierra que te ama más de lo que te amas a ti mismo.</h2>
						<a class="more" href="${createLink(controller: 'login', action: 'index')}">UNIRME</a>
					  </div>
				 </li>
				 <li>
					 <img src="${resource(dir:'images', file:'1.jpg')}" alt=""/>
					  <div class="caption">
						<h2>Los animales son muy buenos amigos, no hacen preguntas y tampoco critican.</h2>
						<a class="more" href="${createLink(controller: 'login', action: 'index')}">UNIRME</a>
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
						<h3>Bienvenido</h3>
						<h5>A nuestra red social de mascotas</h5>
						<p>Las mascotas no sólo son una compañía, son amigos con los que puedes divertirte y pasar momentos increíbles de tu vida. Pero también debes cuidar de ellas y protegerlas de todo aquello que las pueda lastimar.</p>
						<p>Para ello en FindLostPet buscamos crear una gran comunidad llena de personas repletas de amor hacia las mascotas. Si sos una de estas personas, qué estás esperando para unirte a nosotros?</p>
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
					<h2>¿Qué puedo hacer?</h2>
					<div class="col-md-6 about-section-grid text-left">
						<h4>Reportar mascotas perdidas</h4>
						<p>Con FindLostPet podrás reportar fácilmente cuando pierdas o encuentras una mascota por la calle y nuestra gran comunidad se encargará de responderte. Danos una oportunidad para poder ayudarte!</p>
					</div>
					<div class="col-md-6 about-section-grid text-left">
						<h4>Buscar mascotas cercanas</h4>
						<p>Encuentra mascotas perdidas o encontradas cerca a donde vives. Interactúa con personas con problemas similares y busca a quien puedes darle una mano en tu propio barrio. Sólamente con unos pocos clicks!</p>
					</div>
					<div class="clearfix"></div>
					<a href="${createLink(controller: 'login', action: 'index')}" class="btn btn-1 btn-1c">Unirme</a>
				</div>
			</div>
			<div class="textimonials-section text-center">
				<div class="container">
					<img src="${resource(dir:'images', file:'t.png')}" alt="" />
					<h5>Gracias a FindLostPet pude encontrar a mi cachorro bebé que se había escapado de mi casa. Recomiendo este sitio para cualquier amante de las mascotas!</h5>
					<p>Juan Ortiz</p>
					<a href="${createLink(controller: 'login', action: 'index')}" class="btn btn-1 btn-1d">Unirme</a>
				</div>
			</div>
		</div>

	<div class="header">
		<div class="header-top" style="background-color: #474747;">
			<div class="container">
				<p class="location">Copyright © 2017 FindLostPet</p>
			</div>
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