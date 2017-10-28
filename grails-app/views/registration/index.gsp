<!DOCTYPE html>
<html>
<head>
    <title>FindLostPet | Registro</title>
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
<style>
body{
    /*font-family: 'Open Sans', sans-serif;*/
    background:#4597a8;
    margin: 0 auto 0 auto;
    width:100%;
    text-align:center;
    /*margin: 20px 0px 20px 0px;*/
}
p{
    font-size:12px;
    text-decoration: none;
    color:#ffffff;
}
h1{
    font-size:1.5em;
    color:#525252;
    padding-top: 20px;
}
.header-bottom{
    background:#FFFFFF;
}
.box{
    background:white;
    width:300px;
    border-radius:6px;
    margin: 0 auto 0 auto;
    padding:0px 0px 70px 0px;
    border: #0087a8 4px solid;
}
.username{
    background:#ecf0f1;
    border: #ccc 1px solid;
    border-bottom: #ccc 2px solid;
    padding: 8px;
    width:250px;
    color:#AAAAAA;
    margin-top:10px;
    font-size:1em;
    border-radius:4px;
}
.password{
    border-radius:4px;
    background:#ecf0f1;
    border: #ccc 1px solid;
    padding: 8px;
    width:250px;
    font-size:1em;
}
.btn3{
    float:left;
    background:#27ae60;
    width:125px;  padding-top:5px;
    padding-bottom:5px;
    color:white;
    border-radius:4px;
    border: #00cc18 1px solid;
    margin-top:20px;
    margin-bottom:20px;
    margin-left:85px;
    font-weight:800;
    font-size:0.8em;
}
.btn3:hover{
    background:#2ecc71;
}
.btn2{
    float:left;
    background:#3498db;
    width:125px;  padding-top:5px;
    padding-bottom:5px;
    color:white;
    border-radius:4px;
    border: #2980b9 1px solid;
    margin-top:20px;
    margin-bottom:20px;
    margin-left:10px;
    font-weight:800;
    font-size:0.8em;
}
.btn2:hover{
    background: #37bfd2;
}
.login_div {
    position: relative;
    /* Center form on page horizontally & vertically */
    margin-top: 5%;
    margin-left: 0%;
}
.login_form {
    border-radius: 10px;
    margin: 0;
    padding: 0;
}
.message {
    font-size:1.0em;
    color:#ff0000;
}
</style>
<body>
<!-- header-section-starts -->
<div class="header">
    <div class="header-top">
        <div class="container">
            <p class="location">Universidad de Belgrano</p>
            <p class="phonenum">
                <img src="${resource(dir:'images', file:'user.png')}" alt="" /> No logueado
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
                        <li><a href="${createLink(controller: 'home', action: 'index')}">Inicio</a></li>
                        <li><a href="${createLink(controller: 'login', action: 'index')}">Entrar</a></li>
                    </nav>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- header-section-ends -->
<div class="slider">
    <div class="callbacks_container">
        <div class="rslides" id="slider">
            <div class="login_div">
                <form class="login_form" method="post" action="registration">
                    <div class="box">
                        <h1>Unirse</h1>
                        <g:if test="${message}">
                            <div name="message" id="message" class="message">${message}</div>
                        </g:if>
                        <input type="text" name="username" value="Usuario" pattern='(?=^.{6,20}$)^[a-zA-Z][a-zA-Z0-9]*[._-]?[a-zA-Z0-9]+$' title="Formato: Sólo un caracter especial (._-) permitido y no debe estar en los extremos. El primer caracter no puede ser numérico. Todos los demás caracteres permitidos son letras y números. La longitud total debe estar entre 6 y 20 caracteres" onFocus="field_focus(this, 'Usuario');" onblur="field_blur(this, 'Usuario');" class="username" required="required" />
                        <input type="password" name="password" value="Contraseña" pattern='^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!#%*?&])[A-Za-z\d$@$!#%*?&]{8,}' title="Formato: Mínimo 8 caracteres, al menos 1 en mayúscula, 1 en minúscula, 1 número y 1 caracter especial" onFocus="field_focus(this, 'Contraseña');" onblur="field_blur(this, 'Contraseña');" class="username" required="required" />
                        <input type="email" name="email" value="Email" onFocus="field_focus(this, 'Email');" onblur="field_blur(this, 'Email');" class="username" required="required"/>
                        <input type="text" name="name" value="Nombre completo" onFocus="field_focus(this, 'Nombre completo');" onblur="field_blur(this, 'Nombre completo');" class="username" required="required"/>
                        <input type='tel' name="phone_number" value="Número telefónico" pattern='[\+]\d{2}[\(]\d{2}[\)]\d{4}[\-]\d{4}' title="Formato: +54(11)1234-5678" onFocus="field_focus(this, 'Número telefónico');" onblur="field_blur(this, 'Número telefónico');" class="username" required="required">
                        <div style="text-align:left;padding-top: 10px;padding-left: 20px">
                            <input type="radio" name="gender" value="male" checked > Masculino<br>
                            <input type="radio" name="gender" value="female" > Femenino<br>
                        </div>
                        <g:submitButton disabled="false" class="btn3" id="sign_up" name="sign_up" value="Registrarme"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- footer-section-starts -->
<div class="header" style="padding-top: 72px">
    <div class="header-top" style="background-color: #474747;">
        <div class="container">
            <p class="location">Copyright © 2017 FindLostPet</p>
        </div>
    </div>
</div>
<!-- footer-section-ends -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${resource(dir:'js', file:'jquery.min.js')}"></script>
<script src="${resource(dir:'js', file:'responsiveslides.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'move-top.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'easing.js')}"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
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
<script>
    function field_focus(field, value)
    {
        if(field.value == value)
        {
            field.value = '';
        }
    }
    function field_blur(field, value)
    {
        if(field.value == '')
        {
            field.value = value;
        }
    }
    //Fade in welcome box
    $(document).ready(function(){
        $('.box').hide().fadeIn(1000);
    });
</script>
</body>
</html>