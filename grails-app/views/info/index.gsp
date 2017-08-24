<!DOCTYPE html>
<html>
<head>
    <title>Find Lost Pet | Info</title>
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
    margin: 0 px;
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
            <p class="location"><i class="location"></i>University of Belgrano</p>
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
                        <li><a class="active" href="${createLink(controller: 'info', action: 'index')}">Info</a></li>
                        <li><a href="${createLink(controller: 'photos', action: 'index')}">Photos</a></li>
                        <li><a href="${createLink(controller: 'blog', action: 'index')}">Blog</a></li>
                        <li><a href="${createLink(controller: 'blogs', action: 'index')}">Blogs</a></li>
                        <li><a href="${createLink(controller: 'contact', action: 'index')}">Contact</a></li>
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
    <!--info-->
    <div class="main">
        <div class="container">
            <div class="about-top">
                <div class="about-top-info">
                    <h3>Info</h3>
                    <div class="col-md-4 about-img">
                        <img src="${resource(dir:'images', file:'pic8.jpg')}" alt=""/>
                    </div>
                    <div class="col-md-8 about-desc">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet
                        dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper
                        suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in
                        vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan
                        et iusto odio dignissim qui blandit praesent.</p>
                        <p>Lorem ipsum dolor sit amet,consectetuer adipiscing elit,sed diam nonummy nibh euismod.tincidunt ut
                        laoreet dolore magna aliquam erat volutpat. luptatum zzril delenit augue duis dolore te feugait nulla facilisi Ut wisi enimad minim veniam, quis nostrud exercitation ullamcorper
                        suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate.ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in
                        vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan
                        et iusto odio dignissim qui blandit praesent.</p>

                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="about-bottom">
                <div class="about-topgrid1">
                    <h3>Who We Are</h3>
                    <div class="col-md-8 about-bottom-info">
                        <h5>LOREM IPM DOLOR SIT AMET, CONSECTETUER ADIPISCING ELIT. PRAESENT VESTIBULUM.</h5>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie lacus. Aeonummy hendrerit mauris..
                        It is a long established fact that a reader will be dolore magna aliquam erat volutpat. Ut wisi enimad minim veniam, quis nostrud exercitation ullamcorper distracted by the readable content of a page when looking at its layout dolore magna aliquam erat volutpat. Ut wisi enimad minim veniam, quis nostrud exercitation ullamcorper . </p>
                    </div>
                    <div class="col-md-4 about-bottom-info-right">
                        <img src="${resource(dir:'images', file:'pic9.jpg')}" alt="" />
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="aboutus">
        <div class="container">
            <div class="about-bottom-info">
                <div class="col-md-4 about-left">
                    <div class="check-in">
                        <img src="${resource(dir:'images', file:'dg-6.png')}" alt=""/>
                    </div>
                    <div class="check-out">
                        <p>Mauris fermentum dictum magna
                        sed laoreet aliquam leo ut tellus</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-4 about-left">
                    <div class="check-in">
                        <img src="${resource(dir:'images', file:'dg-5.png')}" alt=""/>
                    </div>
                    <div class="check-out">
                        <p>Mauris fermentum dictum magna
                        sed laoreet aliquam leo ut tellus</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-4 about-left">
                    <div class="check-in">
                        <img src="${resource(dir:'images', file:'dg-4.png')}" alt=""/>
                    </div>
                    <div class="check-out">
                        <p>Mauris fermentum dictum magna
                        sed laoreet aliquam leo ut tellus</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-4 about-left">
                    <div class="check-in">
                        <img src="${resource(dir:'images', file:'dg-3.png')}" alt=""/>
                    </div>
                    <div class="check-out">
                        <p>Mauris fermentum dictum magna
                        sed laoreet aliquam leo ut tellus</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-4 about-left">
                    <div class="check-in">
                        <img src="${resource(dir:'images', file:'dg-2.png')}" alt=""/>
                    </div>
                    <div class="check-out">
                        <p>Mauris fermentum dictum magna
                        sed laoreet aliquam leo ut tellus</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-4 about-left">
                    <div class="check-in">
                        <img src="${resource(dir:'images', file:'dg-1.png')}" alt=""/>
                    </div>
                    <div class="check-out">
                        <p>Mauris fermentum dictum magna
                        sed laoreet aliquam leo ut tellus</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<!--/info-->
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