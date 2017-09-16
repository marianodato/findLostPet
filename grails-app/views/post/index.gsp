<!DOCTYPE html>
<html>
<head>
    <title>FindLostPet | Cargar</title>
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
/* Always set the map height explicitly to define the size of the div
   * element that contains the map. */
#map {
    width: 100%;
    height: 350px;
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
                        <li><a href="${createLink(controller: 'search', action: 'index')}">Buscar</a></li>
                        <li><a class="active" href="${createLink(controller: 'post', action: 'index')}">Cargar</a></li>
                        <li><a href="${createLink(controller: 'pet', action: 'index')}">Mis mascotas</a></li>
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
<div class="content">
    <div class="main">
        <div class="container">
            <div class="contact-form">
                <h2>Cargar</h2>
                <form method="post" action="post" enctype="multipart/form-data">
                    <noscript>
                        <div name="message" id="no_js_message" class="message">Por favor habilite javascript y recargue la página</div>
                    </noscript>
                    <g:if test="${message}">
                        <div name="message" id="message" class="message">${message}</div>
                    </g:if>
                    <div class="left_form">
                        <div>
                            <span><label>ESTADO</label></span>
                            <select name="status">
                                <option value="lost">Perdido</option>
                                <option value="found">Encontrado</option>
                            </select>
                        </div>
                        <div>
                            <span><label>APODO</label></span>
                            <span><input type="text" name="nickname" class="nickname" required="required"/></span>
                        </div>
                        <div>
                            <span><label>DESCRIPCIÓN</label></span>
                            <span><textarea name="description" class="description" required="required"></textarea></span>
                        </div>
                        <div>
                            <div style="text-align:left">
                                <span><label>GÉNERO</label></span>
                                <input type="radio" name="gender" value="male" checked > Masculino<br>
                                <input type="radio" name="gender" value="female" > Femenino<br>
                            </div>
                        </div>
                        <div>
                            <div>
                                <span><label>IMÁGEN</label></span>
                                <input type="file" name="image" accept="image/*">
                            </div>
                        </div>
                    </div>
                    <div class="right_form">
                        <div>
                            <span><label>COLOR</label></span>
                            <select id="selectPetColors" name = "selectPetColors">
                                    <g:each in="${petColors}">
                                        <option value="${it.id}">${it.description}</option>
                                    </g:each>
                                <option value="Other">Otro</option>
                            </select>
                            <div>
                                <span><input id="inputPetColorsOther" type="hidden" name="otherColor" class="other" required="required"/></span>
                            </div>
                        </div>
                        <div>
                            <span><label>TAMAÑO</label></span>
                            <select id="selectPetSizes" name="selectPetSizes">
                                <g:each in="${petSizes}">
                                    <option value="${it.id}">${it.description}</option>
                                </g:each>
                                <option value="Other">Otro</option>
                            </select>
                            <div>
                                <span><input id="inputPetSizesOther" type="hidden" name="otherSize" class="other" required="required"/></span>
                            </div>
                        </div>
                        <div>
                            <span><label>Tipo</label></span>
                            <select id="selectPetTypes" name="selectPetTypes">
                                <g:each in="${petTypes}">
                                    <option data-id="${it.id}" value="${it.id}">${it.description}</option>
                                </g:each>
                                <option value="Other">Otro</option>
                            </select>
                            <div>
                                <span><input id="inputPetTypesOther" type="hidden" name="otherType" class="other" required="required"/></span>
                            </div>
                        </div>
                        <div>
                            <span><label>RAZA</label></span>
                            <select id="selectPetRaces" name="selectPetRaces">
                                <g:each in="${petRaces}">
                                    <option name="optionsPetRaces" data-id="${it.petType.id}" value="${it.id}">${it.description}</option>
                                </g:each>
                                <option id="optionPetRacesOther" value="Other">Otro</option>
                            </select>
                            <div>
                                <span><input id="inputPetRacesOther" type="hidden" name="otherRace" class="other" required="required"/></span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="content_bottom">
                        <span><label>UBICACIÓN</label></span>
                        <div>
                            <span><input id="latitude" type="hidden" name="latitude" class="latitude"/></span>
                        </div>
                        <div id="map" class="map"></div>
                        <script type="text/javascript">
                            function initMap() {
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

                                map.addListener('click', function(event) {
                                    addMarker(map, event.latLng);
                                });
                            }
                        </script>
                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDg1CQ0HmU3luoSsa5cqSsNlFSyXwCcvJE&callback=initMap"
                                async defer></script>
                        <div>
                            <span><input id="longitude" type="hidden" name="longitude" class="longitude"/></span>
                        </div>
                        <div class="clearfix"></div>
                        <div>
                            <span><input type="submit" value="Cargar" class="myButton"></span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
</div>
<!-- content-section-ends -->
<!-- footer-section-starts -->
<div class="header">
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

    var selectPetColors = document.getElementById("selectPetColors");
    var inputPetColorsOther = document.getElementById("inputPetColorsOther");
    var selectPetSizes = document.getElementById("selectPetSizes");
    var inputPetSizesOther = document.getElementById("inputPetSizesOther");
    var selectPetTypes = document.getElementById("selectPetTypes");
    var inputPetTypesOther = document.getElementById("inputPetTypesOther");
    var selectPetRaces = document.getElementById("selectPetRaces");
    var inputPetRacesOther = document.getElementById("inputPetRacesOther");
    var optionsPetRaces = document.getElementsByName("optionsPetRaces");
    var latitude =  document.getElementById("latitude");
    var longitude =  document.getElementById("longitude");
    var marker;

    $(document).ready(function() {

        petColorsLogic();

        petSizesLogic();

        petTypesLogic();

        $().UItoTop({ easingType: 'easeOutQuart' });

    });

    function petColorsLogic() {
        var optionPetColorsSelectedText = selectPetColors.options[selectPetColors.selectedIndex].text;
        if(optionPetColorsSelectedText == "Otro")
            inputPetColorsOther.type = 'text';
        else
            inputPetColorsOther.type = 'hidden';
    }

    function petSizesLogic(){
        var optionPetSizesSelectedText = selectPetSizes.options[selectPetSizes.selectedIndex].text;
        if(optionPetSizesSelectedText == "Otro")
            inputPetSizesOther.type = 'text';
        else
            inputPetSizesOther.type = 'hidden';
    }

    function petTypesLogic(){
        var optionPetTypesSelectedText = selectPetTypes.options[selectPetTypes.selectedIndex].text;
        var i = 0;
        var petTypeId;
        var first = true;
        inputPetRacesOther.type = 'text';
        selectPetRaces.selectedIndex = optionsPetRaces.length;

        if(optionPetTypesSelectedText == "Otro") {

            inputPetTypesOther.type = 'text';

            for (i=0; i < optionsPetRaces.length ;i++)
                optionsPetRaces[i].setAttribute("hidden", true);

        }else
        {
            inputPetTypesOther.type = 'hidden';

            petTypeId = selectPetTypes.options[selectPetTypes.selectedIndex].dataset.id;
            first = true;

            for (i=0; i < optionsPetRaces.length ;i++) {
                if (optionsPetRaces[i].dataset.id != petTypeId) {
                    optionsPetRaces[i].setAttribute("hidden", true);
                }else {
                    optionsPetRaces[i].removeAttribute("hidden");
                    if (first){
                        inputPetRacesOther.type = 'hidden';
                        selectPetRaces.selectedIndex = i;
                    }
                    first = false;
                }
            }

        }
    }

    function petRacesLogic() {
        var optionPetRacesSelectedText = selectPetRaces.options[selectPetRaces.selectedIndex].text;
        if(optionPetRacesSelectedText == "Otro")
            inputPetRacesOther.type = 'text';
        else
            inputPetRacesOther.type = 'hidden';
    }

    selectPetColors.addEventListener("change", function() {
        petColorsLogic();
    });

    selectPetSizes.addEventListener("change", function() {
        petSizesLogic();
    });

    selectPetTypes.addEventListener("change", function() {
        petTypesLogic()
    });

    selectPetRaces.addEventListener("change", function() {
        petRacesLogic();
    });

    function addMarker(map, location) {
        if (marker) {
            marker.setPosition(location);
        } else {
            marker = new google.maps.Marker({
                position: location,
                icon: "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
                map: map
            });
        }
        latitude.value = location.lat();
        longitude.value = location.lng();
    }
</script>
</body>
</html>