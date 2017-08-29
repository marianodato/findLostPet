<!DOCTYPE html>
<html>
<head>
    <title>Find Lost Pet | Post</title>
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
                pager: true
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
            <p class="location">University of Belgrano</p>
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
                        <li><a href="${createLink(controller: 'blog', action: 'index')}">Blog</a></li>
                        <li><a href="${createLink(controller: 'blogs', action: 'index')}">Blogs</a></li>
                        <li><a href="${createLink(controller: 'contact', action: 'index')}">Contact</a></li>
                        <li><a class="active" href="${createLink(controller: 'post', action: 'index')}">Post</a></li>
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
            <div class="contact-form">
                <h2>Post</h2>
                <form method="post" action="post" enctype="multipart/form-data">
                    <noscript>
                        <div name="message" id="no_js_message" class="message">Please enable javascript and reload the page</div>
                    </noscript>
                    <g:if test="${message}">
                        <div name="message" id="message" class="message">${message}</div>
                    </g:if>
                    <div class="left_form">
                        <div>
                            <span><label>STATUS</label></span>
                            <select name="status">
                                <option value="lost">Lost</option>
                                <option value="found">Found</option>
                            </select>
                        </div>
                        <div>
                            <span><label>NICKNAME</label></span>
                            <span><input type="text" name="nickname" class="nickname" required="required"/></span>
                        </div>
                        <div>
                            <span><label>DESCRIPTION</label></span>
                            <span><textarea name="description" class="description" required="required"></textarea></span>
                        </div>
                        <div class="left_form">
                            <div style="text-align:left">
                                <span><label>GENDER</label></span>
                                <input type="radio" name="gender" value="male" checked > Male<br>
                                <input type="radio" name="gender" value="female" > Female<br>
                            </div>
                        </div>
                        <div class="rigth_form">
                            <div>
                                <span><label>IMAGE</label></span>
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
                                <option value="Other">Other</option>
                            </select>
                            <div>
                                <span><input id="inputPetColorsOther" type="hidden" name="otherColor" class="other" required="required"/></span>
                            </div>
                        </div>
                        <div>
                            <span><label>SIZE</label></span>
                            <select id="selectPetSizes" name="selectPetSizes">
                                <g:each in="${petSizes}">
                                    <option value="${it.id}">${it.description}</option>
                                </g:each>
                                <option value="Other">Other</option>
                            </select>
                            <div>
                                <span><input id="inputPetSizesOther" type="hidden" name="otherSize" class="other" required="required"/></span>
                            </div>
                        </div>
                        <div>
                            <span><label>TYPE</label></span>
                            <select id="selectPetTypes" name="selectPetTypes">
                                <g:each in="${petTypes}">
                                    <option data-id="${it.id}" value="${it.id}">${it.description}</option>
                                </g:each>
                                <option value="Other">Other</option>
                            </select>
                            <div>
                                <span><input id="inputPetTypesOther" type="hidden" name="otherType" class="other" required="required"/></span>
                            </div>
                        </div>
                        <div>
                            <span><label>RACE</label></span>
                            <select id="selectPetRaces" name="selectPetRaces">
                                <g:each in="${petRaces}">
                                    <option name="optionsPetRaces" data-id="${it.petType.id}" value="${it.id}">${it.description}</option>
                                </g:each>
                                <option id="optionPetRacesOther" value="Other">Other</option>
                            </select>
                            <div>
                                <span><input id="inputPetRacesOther" type="hidden" name="otherRace" class="other" required="required"/></span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="content_bottom">
                        <span><label>LOCATION</label></span>
                        <div>
                            <span><input id="latitude" type="hidden" name="latitude" class="latitude"/></span>
                        </div>
                        <div id="map" class="map"></div>
                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDg1CQ0HmU3luoSsa5cqSsNlFSyXwCcvJE&callback=initMap"
                                async defer></script>
                        <div>
                            <span><input id="longitude" type="hidden" name="longitude" class="longitude"/></span>
                        </div>
                        <div class="clearfix"></div>
                        <div>
                            <span><input type="submit" value="Submit" class="myButton"></span>
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
<div class="footer1">
    <div class="container">
        <div class="follow-us-on">
            <h4>Follow Us</h4>
            <div class="social-icons">
                <i class="facebook"></i>
                <i class="twitter"></i>
                <i class="pinterest"></i>
                <i class="googlepluse"></i>
            </div>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor</p>
            <div class="copyrights">
                <p>Design by  <a href="http://w3layouts.com">  W3layouts</a></p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- footer-section-ends -->
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
    var optionPetRacesOther = document.getElementById("optionPetRacesOther");
    var latitude =  document.getElementById("latitude");
    var longitude =  document.getElementById("longitude");
    var i = 0;
    var first = true;
    var petTypeId;
    var map;
    var marker;

    $(document).ready(function() {

        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */

        petColorsLogic();

        petSizesLogic();

        petTypesLogic();

        $().UItoTop({ easingType: 'easeOutQuart' });

    });

    function petColorsLogic() {
        var optionPetColorsSelectedText = selectPetColors.options[selectPetColors.selectedIndex].text;
        if(optionPetColorsSelectedText == "Other")
            inputPetColorsOther.type = 'text';
        else
            inputPetColorsOther.type = 'hidden';
    }

    function petSizesLogic(){
        var optionPetSizesSelectedText = selectPetSizes.options[selectPetSizes.selectedIndex].text;
        if(optionPetSizesSelectedText == "Other")
            inputPetSizesOther.type = 'text';
        else
            inputPetSizesOther.type = 'hidden';
    }

    function petTypesLogic(){
        var optionPetTypesSelectedText = selectPetTypes.options[selectPetTypes.selectedIndex].text;
        inputPetRacesOther.type = 'text';
        selectPetRaces.selectedIndex = optionsPetRaces.length;

        if(optionPetTypesSelectedText == "Other") {

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
        if(optionPetRacesSelectedText == "Other")
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

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: -34.603722, lng: -58.381592},
            zoom: 11
        });

        map.addListener('click', function(event) {
            addMarker(event.latLng);
        });
    }

    function addMarker(location) {
        if (marker) {
            marker.setPosition(location);
        } else {
            marker = new google.maps.Marker({
                position: location,
                map: map
            });
        }
        latitude.value = location.lat();
        longitude.value = location.lng();
    }

</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>