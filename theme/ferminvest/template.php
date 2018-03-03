<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
  <?php $page->printHead(); ?>
    <!-- Stylesheets -->
    <link href="<?php echo THEMEURL; ?>/css/bootstrap.css" rel="stylesheet">
    <link href="<?php echo THEMEURL; ?>/css/revolution-slider.css" rel="stylesheet">
    <link href="<?php echo THEMEURL; ?>/css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="<?php echo THEMEURL; ?>/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<?php echo THEMEURL; ?>/images/favicon.ico" type="image/x-icon">
    <!-- Responsive -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link href="<?php echo THEMEURL; ?>/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
    <!--[if lt IE 9]><script src="<?php echo THEMEURL; ?>/js/respond.js"></script><![endif]-->
    <script src="<?php echo THEMEURL; ?>/js/jquery.js"></script>
</head>

<body>

<div class="page-wrapper">

    <!-- Preloader -->
    <div class="preloader"></div>

    <!-- Main Header-->
    <header class="main-header">

        <!-- Main Box -->
        <div class="main-box">
            <div class="auto-container">
                <div class="outer-container clearfix">
                    <!--Logo Box-->
                    <div class="logo-box">
                        <div class="logo"><a href="/"><img src="<?php echo THEMEURL; ?>/images/logo-4.png" alt=""></a></div>
                    </div>

                    <!--Nav Outer-->
                    <div class="nav-outer clearfix">
                        <!-- Main Menu -->
                        <nav class="main-menu">
                            <div class="navbar-header">
                                <!-- Toggle Button -->
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>

                            <div class="navbar-collapse collapse clearfix">
                                <?php $core->loadModule('topmenu');?>
                            </div>
                        </nav>

                    </div>

                    <div class="nav-toggler">
                        <button class="hidden-bar-opener"><span class="icon fa fa-bars"></span></button>
                    </div>
                </div>
            </div>
        </div>

    </header>
    <!--End Main Header -->


    <!-- Hidden Navigation Bar -->
    <section class="hidden-bar right-align">

        <div class="hidden-bar-closer">
            <button class="btn"><i class="fa fa-close"></i></button>
        </div>

        <!-- Hidden Bar Wrapper -->
        <div class="hidden-bar-wrapper">

            <!-- .logo -->
            <div class="logo text-center">
                <a href="index.html"><img src="<?php echo THEMEURL ?>/images/logo-4.png" alt=""></a>
            </div><!-- /.logo -->

            <!-- .Side-menu -->
            <div class="side-menu">
                <!-- .navigation -->
                <ul class="navigation">
                    <li class="current dropdown"><a href="#">Home</a>
                        <ul>
                            <li><a href="index.html">Homepage One</a></li>
                            <li><a href="index-2.html">Homepage Two</a></li>
                            <li><a href="index-3.html">Homepage Three</a></li>
                            <li class="dropdown"><a href="index-3.html">Header Styles</a>
                                <ul>
                                    <li><a href="index.html">Header Style One</a></li>
                                    <li><a href="index-2.html">Header Style Two</a></li>
                                    <li><a href="index-3.html">Header Style Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="about-us.html">About Us</a></li>
                    <li class="dropdown"><a href="#">Gallery</a>
                        <ul>
                            <li><a href="gallery-three-column.html">Gallery Three Column</a></li>
                            <li><a href="gallery-masonry.html">Gallery Masonry</a></li>
                            <li><a href="gallery-fullwidth.html">Gallery Fullwidth</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#">Blog</a>
                        <ul>
                            <li><a href="blog.html">Our Blog</a></li>
                            <li><a href="blog-single.html">Blog Single</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#">Shop</a>
                        <ul>
                            <li><a href="shop.html">Our Shop</a></li>
                            <li><a href="shop-single.html">Shop Single</a></li>
                            <li><a href="shopping-cart.html">Shopping Cart</a></li>
                            <li><a href="checkout.html">Checkout</a></li>
                        </ul>
                    </li>
                    <li><a href="contact.html">Contact Us</a></li>
                </ul>
            </div><!-- /.Side-menu -->

            <div class="social-icons">
                <ul>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>

        </div><!-- / Hidden Bar Wrapper -->
    </section>
    <!-- / Hidden Bar -->


    <!--Main Slider-->
    <?php if ($core->loadModuleCount('slider')) {?>
    <section class="main-slider" id="scroll-section-one" data-start-height="900" data-slide-overlay="yes">
        <div class="tp-banner-container">
            <div class="tp-banner">
                <ul>

                    <li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-thumb="<?php echo THEMEURL ?>/images/main-slider/image-1.jpg"
                        data-saveperformance="off"  data-title="Awesome Title Here">
                        <img src="<?php echo THEMEURL ?>/images/main-slider/image-1.jpg"
                             alt=""
                             data-bgposition="center top"
                             data-bgfit="cover" data-bgrepeat="no-repeat">

                        <div class="tp-caption sfl sfb tp-resizeme"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-150"
                             data-speed="1500"
                             data-start="500"
                             data-easing="easeOutExpo"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.3"
                             data-endspeed="1200"
                             data-endeasing="Power4.easeIn"><h2>VODIY  SAXOVATI</h2></div>

                        <div class="tp-caption sfr sfb tp-resizeme"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-70"
                             data-speed="1500"
                             data-start="500"
                             data-easing="easeOutExpo"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.3"
                             data-endspeed="1200"
                             data-endeasing="Power4.easeIn"><div class="big-text">AGROINVEST  ULGURJI  SAVDO</div></div>

<!--                        <div class="tp-caption sfl sfb tp-resizeme"-->
<!--                             data-x="center" data-hoffset="0"-->
<!--                             data-y="center" data-voffset="0"-->
<!--                             data-speed="1500"-->
<!--                             data-start="500"-->
<!--                             data-easing="easeOutExpo"-->
<!--                             data-splitin="none"-->
<!--                             data-splitout="none"-->
<!--                             data-elementdelay="0.01"-->
<!--                             data-endelementdelay="0.3"-->
<!--                             data-endspeed="1200"-->
<!--                             data-endeasing="Power4.easeIn"><a href="shop.html" class="theme-btn btn-style-one">Shop Now</a></div>-->


                    </li>

                    <li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-thumb="<?php echo THEMEURL ?>/images/main-slider/image-2.jpg"  data-saveperformance="off"  data-title="Awesome Title Here">
                        <img src="<?php echo THEMEURL ?>/images/main-slider/image-2.jpg"  alt=""  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

                        <div class="tp-caption sfl sfb tp-resizeme"
                             data-x="left" data-hoffset="15"
                             data-y="center" data-voffset="-140"
                             data-speed="1500"
                             data-start="500"
                             data-easing="easeOutExpo"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.3"
                             data-endspeed="1200"
                             data-endeasing="Power4.easeIn"><figure class="content-image"><img src="<?php echo THEMEURL ?>/images/main-slider/leaf-icon.png" alt=""></figure></div>

                        <div class="tp-caption sfr sfb tp-resizeme"
                             data-x="left" data-hoffset="15"
                             data-y="center" data-voffset="-10"
                             data-speed="1500"
                             data-start="500"
                             data-easing="easeOutExpo"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.3"
                             data-endspeed="1200"
                             data-endeasing="Power4.easeIn"><h3>Мева ва сабзавотлар</h3></div>

<!--                        <div class="tp-caption sfl sfb tp-resizeme"-->
<!--                             data-x="left" data-hoffset="15"-->
<!--                             data-y="center" data-voffset="110"-->
<!--                             data-speed="1500"-->
<!--                             data-start="500"-->
<!--                             data-easing="easeOutExpo"-->
<!--                             data-splitin="none"-->
<!--                             data-splitout="none"-->
<!--                             data-elementdelay="0.01"-->
<!--                             data-endelementdelay="0.3"-->
<!--                             data-endspeed="1200"-->
<!--                             data-endeasing="Power4.easeIn">-->
<!--                            <a href="shop.html" class="theme-btn btn-style-one">Shop Now</a> &ensp;&ensp;-->
<!--                            <a href="shop.html" class="theme-btn btn-style-three">Buy Now</a>-->
<!--                        </div>-->


                    </li>

                    <li data-transition="zoomout" data-slotamount="1" data-masterspeed="1000" data-thumb="<?php echo THEMEURL ?>/images/main-slider/image-3.jpg"  data-saveperformance="off"  data-title="Awesome Title Here">
                        <img src="<?php echo THEMEURL ?>/images/main-slider/image-3.jpg"  alt=""  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

                        <div class="tp-caption sft sfb tp-resizeme"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-140"
                             data-speed="1500"
                             data-start="500"
                             data-easing="easeOutExpo"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.3"
                             data-endspeed="1200"
                             data-endeasing="Power4.easeIn"><figure class="content-image"><img src="<?php echo THEMEURL ?>/images/main-slider/leaf-icon.png" alt=""></figure></div>

                        <div class="tp-caption sft sfb tp-resizeme"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-10"
                             data-speed="1500"
                             data-start="500"
                             data-easing="easeOutExpo"
                             data-splitin="none"
                             data-splitout="none"
                             data-elementdelay="0.01"
                             data-endelementdelay="0.3"
                             data-endspeed="1200"
                             data-endeasing="Power4.easeIn"><h3 class="text-center">Қишлоқ хўжалик махсулотлари</h3></div>

<!--                        <div class="tp-caption sfb sfb tp-resizeme"-->
<!--                             data-x="center" data-hoffset="0"-->
<!--                             data-y="center" data-voffset="110"-->
<!--                             data-speed="1500"-->
<!--                             data-start="500"-->
<!--                             data-easing="easeOutExpo"-->
<!--                             data-splitin="none"-->
<!--                             data-splitout="none"-->
<!--                             data-elementdelay="0.01"-->
<!--                             data-endelementdelay="0.3"-->
<!--                             data-endspeed="1200"-->
<!--                             data-endeasing="Power4.easeIn"><a href="shop.html" class="theme-btn btn-style-one">Shop Now</a> &ensp;&ensp; <a href="shop.html" class="theme-btn btn-style-three">Buy Now</a></div>-->


                    </li>

                </ul>

                <div class="tp-bannertimer"></div>
            </div>
        </div>
    </section>
    <?php }?>

    <?php $core->loadModule('maintop');?>
    <?php if ($page->page_body) { ?>
        <section class="page-title" style="background-image:url(<?php echo THEMEURL;?>/images/background/bg-page-title-1.jpg);">
            <div class="auto-container">
                <h1>&nbsp;</h1>
            </div>
        </section>
    <div class="sidebar-page-container">
        <div class="auto-container">
            <div class="row clearfix">
                <div class="content-side <?php if ($core->loadModuleCount('sidebar1')) {?>col-lg-9 col-md-8 col-sm-12 col-xs-12<?php } else { ?>col-lg-12 col-md-12 col-sm-12 col-xs-12<?php } ?>">
            <?php $page->printComponent(); ?>
                </div>
                <!--Sidebar-->
                <div class="sidebar-side col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <aside class="sidebar">
                        <?php $core->loadModule('sidebar1');?>


                    </aside>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <?php $core->loadModule('mainbottom');?>

<!--    <section class="sponsors-style-one alternate">-->
<!--        <div class="auto-container">-->

<!---->
<!---->
<!--            <div class="sponsors-outer">-->

<!--                <ul class="sponsors-carousel">-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/1.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/2.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/3.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/4.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/5.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/1.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/2.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/3.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/4.png" alt=""></a></figure></li>-->
<!--                    <li class="slide-item"><figure class="image-box"><a href="#"><img src="--><?php //echo THEMEURL ?><!--/images/sponsors/5.png" alt=""></a></figure></li>-->
<!--                </ul>-->
<!--            </div>-->
<!--        </div>-->
<!--    </section>-->




    <!--Main Footer / Footer Style One-->
    <footer class="main-footer footer-style-one">

        <!--Footer Upper-->
        <div class="footer-upper">
            <div class="auto-container">
                <div class="row clearfix">

                    <?php $core->loadModule('footer1')?>

                    <!--Footer Column-->
<!--                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 column">-->
<!--                        <div class="footer-widget gallery-widget">-->
<!--                            <h2>Instagram Feed</h2>-->
<!--                            <div class="clearfix">-->
<!--                                <figure class="image"><a href="--><?php //echo THEMEURL ?><!--/images/resource/blog-image-4.jpg" class="lightbox-image" data-fancybox-group="fancybox" title="Caption Here"><img src="--><?php //echo THEMEURL ?><!--/images/resource/footer-gallery-1.jpg" alt=""></a></figure>-->
<!--                                <figure class="image"><a href="--><?php //echo THEMEURL ?><!--/images/resource/blog-image-5.jpg" class="lightbox-image" data-fancybox-group="fancybox" title="Caption Here"><img src="--><?php //echo THEMEURL ?><!--/images/resource/footer-gallery-2.jpg" alt=""></a></figure>-->
<!--                                <figure class="image"><a href="--><?php //echo THEMEURL ?><!--/images/resource/blog-image-6.jpg" class="lightbox-image" data-fancybox-group="fancybox" title="Caption Here"><img src="--><?php //echo THEMEURL ?><!--/images/resource/footer-gallery-3.jpg" alt=""></a></figure>-->
<!--                                <figure class="image"><a href="--><?php //echo THEMEURL ?><!--/images/resource/blog-image-7.jpg" class="lightbox-image" data-fancybox-group="fancybox" title="Caption Here"><img src="--><?php //echo THEMEURL ?><!--/images/resource/footer-gallery-4.jpg" alt=""></a></figure>-->
<!--                                <figure class="image"><a href="--><?php //echo THEMEURL ?><!--/images/resource/blog-image-8.jpg" class="lightbox-image" data-fancybox-group="fancybox" title="Caption Here"><img src="--><?php //echo THEMEURL ?><!--/images/resource/footer-gallery-5.jpg" alt=""></a></figure>-->
<!--                                <figure class="image"><a href="--><?php //echo THEMEURL ?><!--/images/resource/blog-image-9.jpg" class="lightbox-image" data-fancybox-group="fancybox" title="Caption Here"><img src="--><?php //echo THEMEURL ?><!--/images/resource/footer-gallery-6.jpg" alt=""></a></figure>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->

                    <!--Footer Column-->
<!--                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 column padd-left-60">-->
<!--                        <div class="footer-widget links-widget">-->
<!--                            <h2>Featured links</h2>-->
<!--                            <div class="row clearfix">-->
<!--                                <div class="col-md-6 col-sm-6 col-xs-12">-->
<!--                                    <ul>-->
<!--                                        <li><a href="#">About</a></li>-->
<!--                                        <li><a href="#">Testimonial</a></li>-->
<!--                                        <li><a href="#">Team Members</a></li>-->
<!--                                    </ul>-->
<!--                                </div>-->
<!---->
<!--                                <div class="col-md-6 col-sm-6 col-xs-12">-->
<!--                                    <ul>-->
<!--                                        <li><a href="#">What We Do</a></li>-->
<!--                                        <li><a href="#">New Products</a></li>-->
<!--                                        <li><a href="#">Our  Careere</a></li>-->
<!--                                    </ul>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                            <br>-->
<!--                            <div class="social-links">-->
<!--                                <h3>Follow Us On:</h3>-->
<!--                                <div class="links">-->
<!--                                    <a href="#"><span class="fa fa-facebook-official"></span></a>-->
<!--                                    <a href="#"><span class="fa fa-twitter"></span></a>-->
<!--                                    <a href="#"><span class="fa fa-google-plus"></span></a>-->
<!--                                    <a href="#"><span class="fa fa-instagram"></span></a>-->
<!--                                    <a href="#"><span class="fa fa-vimeo-square"></span></a>-->
<!--                                    <a href="#"><span class="fa fa-youtube-play"></span></a>-->
<!--                                    <a href="#"><span class="fa fa-dropbox"></span></a>-->
<!--                                </div>-->
<!---->
<!--                            </div>-->
<!---->
<!--                        </div>-->
<!--                    </div>-->


                </div>

            </div>
        </div>

        <!--Footer Bottom-->
        <div class="footer-bottom">
            <div class="auto-container">
                <div class="copyright">Copyrights &copy; <?php echo date('Y')?>. <?php echo $page->printSiteName(); ?>.</div>
            </div>
        </div>

    </footer>

</div>
<!--End pagewrapper-->

<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-long-arrow-up"></span></div>



<script src="<?php echo THEMEURL; ?>/js/bootstrap.min.js"></script>
<script src="<?php echo THEMEURL; ?>/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="<?php echo THEMEURL; ?>/js/revolution.min.js"></script>
<script src="<?php echo THEMEURL; ?>/js/jquery.fancybox.pack.js"></script>
<script src="<?php echo THEMEURL; ?>/js/jquery.fancybox-media.js"></script>
<script src="<?php echo THEMEURL; ?>/js/mixitup.js"></script>
<script src="<?php echo THEMEURL; ?>/js/owl.js"></script>
<script src="<?php echo THEMEURL; ?>/js/wow.js"></script>
<script src="<?php echo THEMEURL; ?>/js/script.js"></script>

<!--Google Map APi Key-->
<script src="http://maps.google.com/maps/api/js?key="></script>
<script src="<?php echo THEMEURL; ?>/js/map-script.js"></script>
<!--End Google Map APi-->

</body>
</html>