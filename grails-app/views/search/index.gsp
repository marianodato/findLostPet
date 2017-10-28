<!DOCTYPE html>
<html>
<head>
    <title>FindLostPet | Buscar</title>
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
/* Always set the map height explicitly to define the size of the div
* element that contains the map. */
#map {
    width: 100%;
    height: 650px;
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
                        <li><a class="active" href="${createLink(controller: 'search', action: 'index')}">Buscar</a></li>
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
                    </nav>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<!-- header-section-ends -->
<!-- content-section-starts -->
<g:if test="${pets.size() == 0}">
    <div class="content">
        <div class="container">
            <div class="error">
                <div class="error-head">
                    <h1>Ups...</h1>
                    <h2>No hay mascotas cercanas!</h2>
                    <a class="hvr-bounce-to-left button" href="${createLink(controller: 'pet', action: 'index')}">Mis Mascotas</a>
                </div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <div class="content">
    <div class="main">
        <div class="container">
            <div class="contact-form">
                <h2>Buscar</h2>
                    <noscript>
                        <div name="message" id="no_js_message" class="message">Por favor habilite javascript y recargue la página</div>
                    </noscript>
                    <div class="content_bottom">
                        <g:each in="${pets}">
                            <div style="display: none;">
                                <span><input name="pets" type="hidden" data-description="${it.description}" data-pet_race="${it.petRace.description}" data-pet_type="${it.petType.description}" data-pet_size="${it.petSize.description}" data-pet_color="${it.petColor.description}" data-gender="${it.gender}" data-created="${it.dateCreated.format('dd/MM/yy HH:mm:ss')}" data-status="${it.status}" data-pet_user_id="${it.user.id}" data-user_id="${user.id}"  data-nickname="${it.nickname}" data-id="${it.id}" data-image="${it.image}" data-latitude="${it.latitude}" data-longitude="${it.longitude}"/></span>
                            </div>
                        </g:each>
                        <g:each in="${notifications}">
                            <div style="display: none;">
                                <span><input name="notifications" type="hidden" data-notification_pet_id="${it.pet.id}"/></span>
                            </div>
                        </g:each>
                        <div id="map" class="map"></div>
                        <script type="text/javascript">
                            var marker;
                            var infowindow;
                            var pets = document.getElementsByName("pets");
                            var notifications = document.getElementsByName("notifications");

                            function addMarker(map, id, location, pinImage) {
                                marker = new google.maps.Marker({
                                    id: id,
                                    position: location,
                                    icon: pinImage,
                                    map: map
                                });
                            }

                            function initMap() {
                                var i;
                                var pinImage;
                                var marketPos;
                                var pinImageRed = "http://maps.google.com/mapfiles/ms/icons/red-dot.png";
                                var pinImageBlue = "http://maps.google.com/mapfiles/ms/icons/blue-dot.png";
                                var pinImageGreen = "http://maps.google.com/mapfiles/ms/icons/green-dot.png";

                                var map = new google.maps.Map(document.getElementById('map'), {
                                    center: {lat: -34.603722, lng: -58.381592},
                                    zoom: 11
                                });

                                // Try HTML5 geolocation.
                                if (navigator.geolocation) {
                                    navigator.geolocation.getCurrentPosition(function(position) {
                                        var pos = {
                                            lat: position.coords.latitude,
                                            lng: position.coords.longitude
                                        };
                                        map.setCenter(pos);
                                    });
                                }

                                infowindow = new google.maps.InfoWindow({});

                                for (i=0; i < pets.length ;i++){
                                    marketPos = {lat: parseFloat(pets[i].dataset.latitude), lng: parseFloat(pets[i].dataset.longitude)};

                                    if (pets[i].dataset.user_id == pets[i].dataset.pet_user_id){
                                        pinImage = pinImageGreen;
                                    }else if (pets[i].dataset.status == "lost"){
                                        pinImage = pinImageRed;
                                    }else{
                                        pinImage = pinImageBlue;
                                    }

                                    addMarker(map, i, marketPos, pinImage);

                                    marker.addListener('click', function() {
                                        var idx = this.id;
                                        infowindow.close();
                                        var contentString = updateContentString(idx);
                                        infowindow.setContent(contentString);
                                        infowindow.open(map, this);
                                    });
                                }

                                map.addListener("click", function() {
                                    infowindow.close();
                                });
                            }
                        </script>
                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDg1CQ0HmU3luoSsa5cqSsNlFSyXwCcvJE&callback=initMap"
                                async defer></script>
                    </div>
            </div>
        </div>
    </div>
    </div>
</g:else>

<!-- content-section-ends -->
<!-- footer-section-starts -->
<g:if test="${pets.size() == 0}">
<div class="header" style="padding-top: 103px;">
</g:if>
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

        $().UItoTop({ easingType: 'easeOutQuart' });

    });

    function updateContentString(idx){
        var i = 0;
        var connected = false;
        var id = pets[idx].dataset.id;
        var image = pets[idx].dataset.image;
        var nickname = pets[idx].dataset.nickname;
        var created = pets[idx].dataset.created;
        var gender = pets[idx].dataset.gender;
        var pet_color = pets[idx].dataset.pet_color;
        var pet_size = pets[idx].dataset.pet_size;
        var pet_type = pets[idx].dataset.pet_type;
        var pet_race = pets[idx].dataset.pet_race;
        var status = pets[idx].dataset.status;
        var description = pets[idx].dataset.description;
        var user_id = pets[idx].dataset.user_id;
        var pet_user_id = pets[idx].dataset.pet_user_id;
        var contentString = "";

        contentString += "<div class=\"blog_posts\" style=\"font-size: 18px;\">" +
            "<div class=\"section group example\">" +
            "<div class=\"left_form\">" +
            "<div class=\"blog_heading\">" +
            "<p><span> " + nickname + "</span></p>" +
            "</div>" +
            "<div class=\"blog_img\">";

        if(image){
            contentString += "<img src=\"${createLink(controller:'image', action:'index')}?id=";
            contentString += id + "\" alt=\"\">";
        }else{
            contentString += "<img src=\"${resource(dir:'images', file:'not-available.png')}\" alt=\"\">";
        }

        contentString += "</div>" +
            "</div>" +
            "<div class=\"right_form\">" +
            "<div class=\"blog_heading\">" +
            "<p class=\"post\">" +
            "<b>Estado: </b>";

        if(status == "lost"){
            contentString += "Perdido";
        }else {
            contentString += "Encontrado";
        }

        contentString += "<br/><br/>" +
            "<b>Posteado: </b>"+ created + "<br/><br/>" +
            "<b>Género: </b>";

        if (gender == "male"){
            contentString += "Masculino";
        }else{
            contentString += "Femenino";
        }

        contentString += "<br/><br/>" +
            "<b>Color: </b>"+ pet_color + "<br/><br/>" +
            "<b>Tamaño: </b>"+ pet_size + "<br/><br/>" +
            "<b>Tipo: </b>"+ pet_type + "<br/><br/>" +
            "<b>Raza: </b>"+ pet_race + "<br/><br/>" +
            "<b>Descripción: </b>"+ description + "<br/><br/>" +
            "</p>" +
            "</div>" +
            "</div>";

        if (user_id != pet_user_id){

            for (i=0; i < notifications.length ;i++){
                if(notifications[i].dataset.notification_pet_id == id){
                    connected = true;
                    break;
                }
            }

            contentString += "<form method=\"post\" action=\"search\">" +
                "<span><input value=\"" + id + "\" type=\"hidden\" name=\"petId\"/></span>";

            if (connected){
                contentString += "<span><input type=\"submit\" disabled value=\"Contactado\" class=\"myButton\" style=\"float: left; background: #212425\"></span>";
            }else{
                contentString += "<span><input type=\"submit\" value=\"Contactar\" class=\"myButton\" style=\"float: left\"></span>";
            }

            contentString += "</form>";
        }

        contentString += "</div>" +
            "</div>";

        return contentString;
    }
</script>
</body>
</html>