<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
</head>

<style>

    body{
        margin:0px;
        font-family: 'Open Sans', sans-serif;
    }

    #header{
        background:#333;
        width:100%;
        display:block;
        padding: 0px 0px 0px 0px;
        margin: 0px 0px 0px 0px;
        height:50px;
        border-bottom: #252525 2px solid;
    }

    h1, p, a{
        text-align:left;
        text-decoration:none;
        font-weight:300;
    }

    #nav {padding-top:15px; text-align:center; margin: 0px auto; font-size:14px;  font-weight:500; }
    #nav ul {margin: 0; padding: 0; list-style-type: none; list-style-image: none;}
    #nav li {margin-right: 0px; display: inline;}
    #nav ul li a {text-decoration:none;  margin: 0px; padding: 10px 15px 0px 15px; color:#808080;}
    #nav ul li a:hover {color: #cccccc; text-decoration:none;}

    #nav li.current-menu-item a {color: #ffffff; text-decoration:none;}
    #nav li.current_page_item  {color: #ffffff;  text-decoration:none;}

    #top{
        background:#3498db;
        width:100%;
        min-height:100%;
        max-height:100%;
        height:373px;
        padding:90px 20px 10px 20px;
        margin: 0 auto 0 auto;
        text-align:center;
        border-bottom:#2980b9 10px solid;
        color:white;
    }

    .bluebtn{
        background:#2980b9;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:30px;
        border-bottom: #246e9e 3px solid;
        font-size:0.8em;
        border-right: #246e9e 1px solid;
        border-left: #246e9e 1px solid;
    }

    .bluebtn:hover{
        background:#2980b9;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:33px;
        border-bottom: #2980b9 3px solid;
        font-size:0.8em;
        border-right: #246e9e 1px solid;
        border-left: #246e9e 1px solid;
    }

    #about{
        background:#2ecc71;
        min-height:100%;
        max-height:100%;
        height:373px;
        padding:90px 20px 60px 20px;
        margin: 0 auto 0 auto;
        text-align:center;
        border-bottom:#27ae60 10px solid;
        color:white;
    }

    .greenbtn{
        background:#27ae60;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:30px;
        border-bottom: #239352 3px solid;
        font-size:0.8em;
        border-right: #239352 1px solid;
        border-left: #239352 1px solid;
    }

    .greenbtn:hover{
        background:#27ae60;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:33px;
        border-bottom: #27ae60 3px solid;
        font-size:0.8em;
        border-right: #27ae60 1px solid;
        border-left: #27ae60 1px solid;
    }

    #services{
        background:#34495e;
        min-height:100%;
        max-height:100%;
        height:373px;
        padding:90px 20px 60px 20px;
        margin: 0 auto 0 auto;
        text-align:center;
        border-bottom:#2c3e50 10px solid;
        color:white;
    }

    .darkbluebtn{
        background:#2c3e50;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:30px;
        border-bottom: #212e3b 3px solid;
        font-size:0.8em;
        border-right: #212e3b 1px solid;
        border-left: #212e3b 1px solid;
    }

    .darkbluebtn:hover{
        background:#2c3e50;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:33px;
        border-bottom: #2c3e50 3px solid;
        font-size:0.8em;
        border-right: #212e3b 1px solid;
        border-left: #212e3b 1px solid;
    }

    #contact{
        background:#1abc9c;
        min-height:100%;
        max-height:100%;
        height:373px;
        padding:90px 20px 10px 20px;
        margin: 0 auto 0 auto;
        text-align:center;
        border-bottom:#16a085 10px solid;
        color:white;
    }

    .lightgreenbtn{
        background:#16a085;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:30px;
        border-bottom: #13856f 3px solid;
        font-size:0.8em;
        border-right: #13856f 1px solid;
        border-left: #13856f 1px solid;
    }

    .lightgreenbtn:hover{
        background:#16a085;
        width:100px;
        text-align:center;
        color:white;
        padding:10px;
        border-radius:6px;
        margin-top:33px;
        border-bottom: #16a085 3px solid;
        font-size:0.8em;
        border-right: #13856f 1px solid;
        border-left: #13856f 1px solid;
    }

    .wrap{
        width:70%;
        margin: 0 auto 0 auto;
    }

    form { display: inline;}

    .submitLink {
        background-color: transparent;
        text-decoration:none;
        border: none;
        cursor: pointer;
        margin: 0px;
        padding: 10px 15px 0px 0px;
        color:#808080;
        font-size:14px;
        font-weight:500;
    }

    .submitLink:hover{
        color: #cccccc;
        text-decoration:none;
    }

</style>

<header>
    <div id="header" class="header">
        <div id="nav">
            <ul>
                <li><a href="#top">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#contact">Contact</a></li>
                <li>
                    <a>
                        <form method="post" action="logout">
                            <input type="submit" class="submitLink" value="Log Out">
                        </form>
                    </a>
                </li>
            </ul>
        </div> <!-- End Nav -->
    </div> <!-- End Header -->
</header>

<body>

    <!-- START TOP -->

    <div id="top">
        <div class="wrap">
            <h1>Home</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris in placerat nibh. Ut venenatis, ipsum a dictum molestie, leo sapien interdum nulla, ut commodo orci neque quis enim. Morbi et augue adipiscing, consequat lacus nec, vehicula velit. Cras neque libero, mattis vel velit ut, tincidunt porttitor urna. Integer sodales tortor in tristique illamcorper euismod dui.</p>
            <a href="#about"><div class="bluebtn">
                Go to About
            </div></a> <!-- End BlueBtn -->
        </div> <!-- End Wrap -->
    </div> <!-- End Top -->

    <!-- END TOP -->

    <!-- START ABOUT -->

    <div id="about">
        <div class="wrap">
            <h1>About</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris in placerat nibh. Ut venenatis, ipsum a dictum molestie, leo sapien interdum nulla, ut commodo orci neque quis enim. Morbi et augue adipiscing, consequat lacus nec, vehicula velit. Cras neque libero, mattis vel velit ut, tincidunt porttitor urna. Integer sodales tortor in tristique illamcorper euismod dui.</p>
            <a href="#services"><div class="greenbtn">
                Go to Services
            </div> </a> <!-- End GreenBtn -->
        </div> <!-- End Wrap -->
    </div> <!-- End About -->

    <!-- END ABOUT -->

    <!-- START SERVICES -->

    <div id="services">
        <div class="wrap">
            <h1>Services</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris in placerat nibh. Ut venenatis, ipsum a dictum molestie, leo sapien interdum nulla, ut commodo orci neque quis enim. Morbi et augue adipiscing, consequat lacus nec, vehicula velit. Cras neque libero, mattis vel velit ut, tincidunt porttitor urna. Integer sodales tortor in tristique illamcorper euismod dui.</p>

            <a href="#contact"><div class="darkbluebtn">
                Go to Contact
            </div> </a> <!-- End DarkBlueBtn -->
        </div> <!-- End Wrap -->
    </div> <!-- End Services -->

    <!-- END SERVICES -->

    <!-- START CONTACT -->

    <div id="contact">
        <div class="wrap">
            <h1>Contact</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris in placerat nibh. Ut venenatis, ipsum a dictum molestie, leo sapien interdum nulla, ut commodo orci neque quis enim. Morbi et augue adipiscing, consequat lacus nec, vehicula velit. Cras neque libero, mattis vel velit ut, tincidunt porttitor urna. Integer sodales tortor in tristique illamcorper euismod dui.</p>

            <a href="#top"><div class="lightgreenbtn">
                Back to the top!
            </div> </a> <!-- End DarkBlueBtn -->
        </div> <!-- End Wrap -->
    </div> <!-- End Contact -->

    <!-- END CONTACT -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="http://www.glennsmith.me/wp-content/themes/myTheme/js/jquery-smooth-slide.js"></script>

    <script>
        //Sticky navigation bar
        $(function() {

            // grab the initial top offset of the navigation
            var sticky_navigation_offset_top = $('#header').offset().top;

            // our function that decides weather the navigation bar should have "fixed" css position or not.
            var sticky_navigation = function(){
                var scroll_top = $(window).scrollTop(); // our current vertical position from the top

                // if we've scrolled more than the navigation, change its position to fixed to stick to top, otherwise change it back to relative
                if (scroll_top > sticky_navigation_offset_top) {
                    $('#header').css({ 'position': 'fixed', 'top':0, 'left':0 });
                } else {
                    $('#header').css({ 'position': 'relative' });
                }
            };

            // run our function on load
            sticky_navigation();

            // and run it again every time you scroll
            $(window).scroll(function() {
                sticky_navigation();
            });

            // NOT required:
            // for this demo disable all links that point to "#"
            $('a[href="#"]').click(function(event){
                event.preventDefault();
            });

        });
    </script>
</body>
</html>