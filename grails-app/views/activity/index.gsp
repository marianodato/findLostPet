<!DOCTYPE html>
<html>
<head>
    <title>FindLostPet | Actividad</title>
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
                <a href="${createLink(controller: 'search', action: 'index')}"><img src="${resource(dir:'images', file:'logo2.png')}" alt="" /></a>
            </div>
            <span class="menu"></span>
            <div class="top-menu">
                <ul>
                    <nav class="cl-effect-5">
                        <li><a href="${createLink(controller: 'search', action: 'index')}">Buscar</a></li>
                        <li><a href="${createLink(controller: 'post', action: 'index')}">Cargar</a></li>
                        <li><a href="${createLink(controller: 'pet', action: 'index')}">Mis mascotas</a></li>
                        <li><a class="active" href="${createLink(controller: 'activity', action: 'index')}">Actividad</a></li>
                        <li>
                            <a>
                                <form method="post" controller="login" action="logout">
                                    <input type="submit" class="submitLink" value="  SALIR"/>
                                </form>
                            </a>
                        </li>
                    </nav>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- header-section-ends -->
<!-- content-section-starts -->
<g:if test="${notifications.size() == 0}">
    <div class="content">
        <div class="container">
            <div class="error">
                <div class="error-head">
                    <h1>Ups...</h1>
                    <h2>No tienes ninguna nueva actividad!</h2>
                    <a class="hvr-bounce-to-left button" href="${createLink(controller: 'search', action: 'index')}">Volver</a>
                </div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <div class="content">
        <div class="main">
            <div class="container">
                <div class="blog-content">
                    <div class="blog-content-head text-left">
                        <h3>Actividad</h3>
                    </div>
                    <div class="section group">
                        <div class="cont span_2_of_3">
                            <g:each in="${notifications}">
                                <div class="blog_posts">
                                    <div class="section group example">
                                        <div class="left_form">
                                            <g:if test="${user.id == it.user.id}">
                                                <g:if test="${it.pet.status == 'finished'}">
                                                    <p><span style="color: #000000"><i>${it.pet.user.name} finalizó la publicación de ${it.pet.nickname}</i></span></p>
                                                </g:if>
                                                <g:else>
                                                    <p><span style="color: #000000"><i>Contactaste con ${it.pet.user.name} por ${it.pet.nickname}</i></span></p>
                                                </g:else>
                                            </g:if>
                                            <g:else>
                                                <g:if test="${it.pet.status == 'finished'}">
                                                    <p><span style="color: #000000"><i>Finalizaste la publicación de ${it.pet.nickname}</i></span></p>
                                                </g:if>
                                                <g:else>
                                                    <p><span style="color: #000000"><i>${it.user.name} te contactó por ${it.pet.nickname}</i></span></p>
                                                </g:else>
                                            </g:else>
                                            <div class="blog_img">
                                                <g:if test="${it.pet.image}">
                                                    <img src="${createLink(controller:'image', action:'index')}?id=${it.pet.id}" alt="">
                                                </g:if>
                                                <g:else>
                                                    <img src="${resource(dir:'images', file:'not-available.png')}" alt="">
                                                </g:else>
                                            </div>
                                        </div>
                                        <div class="right_form">
                                            <div class="blog_heading">
                                                <p><span>Datos de la mascota</span></p>
                                                <p class="post"><b>Nombre:</b> ${it.pet.nickname}<br/>
                                                    <b>Estado:</b> <g:if test="${it.pet.status == 'lost'}">Perdido</g:if><g:elseif test="${it.pet.status == 'found'}">Encontrado</g:elseif><g:else>Finalizado</g:else><br/>
                                                    <b>Actualizado:</b> ${it.pet.lastUpdated.format('dd/MM/yy HH:mm:ss')}<br/>
                                                    <b>Género:</b> <g:if test="${it.pet.gender == 'male'}">Masculino</g:if><g:else>Femenino</g:else><br/>
                                                    <b>Color:</b> ${it.pet.petColor.description}<br/>
                                                    <b>Tamaño:</b> ${it.pet.petSize.description}<br/>
                                                    <b>Tipo:</b> ${it.pet.petType.description}<br/>
                                                    <b>Raza:</b> ${it.pet.petRace.description}<br/>
                                                    <b>Descripción: </b>${it.pet.description}
                                                </p>
                                                <p><span>Datos del usuario</span></p>
                                                <p class="post">
                                                    <g:if test="${user.id == it.user.id}">
                                                        <b>Nombre:</b> ${it.pet.user.name}<br/>
                                                        <b>Email:</b> ${it.pet.user.email}<br/>
                                                        <b>Teléfono:</b> ${it.pet.user.phoneNumber}<br/>
                                                    </g:if>
                                                    <g:else>
                                                        <b>Nombre:</b> ${it.user.name}<br/>
                                                        <b>Email:</b> ${it.user.email}<br/>
                                                        <b>Teléfono:</b> ${it.user.phoneNumber}<br/>
                                                    </g:else>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </g:each>
                            <div class="content-pagenation">
                                <g:if test="${page!=1 && page!=2}">
                                    <li><a href="${createLink(controller:'activity', action:'index')}?page=1">Primero</a></li>
                                    <li><span>. . . . .</span></li>
                                </g:if>
                                <g:each var="i" in="${(1..<(pages+1))}">
                                    <g:if test="${i == (page-1) || i == page || i == (page + 1)}">
                                        <li><a id="page-${i}" href="${createLink(controller:'activity', action:'index')}?page=${i}">${i}</a></li>
                                    </g:if>
                                </g:each>
                                <g:if test="${page!=pages && page!=(pages-1)}">
                                    <li><span>. . . . .</span></li>
                                    <li><a href="${createLink(controller:'activity', action:'index')}?page=${pages}">Último</a></li>
                                </g:if>

                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:else>

<!-- content-section-ends -->
<!-- footer-section-starts -->
<g:if test="${notifications.size() == 0}">
    <div class="header" style="padding-top: 103px;">
</g:if>
<g:elseif test="${notifications.size() == 1}">
    <div class="header" style="padding-top: 35px;">
</g:elseif>
<g:else>
    <div class="header">
</g:else>
<div class="header-top" style="background-color: #474747;">
    <div class="container">
        <p class="location">Copyright © 2017 FindLostPet</p>
    </div>
</div>
</div>
<!-- footer-section-ends -->
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

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

        var selectedPage = document.getElementById("page-"+${page});
        selectedPage.style = "background:#4597a8;color:#FFF;text-decoration:underline;";

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
</body>
</html>